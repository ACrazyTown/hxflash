package animate.dom;

import haxe.xml.Access;

class DOMFrame extends BaseDOMItem
{
    public var index(default, null):Int = 0;
    public var duration(default, null):Int = 0;
    // keyMode

    public var elements(default, null):Array<BaseDOMItem> = [];

    public function new(project:XFLProject, xmlData:String)
    {
        super(project);

        var access:Access = new Access(Xml.parse(xmlData));
        var df:Access = access.node.resolve("DOMFrame");

        if (df.has.resolve("index"))
            this.index = Std.parseInt(df.att.resolve("index"));
        if (df.has.resolve("duration"))
            this.duration = Std.parseInt(df.att.resolve("duration"));

        // todo parse DOMShape
        for (element in df.nodes.resolve("elements"))
        {
            // probably very bad workaround, parse once to get name?
            var elementData:String = element.innerHTML;
            var elementName:String = Xml.parse(element.innerHTML).firstElement().nodeName;

            switch (elementName)
            {
                case "DOMShape":
                    elements.push(new DOMShape(_project, elementData));

                case "DOMSymbolInstance":
                    elements.push(new DOMSymbolInstance(_project, elementData));

                default:
                    throw "[DOMFrame] Unknown element: " + elementName;
            }
        }
    }
}