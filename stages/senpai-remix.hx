var curbg:Int = 1;
var bgGirls:FlxSprite;
var bgSky:BGSprite;
var bgSchool:BGSprite;
var bgStreet:BGSprite;
var fgTrees:BGSprite;
var bgTrees:FlxSprite;
var treeLeaves:BGSprite;
var bgSky2:BGSprite;
var bgSchool2:BGSprite;
var bgStreet2:BGSprite;
var fgTrees2:BGSprite;
var bgTrees2:FlxSprite;
var bgGirls2:FlxSprite;

function onLoad(){
    GameOverSubstate.deathSoundName = 'fnf_loss_sfx-pixel';
    GameOverSubstate.loopSoundName = 'gameOver-pixel';
    GameOverSubstate.endSoundName = 'gameOverEnd-pixel';
    GameOverSubstate.characterName = 'bf-pixel-dead';

    bgSky = new BGSprite('stages/senpai-remix/weebSky', 0, 0, 0.1, 0.1);
    add(bgSky);
    bgSky.antialiasing = false;

   bgSky2 = new BGSprite('stages/senpai-remix/weebSkyD1', 0, 0, 0.1, 0.1);
    add(bgSky2);
    bgSky2.antialiasing = false;


    var repositionShit = -200;

    bgSchool= new BGSprite('stages/senpai-remix/weebSchool', repositionShit, 0, 0.6, 0.90);
    add(bgSchool);
    bgSchool.antialiasing = false;

    bgSchool2= new BGSprite('stages/senpai-remix/weebSchoolD1', repositionShit, 0, 0.6, 0.90);
    add(bgSchool2);
    bgSchool2.antialiasing = false;

    bgStreet = new BGSprite('stages/senpai-remix/weebStreet', repositionShit, 0, 0.95, 0.95);
    add(bgStreet);
    bgStreet.antialiasing = false;

    bgStreet2 = new BGSprite('stages/senpai-remix/weebStreetD1', repositionShit, 0, 0.95, 0.95);
    add(bgStreet2);
    bgStreet2.antialiasing = false;

    var widShit = Std.int(bgSky.width * 6);

        fgTrees = new BGSprite('stages/senpai-remix/weebTreesBack', repositionShit + 170, 130, 0.9, 0.9);
        fgTrees.setGraphicSize(Std.int(widShit * 0.8));
        fgTrees.updateHitbox();
        add(fgTrees);
        fgTrees.antialiasing = false;

        fgTrees2 = new BGSprite('stages/senpai-remix/weebTreesBackD1', repositionShit + 170, 130, 0.9, 0.9);
        fgTrees2.setGraphicSize(Std.int(widShit * 0.8));
        fgTrees2.updateHitbox();
        add(fgTrees2);
        fgTrees2.antialiasing = false;

    bgTrees = new FlxSprite(repositionShit - 410, -800);
    bgTrees.frames = Paths.getPackerAtlas('stages/senpai-remix/weebTrees');
    bgTrees.animation.add('treeLoop', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18], 12);
    bgTrees.animation.play('treeLoop');
    bgTrees.scrollFactor.set(0.85, 0.85);
    add(bgTrees);
    bgTrees.antialiasing = false;

    bgTrees2 = new FlxSprite(repositionShit - 410, -800);
    bgTrees2.frames = Paths.getPackerAtlas('stages/senpai-remix/weebTreesD1');
    bgTrees2.animation.add('treeLoop', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18], 12);
    bgTrees2.animation.play('treeLoop');
    bgTrees2.scrollFactor.set(0.85, 0.85);
    add(bgTrees2);
    bgTrees2.antialiasing = false;

        treeLeaves = new BGSprite('stages/senpai-remix/petals', repositionShit, -40, 0.85, 0.85, ['PETALS ALL'], true);
        treeLeaves.setGraphicSize(widShit);
        treeLeaves.updateHitbox();
        add(treeLeaves);
        treeLeaves.antialiasing = false;


	bgGirls = new FlxSprite(-50, 450);
	bgGirls.frames = Paths.getSparrowAtlas('stages/senpai-remix/bgFreaks');
	bgGirls.animation.addByPrefix('bop', 'BG girls group', 24, false);
	bgGirls.animation.play('bop'); 
	bgGirls.scrollFactor.set(0.9, 0.9);
	bgGirls.updateHitbox();
	bgGirls.antialiasing = ClientPrefs.globalAntialiasing;
	bgGirls.scale.set(6,6);
	add(bgGirls);

	bgGirls2 = new FlxSprite(-50, 450);
	bgGirls2.frames = Paths.getSparrowAtlas('stages/senpai-remix/bgFreaksD1');
	bgGirls2.animation.addByPrefix('bop', 'BG girls group', 24, true);
	bgGirls2.animation.play('bop'); 
	bgGirls2.scrollFactor.set(0.9, 0.9);
	bgGirls2.updateHitbox();
	//bgGirls2.zIndex = 10;
	bgGirls2.antialiasing = ClientPrefs.globalAntialiasing;
	bgGirls2.scale.set(6,6);
	add(bgGirls2);


    bgSky.setGraphicSize(widShit);
    bgSchool.setGraphicSize(widShit);
    bgStreet.setGraphicSize(widShit);
    bgTrees.setGraphicSize(Std.int(widShit * 1.45));

    bgSky.updateHitbox();
    bgSchool.updateHitbox();
    bgStreet.updateHitbox();
    bgTrees.updateHitbox();

	bgSky2.setGraphicSize(widShit);
	bgSky2.updateHitbox();
	bgSchool2.setGraphicSize(widShit);
	bgSchool2.updateHitbox();
	bgStreet2.setGraphicSize(widShit);
	bgStreet2.updateHitbox();
	bgTrees2.setGraphicSize(Std.int(widShit * 1.45));
	bgTrees2.updateHitbox();
}

function onCountdownTick()
{
        bgGirls.animation.play('bop');
}

function onBeatHit()
{
	bgGirls.animation.play('bop'); 
   
}

function onCreatePost(){
    playHUD.ratingPrefix = 'pixelUI/';
	playHUD.ratingSuffix = '-pixel';
}

function onUpdate()
{
	if (curStep == 345) curbg = 2; 
	if (curBeat == 96) curbg = 1; 
	if (curBeat == 152) curbg = 2;  

	if (curBeat == 160) {
		bgGirls.kill(); 
	//if (curBeat == 161) 
		bgTrees.kill(); 
	//if (curBeat == 162) 
		treeLeaves.kill();
}

	if (ClientPrefs.inDevMode)
	{
		if (FlxG.keys.pressed.Z)
		{
			curbg = 1;
		}
		if (FlxG.keys.pressed.X)
		{
			curbg = 2;
		}
	}


		if(curbg == 1){

		bgSky.alpha = 1;
		bgSchool.alpha = 1;
		bgStreet.alpha = 1;
		fgTrees.alpha = 1;
		bgTrees.alpha = 1;
		bgGirls.alpha = 1;

		bgSky2.alpha = 0.0001;
		bgSchool2.alpha = 0.0001;
		bgStreet2.alpha = 0.0001;
		fgTrees2.alpha = 0.0001;
		bgTrees2.alpha = 0.0001;
		treeLeaves.alpha = 1;
		bgGirls2.alpha = 0.001;
    	}else{

		bgSky.alpha = 0.0001;
		bgSchool.alpha = 0.0001;
		bgStreet.alpha = 0.0001;
		fgTrees.alpha = 0.0001;
		bgTrees.alpha = 0.0001;
		bgGirls.alpha = 0.0001;


		bgSky2.alpha = 1;
		bgSchool2.alpha = 1;
		bgStreet2.alpha = 1;
		fgTrees2.alpha = 1;
		bgTrees2.alpha = 1;
		treeLeaves.alpha = 0.0001;
		bgGirls2.alpha = 1;
    }
}

function schoolIntro(dialogueBox) {
    inCutscene = true;

    snapCamToPos(600, 550);

    var black:FlxSprite = new FlxSprite(-100, -100).makeGraphic(FlxG.width * 2, FlxG.height * 2, FlxColor.BLACK);
    black.scrollFactor.set();
    black.cameras = [ camHUD ];
    add(black);

    var red:FlxSprite = new FlxSprite(-100, -100).makeGraphic(FlxG.width * 2, FlxG.height * 2, 0xFFff1b31);
    red.cameras = [ camOther ];
    red.scrollFactor.set();

    var senpaiEvil:FlxSprite = new FlxSprite();
    senpaiEvil.frames = Paths.getSparrowAtlas('weeb/senpaiCrazy');
    senpaiEvil.animation.addByPrefix('idle', 'Senpai Pre Explosion', 24, false);
    senpaiEvil.setGraphicSize(Std.int(senpaiEvil.width * 6));
    senpaiEvil.scrollFactor.set();
    senpaiEvil.updateHitbox();
    senpaiEvil.screenCenter();
    senpaiEvil.cameras = [ camOther ];
    senpaiEvil.x += 300;

    var songName:String = Paths.formatToSongPath(PlayState.SONG.song);
    if (songName == 'roses' || songName == 'thorns')
    {
        remove(black);

        if (songName == 'thorns')
        {
            add(red);
            camHUD.visible = false;
        }
    }

    new FlxTimer().start(0.3, function(tmr:FlxTimer)
    {
        black.alpha -= 0.15;

        if (black.alpha > 0)
        {
            tmr.reset(0.3);
        }
        else
        {
            if (dialogueBox != null)
            {
                if (Paths.formatToSongPath(PlayState.SONG.song) == 'thorns')
                {
                    add(senpaiEvil);
                    senpaiEvil.alpha = 0;
                    new FlxTimer().start(0.3, function(swagTimer:FlxTimer)
                    {
                        senpaiEvil.alpha += 0.15;
                        if (senpaiEvil.alpha < 1)
                        {
                            swagTimer.reset();
                        }
                        else
                        {
                            senpaiEvil.animation.play('idle');
                            FlxG.sound.play(Paths.sound('Senpai_Dies'), 1, false, null, true, function()
                            {
                                // Just incase...
                                senpaiEvil.alpha = 0.001;
                                red.alpha = 0.001;

                                remove(senpaiEvil);
                                remove(red);
                                camOther.fade(FlxColor.WHITE, 0.01, true, function()
                                {
                                    add(dialogueBox);
                                    camHUD.visible = true;
                                }, true);
                            });
                            new FlxTimer().start(3.2, function(deadTime:FlxTimer)
                            {
                                camOther.fade(FlxColor.WHITE, 1.6, false);
                            });
                        }
                    });
                }
                else
                {
                    add(dialogueBox);
                }
            }
            else
                startCountdown();

            remove(black);
        }
    });
}