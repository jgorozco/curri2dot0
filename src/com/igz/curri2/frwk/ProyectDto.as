package com.igz.curri2.frwk 
{
	import igz.fleaxy.pattern.Dto;
	import igz.fleaxy.util.DateTimeFormat;
	import igz.fleaxy.util.DateTimeUtil;
	
	/**
	 * ...
	 * @author ...
	 */
	public class ProyectDto extends Dto
	{

		public var Name:String = "";
		public var Company:String="";
		public var Category:String="";
		public var SubCategory:String="";
		public var InitDate:Date=new Date();
		public var EndDate:Date = new Date();
		public var Description:String="";
		public var Company:String="";
		
		
		
		public function ProyectDto() 
		{
			
		}

		public function $LoadFromJson(p_object:Object):void
		{
			this.Name = p_object.Name;
			this.Category = p_object.Category;
			this.Company = p_object.Company;
			this.Description = p_object.Description;
			if (DateTimeUtil.$IsDateTimeType(this.EndDate)){
				this.EndDate = DateTimeUtil.$ToDate(p_object.EndDate, DateTimeFormat.DEFAULT_DATE);
			}
			if (DateTimeUtil.$IsDateTimeType(this.InitDate)){			
				this.InitDate = DateTimeUtil.$ToDate(p_object.InitDate,DateTimeFormat.DEFAULT_DATE);
			}
			this.SubCategory = p_object.SubCategory;
		}		
		
		
	}

}