package com.igz.curri2.ui 
{
	import com.igz.curri2.frwk.ProyectDto;
	import igz.fleaxy.ui.LinkUi;
	import igz.fleaxy.ui.text.LabelUi;
	import igz.fleaxy.ui.text.TextUi;
	/**
	 * ...
	 * @author 
	 */
	public class ProyectSheetUi
	{
		private var _Title:LabelUi;
		private var _Company:LabelUi;
		private var _Category:LabelUi;
		private var _SubCategory:LabelUi;
		private var _DetailsLabel:LabelUi;
		private var _DetailsText:TextUi;
		private var _WebLink:LinkUi;
		
		private var _SheetWidth:Number;
		private var _SheetHeight:Number;	
		
		public function ProyectSheetUi(p_proyectDTO:ProyectDto) 
		{
			_Title = new LabelUi(p_proyectDTO.Name, "CenterH1");
			_Company = new LabelUi(p_proyectDTO.Name, "CenterH1");
			_Category = new LabelUi(p_proyectDTO.Name, "CenterH1");
			_SubCategory = new LabelUi(p_proyectDTO.Name, "CenterH1");
			_DetailsLabel = new LabelUi(p_proyectDTO.Name, "CenterH1");
			_SheetWidth = 200;
			
		}
		
		public function $Recolocate():void
		{
		_Title.x = 20;	
		_Title.y = 30;
		_Company.x = 30;
		_Company.y = 50;
		_Category.x = 35;
		_Category.y = 70;
		}
		
	}

}