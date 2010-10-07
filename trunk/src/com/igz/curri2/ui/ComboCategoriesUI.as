package com.igz.curri2.ui 
{
	import com.greensock.TweenLite;
	import com.igz.curri2.frwk.CategoryDto;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author 
	 */
	public class ComboCategoriesUI extends Sprite
	{
		public var Categorie:CategoriesUi;
		public var SubCategorie:CategoriesUi;	
		public var Timeline:TimeLineUi;
		
		public function ComboCategoriesUI() 
		{
			var setting:Object = new Object();
			setting["parent"] = this;
			setting["principal"] = true;
			setting["color"] = 0xFFFFFF*Math.random();			
			Categorie = new CategoriesUi(setting);
			var setting2:Object = new Object();
			setting2["parent"] = this;
			setting2["principal"] = false;
			setting2["color"] = 0xFFFFFF*Math.random();
			SubCategorie = new CategoriesUi(setting2);	
			addChild(SubCategorie);
			addChild(Categorie);
			SubCategorie.x = SubCategorie.width;
			Categorie.x = 0;
		}
		
		public function $AddCategorie(p_categories:Array):void
		{
			Categorie.$ClearAllCategories();
			for each (var itm:CategoryDto in p_categories)
			{
				Categorie.$AddCategorie(itm);
			}
		}
		
		public function $AddSubCategorie(p_categories:Array):void
		{
			SubCategorie.$ClearAllCategories();
			for each (var itm:CategoryDto in p_categories)
			{
				SubCategorie.$AddCategorie(itm);
			}			
		}
		
		public function $ShowCategorie():void
		{
			TweenLite.to(Categorie, 0.5, { x:0} )	;
			TweenLite.to(SubCategorie, 0.5, { x:-SubCategorie.width} )	;
		}

		public function $HideCategorie():void
		{
			TweenLite.to(Categorie, 0.5, { x:40-Categorie.width} )	;
			TweenLite.to(SubCategorie, 0.5, { x:10} )	;
		}		
		
		
	}

}