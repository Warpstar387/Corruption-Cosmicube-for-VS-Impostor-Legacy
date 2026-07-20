var school:FlxSprite;
function onLoad()
{
	school = new FlxSprite();
	school.frames = Paths.getSparrowAtlas('stages/roots/animatedEvilSchool');
	school.animation.addByPrefix('idle', 'normal', 24, true);
	school.animation.addByPrefix('bg2', 'background 2 instance 1', 24, true);
	school.updateHitbox();
	school.animation.play('idle');
	school.scrollFactor.set(0.8, 0.9);
    	school.x = 450;
    	school.y = 250;
	school.scale.set(6, 6);
	add(school);
}

function onStepHit()
{
	if(curStep == 512)
	{
	school.animation.play('bg2');
	}
	if(curStep == 640)
	{
	school.animation.play('idle');
	}
	if(curStep == 896)
	{
	school.animation.play('bg2');
	}

}