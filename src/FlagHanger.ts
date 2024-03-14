import { tree_value, Node } from "./parser.js"

enum Flags {
  None = 0,
  // Atomic flags
  PreWrap = 1 << 0,
  Interpolate = 1 << 1,
  SingleChild = 1 << 2,
  FirstChild = 1 << 3,

  // HTMLELement flags
  ParentTextBlock = 1 << 4,
  TextBlock = 1 << 5,
  BlockExpansion = 1 << 6,
  HasNewLines = 1 << 7,
}

interface FlagHanger { hang_flags(entry: tree_value, previous_child: tree_value): Flags }

class AtomicFlagHanger implements FlagHanger {
  hang_flags({ node: parent_node, flags: parent_flags, child_index }: tree_value, previous_child: tree_value): Flags {
    let new_flags = Flags.None
    if (child_index == 0) new_flags |= Flags.FirstChild
    if (parent_node.childNodes.length == 1) new_flags |= Flags.SingleChild
    if ((parent_flags & Flags.PreWrap) || (parent_node.nodeName.toLowerCase() == "pre")) new_flags |= Flags.PreWrap
    return new_flags
  }

}

function has_flag(source: Flags, target: Flags): boolean { return (source & target) == target }
function has_any_flag(source: Flags, target: Flags) { return (source & target) != 0 }

class ComplexFlagHanger extends AtomicFlagHanger {
  constructor(private inline_elements: string) { super() }
  can_interpolate(node: Node, parent_flags: Flags, previous_child: tree_value | undefined): boolean {
    if (parent_flags & Flags.Interpolate) return true
    switch (node.nodeType) {
      case Node.TEXT_NODE:
        return previous_child == undefined || previous_child.node.nodeType == Node.TEXT_NODE || (previous_child.flags & Flags.Interpolate) != 0
      case Node.ELEMENT_NODE:
        const element = node as HTMLElement

        const is_inline_element = element.matches(this.inline_elements)
        const has_only_inline_elements = element.querySelector(`*:not(${this.inline_elements})`) == null
        return is_inline_element && has_only_inline_elements
    }
    return false

  }
  can_make_text_block(node: Node, flags: Flags): boolean {
    if (node.nodeType != Node.TEXT_NODE) return false
    const has_element_with_many_lines = Array.from(node.childNodes).some((v) => v.nodeType != Node.TEXT_NODE && v.textContent.includes('\n'))
    return has_flag(flags, Flags.PreWrap | Flags.FirstChild) &&
      (node.nodeValue.includes('\n') || has_flag(flags, Flags.SingleChild) == false) &&
      has_element_with_many_lines == false
  }
  can_make_parent_text_block(element: HTMLElement, flags: Flags): boolean {
    if (has_flag(flags, Flags.PreWrap) == false || has_flag(flags, Flags.TextBlock)) return false
    for (const child of element.children)
      if (child.textContent.includes('\n') || child.matches(this.inline_elements) == false) return false

    return true
  }
  can_block_expansion(node: Node) { return node.childNodes.length == 1 && node.childNodes[0].nodeType == Node.ELEMENT_NODE }

  hang_flags(entry: tree_value, previous_child: tree_value): Flags { // Get parent node and previous child of node
    const { node: parent_node, flags: parent_flags, child_index } = entry
    let new_flags = super.hang_flags(entry, previous_child)

    if (has_any_flag(parent_flags, Flags.ParentTextBlock | Flags.TextBlock)) new_flags |= Flags.TextBlock

    const child_node = parent_node.childNodes[child_index]
    if (child_node.textContent.includes('\n')) new_flags |= Flags.HasNewLines

    if (child_node.nodeType == Node.ELEMENT_NODE) {
      const element = child_node as HTMLElement
      if (this.can_make_parent_text_block(element, new_flags)) new_flags |= Flags.ParentTextBlock
      if (this.can_block_expansion(parent_node)) new_flags |= Flags.BlockExpansion
    }

    if (has_any_flag(new_flags, Flags.BlockExpansion | Flags.ParentTextBlock | Flags.HasNewLines) == false &&
      this.can_interpolate(child_node, parent_flags, previous_child)) new_flags |= Flags.Interpolate
    return new_flags
  }
}

export { Flags, ComplexFlagHanger, AtomicFlagHanger as SimpleFlagHanger, FlagHanger, has_flag, has_any_flag }
