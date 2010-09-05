package com.igz.curri2.frwk 
{
	import igz.fleaxy.pattern.Dto;
	/**
	 * ...
	 * @author ...
	 */
	public class PersonalDataDto extends Dto
	{
		public var Name:String = "";
		
		public var Phone:String="";
		public var Address:String="";
		public var University:String="";
		public var DriveLicense:String="";
		public var Poblation:String="";
		public var Nationality:String="";
		public var Mail:String="";
		public var Photo:String="";
		
	
		public function PersonalDataDto() 
		{
			
		}
		
		public function $LoadFromJson(p_object:Object):void
		{
		this.Name = p_object.Name;
		this.Address = p_object.Address;
		this.DriveLicense = p_object.DriveLicense;
		this.Mail = p_object.Mail;
		this.Nationality = p_object.Nationality;
		this.Phone = p_object.Phone;
		this.Photo = p_object.Photo;
		this.Poblation = p_object.Poblation;
		this.University = p_object.University;
		}
	}

}