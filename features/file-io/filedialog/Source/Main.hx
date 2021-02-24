package;

import lime.app.Application;
import lime.ui.FileDialog;
import lime.ui.FileDialogType;
import lime.utils.Resource;
import lime.ui.KeyCode;
import lime.ui.KeyModifier;

import haxe.io.Bytes;

class Main extends Application
{		
	var fd:FileDialog;
	var bytes:Bytes;
	
	public function new () {
		super ();
	}

	override public function onWindowCreate():Void 
	{
		super.onWindowCreate();
		
		bytes = Bytes.ofString("testdata");
		
		fd = new FileDialog();
		
        fd.onSelect.add (onSelect);
        fd.onSelectMultiple.add (onSelectMultiple);
        fd.onOpen.add (onOpen);
        fd.onSave.add (onSave);
        fd.onCancel.add (onCancel);
		
		trace("press Key:");
		trace("1 - to browse a file");
		trace("2 - to browse multiple files");
		trace("3 - to browse a directory");
		trace("4 - to open a file");
		trace("5 - to save into a file");
	}
	
	public function onSelect(path:String):Void
	{
		trace("--- onSelect ---");
		trace ("path: " + path);
	}
	
	public function onSelectMultiple(pathArray:Array<String>):Void
	{
		trace("--- onSelectMultiple ---");
		for (path in pathArray)
		{
			trace ("path: "+ path);			
		}
	}

	public function onOpen(resource:Resource):Void
	{
		trace("--- onOpen ---");
		trace ("file content: " + resource);
		bytes = resource;
	}
	
	public function onSave(path:String):Void
	{
		trace("--- onSave ---");
		trace ("path: " + path);
	}
	
	public function onCancel():Void
	{
		trace("--- onCancel ---");
	}
	
	public override function onKeyUp (key:KeyCode, modifier:KeyModifier):Void {
		
		switch (key) {
			
			case NUMBER_1: fd.browse(FileDialogType.OPEN, null, null, "Select a file");
			case NUMBER_2: fd.browse(FileDialogType.OPEN_MULTIPLE, null, null, "Select multiple files");
			case NUMBER_3: fd.browse(FileDialogType.OPEN_DIRECTORY, null, null, "Select a directory");
			case NUMBER_4: fd.open(null, null, "Open a file");
			case NUMBER_5: fd.save(bytes, null, null, "Save file as");
			default:
			
		};
		
	}

}