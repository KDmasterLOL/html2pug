import { JSDOM } from "jsdom";
const Node = new JSDOM().window.Node;
var Flags;
(function (Flags) {
    Flags[Flags["None"] = 0] = "None";
    Flags[Flags["PreWrap"] = 1] = "PreWrap";
    Flags[Flags["Interpolate"] = 2] = "Interpolate";
    Flags[Flags["SingleChild"] = 4] = "SingleChild";
    Flags[Flags["FirstChild"] = 8] = "FirstChild";
    Flags[Flags["TextBlock"] = 16] = "TextBlock";
})(Flags || (Flags = {}));
class Parser {
    pug = '';
    root;
    options;
    inline_elements = "a, b, i, em , strong, code, span";
    constructor(root, options) {
        this.root = root;
        this.options = options;
    }
    getIndent(level = 0) { return this.options.indentStyle.repeat(level); }
    parse() {
        if (this.options.simple)
            this.simple_node_convert(this.root);
        else
            this.pug = this.convert_tree(this.root);
        return this.pug.substring(1);
    }
    can_interpolate(node, previous_child) {
        if (previous_child?.flags & Flags.Interpolate)
            return true;
        switch (node.nodeType) {
            case Node.TEXT_NODE:
                return previous_child == undefined || previous_child.node.nodeType == Node.TEXT_NODE;
            case Node.ELEMENT_NODE:
                const element = node;
                const is_inline_element = element.matches(this.inline_elements);
                const has_only_inline_elements = element.querySelector(`*:not(${this.inline_elements})`) == null;
                return is_inline_element && has_only_inline_elements;
        }
        return false;
    }
    hang_flags({ node, flags, child_index }, previous_child) {
        let new_flags = Flags.None;
        if (child_index == 0)
            new_flags |= Flags.FirstChild;
        if (this.can_interpolate(node, previous_child))
            new_flags |= Flags.Interpolate;
        if (node.childNodes.length == 1)
            new_flags |= Flags.SingleChild;
        if ((flags & Flags.PreWrap)
            ||
                (node.nodeName.toLowerCase() == "pre"))
            new_flags |= Flags.PreWrap;
        return new_flags;
    }
    has_block_expansion(element) {
        return element.childNodes.length == 1 && element.childNodes[0].nodeType == Node.ELEMENT_NODE; // Has only only one child node that is `ELEMENT_NODE`
    }
    has_pre_wrap(node) {
        let b = node;
        while (b != undefined)
            if (b.nodeName == "PRE")
                return true;
            else
                b = b.parentElement;
        return false;
    }
    simple_node_convert(node, level = 0) {
        const add = (str) => this.pug += '\n' + this.getIndent(level) + str;
        switch (node.nodeType) {
            case Node.TEXT_NODE:
                add('| ' + node.nodeValue);
                break;
            case Node.DOCUMENT_FRAGMENT_NODE:
                node.childNodes.forEach(n => this.simple_node_convert(n, level));
                break;
            case Node.ELEMENT_NODE: add(node.nodeName.toLowerCase());
            default: node.childNodes.forEach(n => this.simple_node_convert(n, level + 1));
        }
    }
    convert_tree(tree) {
        let result = "";
        const can_continue = ({ node, flags, child_index }) => {
            const is_text_node = node.nodeType == Node.TEXT_NODE;
            if (is_text_node || child_index >= node.childNodes.length) { // Text node or is out of children
                if (!is_text_node && (flags & Flags.Interpolate))
                    result += "]"; // End interpolation
                return false;
            }
            return true;
        };
        let tree_stack = [{ node: tree, child_index: 0, flags: Flags.None }], previous_child;
        while (tree_stack.length > 0) {
            const last_stack_entry = tree_stack[tree_stack.length - 1];
            const { node, child_index, flags } = last_stack_entry;
            if (child_index == 0)
                previous_child = undefined;
            if (can_continue(last_stack_entry) == false) {
                previous_child = tree_stack.pop();
                continue;
            }
            const child = node.childNodes[child_index], level = tree_stack.length;
            let prefix = "", value = "", child_flags = this.hang_flags(last_stack_entry, previous_child), child_entry = {
                node: child,
                child_index: 0,
                flags: child_flags
            };
            switch (child.nodeType) {
                case Node.TEXT_NODE:
                    {
                        const last_interpolated = previous_child && ((previous_child.flags & Flags.Interpolate) != 0);
                        const can_interpolate = (child_flags & Flags.FirstChild) || last_interpolated;
                        const can_create_text_block = (child_flags & (Flags.PreWrap | Flags.FirstChild)) == (Flags.PreWrap | Flags.FirstChild)
                            &&
                                (child.nodeValue.includes('\n') || (child_flags & Flags.SingleChild) == 0);
                        if (can_create_text_block)
                            prefix = '.\n' + this.getIndent(level);
                        else if (can_interpolate)
                            prefix = child_flags & Flags.FirstChild ? ' ' : '';
                        else
                            prefix = '\n' + this.getIndent(level) + '| ';
                    }
                    value = child.nodeValue;
                    if (child_flags & Flags.PreWrap)
                        value = value.replaceAll('\n', '\n' + this.getIndent(level));
                    break;
                case Node.ELEMENT_NODE:
                    const element = child;
                    if (child_flags & Flags.SingleChild)
                        prefix = ": ";
                    else if (child_flags & Flags.Interpolate)
                        prefix = "#[";
                    else
                        prefix = "\n" + this.getIndent(level);
                    value = element.tagName.toLowerCase();
                    break;
            }
            tree_stack.push({
                node: child,
                child_index: 0,
                flags: child_flags
            });
            if (child_flags & Flags.TextBlock) {
                const new_line = '\n' + this.getIndent(level + 1);
                prefix = child_flags & Flags.FirstChild ? '.' + new_line : '';
                value.replaceAll('\n', new_line);
            }
            result += prefix + value;
            last_stack_entry.child_index += 1;
        }
        return result;
    }
    convert_text_node({ node, flags }, level) {
        const can_create_text_block = (flags & (Flags.PreWrap | Flags.FirstChild)) == (Flags.PreWrap | Flags.FirstChild)
            &&
                (node.nodeValue.includes('\n') || (flags & Flags.SingleChild) == 0);
        let prefix = '\n' + this.getIndent(level) + '| ';
        if (can_create_text_block)
            prefix = '.\n' + this.getIndent(level);
        else if (flags & Flags.Interpolate)
            prefix = flags & Flags.FirstChild ? ' ' : '';
        let value = node.nodeValue;
        if (flags & Flags.PreWrap)
            value = value.replaceAll('\n', '\n' + this.getIndent(level));
        return { value, prefix };
    }
    /*
     * Returns a Pug node name with all attributes set in parentheses.
     */
    convert_attributes(attributes) {
        let result = "";
        // Add CSS selectors to pug node and append any element attributes to it
        let buffer = [];
        for (const { name, value } of attributes) {
            switch (name) {
                case 'id':
                    result += `#${value}`;
                    break;
                case 'class':
                    result += `.${value.split(' ').join('.')}`;
                    break;
                default: {
                    const val = value.replace(/'/g, "\\'"); // Escape single quotes (\') in attribute values
                    const quote = this.options.quoteStyle;
                    buffer.push(val ? `${name}=${quote}${val}${quote}` : name);
                    break;
                }
            }
            if (buffer.length != 0)
                result += '(' + buffer.join(this.options.separatorStyle) + ')';
            return result;
        }
    }
    convert_html_element_open_tag(node) {
        const { tagName, attributes } = node;
        let pugNode = "";
        const is_true = val => val == true;
        const has_selector = ['id', 'class'].map(attr_name => node.hasAttribute(attr_name)).some(is_true);
        {
            const has_shorhand = (tagName === 'div') && has_selector; // Shorhand for div if a selector is present e.g. div#form() -> #form()
            if (has_shorhand == false)
                pugNode = tagName.toLowerCase(); // Don't add div tag if shorhand present
        }
        {
            const has_attributes = has_selector == true || attributes.length != 0;
            if (has_attributes)
                pugNode += this.convert_attributes(node.attributes);
        }
        return pugNode;
    }
    /**
     * formatPugNode applies the correct indent for the current line,
     * and formats the value as either as a single or multiline string.
     *
     * @param {String} node - The pug node (e.g. header(class='foo'))
     * @param {String} value - The node's value
     * @param {Number} level - Current tree level to generate indent
     * @param {String} blockChar - The character used to denote a multiline value
     */
    formatPugNode(node, value = '', level, blockChar = '.') {
        const indent = this.getIndent(level);
        const result = `${indent}${node}`;
        const lines = value.split('\n');
        // Create an inline node
        if (lines.length <= 1) {
            return value.length ? `${result} ${value}` : result;
        }
        // Create a multiline node
        const indentChild = this.getIndent(level + 1);
        const multiline = lines.map(line => `${indentChild}${line}`).join('\n');
        return `${result}${blockChar}\n${multiline}`;
    }
    createDoctype(node, level) {
        throw new Error("Not impelemented"); // TODO: Implement doctype conversion
        const indent = this.getIndent(level);
        return `${indent}doctype html`;
    }
    createComment(node, level) {
        throw new Error("Not impelemented"); // TODO: Implement commentary conversion
    }
    /**
     * createElement formats a generic HTML element.
     */
    createElement(node, level) {
        const pugNode = this.convert_html_element_open_tag(node);
        throw new Error("Not impelemented"); // TODO: Implement element conversion
    }
}
export default Parser;
//# sourceMappingURL=parser.js.map