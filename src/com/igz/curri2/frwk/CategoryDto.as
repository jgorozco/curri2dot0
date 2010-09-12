package com.igz.curri2.frwk 
{
	import igz.fleaxy.pattern.Dto;
	
	/**
	 * ...
	 * @author 
	 */
	public class CategoryDto extends Dto
	{
		public var $Name:String;
		public var $Count:int;
		public var $Sons:Array;
		
		public function CategoryDto() 
		{
			$Name = "";
			$Count = 0;
			$Sons = new Array();
		}
		
		public function $AddSon(p_category:CategoryDto)
		{
			var add:Boolean = false;
		for  (var i:int; i < $Sons.length; i++ )
		{
			if (($Sons[i] as CategoryDto).$Name == p_category.$Name)
				{
					($Sons[i] as CategoryDto).$Increment();
					add = true;
				}
			
		}
		if (!add)
			{
				$Sons.push(p_category);
			}
			
		}
		
		public function $Increment():void
		{
		$Count = $Count + 1;	
		}
		
	}

}