package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Denzel Dap
	 */
	public class Missile extends Sprite
	{
		public var mSpeed: int = 5;
		public var destroy:Boolean = false;
		
		public function Missile() 
		{
			
			var theMissile:Laser = new Laser();
			addChild(theMissile);
		}
		
		public function update(e:Event):void
		{
			this.y += mSpeed;
			if (this.y > 500)
			{
				destroy = true;
			}
		}
	}
	
	

}