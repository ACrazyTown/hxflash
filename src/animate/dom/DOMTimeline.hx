package animate.dom;

import haxe.xml.Access;

class DOMTimeline extends BaseDOMItem
{
    public var name(default, null):String;

    public var layer(get, never):DOMLayer;
    private inline function get_layer():DOMLayer
        return layers.length > 0 ? layers[0] : null; // idk if i need this fialsafe

    public var layers:Array<DOMLayer> = [];

    public function new(project:XFLProject, xmlData:String)
    {
        super(project);

        var access:Access = new Access(Xml.parse(xmlData));
        var dt:Access = access.node.resolve("DOMTimeline");

        this.name = dt.att.resolve("name");
        
        for (layer in dt.nodes.resolve("layers"))
        {
            var dl:DOMLayer = new DOMLayer(_project, layer.innerHTML);
            layers.push(dl);
        }
    }   
}
