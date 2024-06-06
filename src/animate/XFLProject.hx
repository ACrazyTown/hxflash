package animate;

import openfl.Assets;
import animate.dom.DOMDocument;

import haxe.io.Path;

class XFLProject
{
    public var document:DOMDocument;

    public var path:String;

    /**
     * Loads an XFL project from folder.
     * @param path The path to the folder with all the XFL data.
     */
    public function new(path:String)
    {
        var processedPath:String = Path.normalize(path);
        this.path = processedPath;

        document = new DOMDocument(Assets.getText('$processedPath/DOMDocument.xml'), this);
    }
}
