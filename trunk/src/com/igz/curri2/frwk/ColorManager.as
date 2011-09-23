package com.igz.curri2.frwk 
{
	/**
	 * ...
	 * @author 
	 */
	public class ColorManager
	{
		private var _Style:Object;
		public function ColorManager(p_object:Object) 
		{
			_Style = p_object;
			
		}
		
		public function $GetColorOfTag(p_element:String):Number
		{
			var color:Number=0x00ff00;trace("----getting color [" + p_element + "]");
			var s:String = (_Style[p_element] as String);
		//	trace("----getting color [" + p_element + "]=[" + s + "]");
			if (s != null)
			{
				color = Number("0x"+s);
			}
			return color;
	/*		if (p_element == "line_scuare_1")
			{
				return 0x959595;	
			}
			if (p_element == "line_content_1")
			{
				return 0xBBBBBB;
			}
			if (p_element == "line_scuare_2")
			{
				return 0xACACAC;	
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
			if (p_element == "soft_sep")
			{
				return 0x85A5CC;
			}	
			if (p_element == "hard_sep")
			{
				return 0xD0E4F2;
			}						
			return 0x00ff00;
*/
			}
		
	}

}