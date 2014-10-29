package com.neulion.logging
{
	import mx.controls.TextArea;
	import mx.core.mx_internal;
	import mx.logging.*;
	import mx.logging.targets.LineFormattedTarget;
	
	use namespace mx_internal;
	
	public class TextAreaLogTarget extends LineFormattedTarget
	{
		public function TextAreaLogTarget()
		{
			super();
		}
		
		public function set console(val:TextArea):void
		{
			if(val != null && val != this._console){
				this._console = val;
				this._console.text = this._cachedLog;
			}
		}
		
		override public function logEvent(event:LogEvent):void
		{
	        var date:String = ""
	        if (includeDate || includeTime)
	        {
	            var d:Date = new Date();
	            if (includeDate)
	            {
	                date = Number(d.getMonth() + 1).toString() + "/" +
	                       d.getDate().toString() + "/" + 
	                       d.getFullYear() + fieldSeparator;
	            }   
	            if (includeTime)
	            {
	                date += padTime(d.getHours()) + ":" +
	                        padTime(d.getMinutes()) + ":" +
	                        padTime(d.getSeconds()) + "." +
	                        padTime(d.getMilliseconds(), true) + fieldSeparator;
	            }
	        }
	        
	        var level:String = "";
	        if (includeLevel)
	        {
	            level = "[" + LogEvent.getLevelString(event.level) +
	                    "]" + fieldSeparator;
	        }
	
	        var category:String = includeCategory ?
	                              "[" + ILogger(event.target).category + "]" + fieldSeparator :
	                              "";
	
	        internalLog(date + level + category + "\t" + event.message);			
		}

		override mx_internal function internalLog(message:String):void
		{
			if(this._console == null){
				this._cachedLog += message + "\n";
			}else{
				this._console.text += message + "\n";
			}
		}
		
	    private function padTime(num:Number, millis:Boolean = false):String
	    {
	        if (millis)
	        {
	            if (num < 10)
	                return "00" + num.toString();
	            else if (num < 100)
	                return "0" + num.toString();
	            else 
	                return num.toString();
	        }
	        else
	        {
	            return num > 9 ? num.toString() : "0" + num.toString();
	        }
	    }
		
		private var _cachedLog:String = "";
		private var _console:TextArea;	
	}
}