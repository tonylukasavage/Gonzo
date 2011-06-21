package com.savagelook.Gonzo
{
	import flash.events.Event;
	
	public class GonzoSeparatorEvent extends Event
	{
		public static const SEPARATOR_MOVED:String = "gonzoSeparatorMoved";
		public var stageX:Number;
		
		public function GonzoSeparatorEvent(type:String, stageX:Number, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.stageX = stageX;
		}
		
		override public function clone():Event {
			return new GonzoSeparatorEvent(type, stageX);
		}
	}
}