var halloweenBG:FlxSprite;
function onLoad()
{
	halloweenBG = new FlxSprite(-200, -100);
	halloweenBG.frames = Paths.getSparrowAtlas('stages/spooky/halloween_bgD3');
	halloweenBG.animation.addByPrefix('idle', 'halloweem bg0', 24, false);
	halloweenBG.animation.addByPrefix('strike', 'halloweem bg lightning strike', 24, false);
	halloweenBG.animation.play('idle');
	halloweenBG.scrollFactor.set(1,1);
	add(halloweenBG);
}
var lightningStrikeBeat:Int = 0;
var lightningOffset:Int = 8;

function onBeatHit(){
	if(FlxG.random.bool(5) && curBeat > lightningStrikeBeat + lightningOffset)
	{
 	strike();
	}
}

function strike()
{
	halloweenBG.animation.play('strike');
	FlxG.sound.play(Paths.sound("thunder_" + FlxG.random.int(1,2)));
}