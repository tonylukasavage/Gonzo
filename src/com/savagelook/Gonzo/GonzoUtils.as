package com.savagelook.Gonzo
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;

	public class GonzoUtils
	{
		public function GonzoUtils()
		{
		}
		
		public static function stripNonPrintableCharacters(str:String):String {
			var newStr:String = "";
			for (var i:uint = 0; i < str.length; i++) {
				var char:int = str.charCodeAt(i);
				if ((char < 32 || char > 126) && (char != 9 && char != 10 && char != 13)) {
					continue;
				}
				newStr += String.fromCharCode(char);
			}
			return newStr;
		}
		
		public static function readStringFromFile(file:File):String {
			var fs:FileStream = new FileStream();
			fs.open(file, FileMode.READ);
			var text:String = stripNonPrintableCharacters(fs.readMultiByte(fs.bytesAvailable, "utf-8"));
			fs.close();
			return text;
		}
		
		public static function readStringFromFilename(filename:String):String {
			return readStringFromFile(new File(filename));
		}
		
		public static function writeStringToFile(file:File, string:String):void {
			var fs:FileStream = new FileStream();
			fs.open(file, FileMode.WRITE);
			fs.writeMultiByte(stripNonPrintableCharacters(string), "utf-8");
			fs.close();
		}
		
		public static function writeStringToFilename(filename:String, string:String):void {
			writeStringToFile(new File(filename), string);
		}
	}
}