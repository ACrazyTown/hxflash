package animate;

import animate.dom.DOMSymbolItem;
import animate.dom.DOMTimeline;
import openfl.Assets;
import animate.dom.DOMDocument;

import haxe.io.Path;

class XFLProject
{
    /**
     * The DOMDocument instance.
     */
    public var document(default, null):DOMDocument;

    /**
     * The path to the folder with all the XFL data.
     */
    public var path(default, null):String;

    /**
     * Loads an XFL project from folder.
     * @param path The path to the folder with all the XFL data.
     */
    public function new(path:String)
    {
        var processedPath:String = Path.normalize(path);
        this.path = processedPath;

        document = new DOMDocument(this, Assets.getText('$processedPath/DOMDocument.xml'));
    }
}
