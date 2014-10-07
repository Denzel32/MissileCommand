package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Denzel Dap
	 */
	public class Tower extends Sprite	{	
		private var theTower:Tower;
		
		public function Tower() 
		{
			theTower = new Tower();
			addChild(theTower);
			theTower.x = 200;
			theTower.y = 600;
		}
		
	}

}