package com.igz.curri2.ui 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author ...
	 */
	public class TimeLineUi extends Sprite
	{
		public var $Bg:Sprite;
		private var _CategorieList:CategoriesUi;
		
		
		public function TimeLineUi(p_categorie:CategoriesUi=null) 
		{
			$Bg = new Sprite();
			$Bg.graphics.beginFill(0x00ff000);
			$Bg.graphics.drawRect(0, 0, 500, 200);
			$Bg.graphics.endFill();
			addChild($Bg);
			if (p_categorie != null)
			{
			$SetCategorie(p_categorie);	
			}
			
		}
		
		public function $SetCategorie(p_categorie:CategoriesUi):void
		{
		_CategorieList = p_categorie;	
			
		}
		
	}

}