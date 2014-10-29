package com.neulion.logging
{
	import flash.utils.*;
	
	import mx.logging.*;
	
	public class LogUtil
	{
		public function LogUtil()
		{
		}
		
		public static function getLogger(value:*):ILogger
		{
			var category:String = getCategory(value);
			
			if(_loggerCached[category] == null){
				_loggerCached[category] = Log.getLogger(category);
			}
			
			return _loggerCached[category];
		}
		
		private static function getCategory(value:*):String
		{
			var className:String = getQualifiedClassName(value);
			return className.replace("$", ".").replace("::", ".");
		}
		
		private static var _loggerCached:Dictionary = new Dictionary();

	}
}