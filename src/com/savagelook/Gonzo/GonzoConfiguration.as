package com.savagelook.Gonzo
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.net.SharedObject;

	public class GonzoConfiguration implements IEventDispatcher
	{
		public static const CONFIG_SO_NAME:String = "config";
		
		public var values:GonzoConfigurationValues; 
		
		public function GonzoConfiguration()
		{
			dispatcher = new EventDispatcher(this);
			this.load();
		}
		
		public function load():void {
			var so:SharedObject = SharedObject.getLocal(CONFIG_SO_NAME);
			this.values = so.data.values as GonzoConfigurationValues;
			if (this.values == null) {
				this.values = new GonzoConfigurationValues();
			}
		}
		
		public function save():void {
			var so:SharedObject = SharedObject.getLocal(CONFIG_SO_NAME);
			so.data.values = this.values;
			so.flush();
		}
		
		public function apply():void {
			this.save();
			this.dispatchEvent(new Event(Event.CHANGE));
		}

		private function coalesce(... args):* {
			for (var arg:* in args) {
				if (arg != null && arg != undefined) {
					return arg;
				}
			}
			return null;
		} 
		
		private var dispatcher:EventDispatcher;
		public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void{
			dispatcher.addEventListener(type, listener, useCapture, priority);
		}
		
		public function dispatchEvent(evt:Event):Boolean{
			return dispatcher.dispatchEvent(evt);
		}
		
		public function hasEventListener(type:String):Boolean{
			return dispatcher.hasEventListener(type);
		}
		
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void{
			dispatcher.removeEventListener(type, listener, useCapture);
		}
		
		public function willTrigger(type:String):Boolean {
			return dispatcher.willTrigger(type);
		}
	}
}