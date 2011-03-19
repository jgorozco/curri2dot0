package com.igz.curri2.ui 
{
	import com.igz.curri2.frwk.ProyectDto;
	import flash.display.Sprite;
	import igz.fleaxy.ui.LinkUi;
	import igz.fleaxy.ui.text.LabelUi;
	import igz.fleaxy.ui.text.TextUi;
	/**
	 * ...
	 * @author 
	 */
	public class ProyectSheetUi extends Sprite
	{
		private var _Title:LabelUi;
		private var _Company:LabelUi;
		private var _Category:LabelUi;
		private var _SubCategory:LabelUi;
		private var _DetailsLabel:LabelUi;
		private var _DetailsText:TextUi;
		private var _WebLink:LinkUi;
		private var _Bg:Sprite;
		public static var $SheetWidth:Number=300;
		public static var _SheetHeight:Number;	
		
		public function ProyectSheetUi(p_proyectDTO:ProyectDto) 
		{
			_Bg = new Sprite();
			_Bg.graphics.beginFill(0x00ff00);
			_SheetHeight = 300;
			_Bg.graphics.drawRect(0, 0, $SheetWidth, _SheetHeight);
			addChild(_Bg);
			_Title = new LabelUi(p_proyectDTO.Name, "CenterH1");
			_Company = new LabelUi(p_proyectDTO.Company, "CenterH1");
			_Category = new LabelUi(p_proyectDTO.Category, "CenterH1");
			_SubCategory = new LabelUi(p_proyectDTO.SubCategory, "CenterH1");
			_DetailsLabel = new LabelUi("Detalles", "CenterH1");
			_DetailsText = new TextUi(p_proyectDTO.Description, "default6");
			_DetailsText.width = 200;
			_DetailsText.height = 200;
			addChild(_Title);
			addChild(_Company);
			addChild(_Category);
			addChild(_SubCategory);
			addChild(_DetailsLabel);
			addChild(_DetailsText);
			$Recolocate();
		}
		
		public function $Recolocate():void
		{
		_Title.x = 20;	
		_Title.y = 30;
		_Company.x = 30;
		_Company.y = 50;
		_Category.x = 35;
		_Category.y = 70;
		_SubCategory.x = 155;
		_SubCategory.y = 70;		
		_DetailsLabel.x = 35;
		_DetailsLabel.y = 100;
		_DetailsText.x = 35;
		_DetailsText.y = 125;
		
		}
		
	}

}