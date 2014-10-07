package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Denzel Dap
	 */
	public class Main extends Sprite 
	{	
		private var towerscript: Tower;
		private var aMissiles: Vector.<Missile>;
		private var myTimer:Timer = new Timer(1000, 0);
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			towerscript = new Tower();
			addChild(towerscript);
			
			aMissiles = new Vector.<Missile>();
			
			createMissile();
			createMissile();
			createMissile();
			
			addEventListener(Event.ENTER_FRAME, update);
			myTimer.addEventListener(TimerEvent.TIMER, timerTick);
			myTimer.start()
		}
		private function update(e:Event):void
		{
			
			for (var i: int = aMissiles.length - 1; i >= 0; i-- )
			{
				aMissiles[i].update();
				
				//check if destroyed
				if (aMissiles [i].destroy)
				{
					removeMissile(i);
				}
			}
			
		}
		
		private function createMissile():void
		{
			var missile1:Missile =  new Missile();
			missile1.x = Math.random() * stage.stageWidth;
			missile1.y = 0;
			stage.addChild(missile1);
			
			//adding it to the array.
			aMissiles.push(missile1);
		}
		
		private function removeMissile(i:int ):void
		{
			var missm:Missile = aMissiles[i];
			stage.removeChild(missm);
			aMissiles.splice(i, 1);
			trace("missile removed")
		}
		
		private function timerTick(e:TimerEvent):void
		{
			createMissile();
		}
		
	}
	
}