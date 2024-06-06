package animate.dom;

import haxe.ds.StringMap;
import animate.structs.DOMDocumentCreatorData;
import lime.utils.Assets;
import haxe.xml.Access;

class DOMDocument
{
    public var width(default, null):Int = 0;
    public var height(default, null):Int = 0;

    public var creatorData(default, null):DOMDocumentCreatorData;
    public var symbols:StringMap<DOMSymbolItem>;

    private var project:XFLProject;

    @:allow(animate.XFLProject)
    private function new(xmlData:String, project:XFLProject)
    {
        this.project = project;

        var _xml:Xml = Xml.parse(xmlData);
        var data:Access = new Access(_xml);

        var _document = data.node.resolve("DOMDocument");
        
        // Set size
        this.width = Std.parseInt(_document.att.width);
        this.height = Std.parseInt(_document.att.height);

        // Set creator data
        creatorData = {
            creatorInfo: _document.att.creatorInfo,
            platform: _document.att.platform,
            versionInfo: _document.att.versionInfo,
            majorVersion: _document.att.majorVersion,
            buildNumber: _document.att.buildNumber
        };

        // TODO: 3D position data?

        symbols = new StringMap<DOMSymbolItem>();

        var _symbols = _document.node.resolve("symbols");
        for (_symbolInclude in _symbols.nodes.resolve("Include"))
        {
            // NOTE:
            // Currently this just creates a DSI, not an actual "symbol" as it would be in Flash or whatever.
            // I will probably make a wrapper or something for this so it acts more as it would in the actual program rather than just being the actual XML data

            var href = _symbolInclude.att.resolve("href");
            var dsi:DOMSymbolItem = new DOMSymbolItem(Assets.getText('${project.path}/LIBRARY/$href'));

            symbols.set(dsi.name, dsi);
        }
    }
}
