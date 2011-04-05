package com.igz.curri2.frwk 
{
	/**
	 * ...
	 * @author 
	 */
	public class ThemeManager
	{
		
		public function ThemeManager() 
		{
			
		}
		
		public function $GetStyleColor(p_element:String):Number
		{
			var color:Number;
			if (p_element == "line_scuare_1")
			{
			return 0xACACAC;	
			}
			if (p_element == "line_content_1")
			{
				return 0xACACAC;
			}
			if (p_element == "line_scuare_2")
			{
				return 0x666666;	
			}
			if (p_element == "line_content_2")
			{
				return 0x9a9a9a;	
			}
			if (p_element == "bg_application")
			{
				
			}
			if (p_element == "bg_timeline")
			{
				return 0xeeeeee;
			}
			if (p_element == "line_timeline")
			{
				return 0xDDDDDD;
			}
			if (p_element == "bg_personal_data")
			{
				return 0xB1B1B1;
			}			
			if (p_element == "bg_personal_line")
			{
				return 0XD1D1D1;
			}			
			if (p_element == "close_button")
			{
				return 0XAA0000;
			}		
			if (p_element == "line_bg_proyect_sheet")
			{
				return 0XCACACA;
			}		
			if (p_element == "bg_proyect_sheet")
			{
				return 0XCCCCCC;
			}					
			
			return 0x00ff00;

			}
		
	}

}