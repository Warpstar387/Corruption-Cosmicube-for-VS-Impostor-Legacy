var bgSky:BGSprite;
var bgSchool:BGSprite;
var bgStreet:BGSprite;
var fgTrees:BGSprite;
var bgSky2:BGSprite;
var bgSchool2:BGSprite;
var bgStreet2:BGSprite;
var fgTrees2:BGSprite;
var bgTrees2:FlxSprite;
var treeLeaves:BGSprite;
var curbg:Int = 1;

function onLoad(){
    GameOverSubstate.deathSoundName = 'fnf_loss_sfx-pixel';
    GameOverSubstate.loopSoundName = 'gameOver-pixel';
    GameOverSubstate.endSoundName = 'gameOverEnd-pixel';
    GameOverSubstate.characterName = 'bf-pixel-dead';

    bgSky = new BGSprite('stages/treacherous-thorns/weebSky', 0, 0, 0.1, 0.1);
    add(bgSky);
    bgSky.antialiasing = false;

    var repositionShit = -200;

    bgSchool = new BGSprite('stages/treacherous-thorns/weebSchool', repositionShit, 0, 0.6, 0.90);
    add(bgSchool);
    bgSchool.antialiasing = false;

    bgStreet = new BGSprite('stages/treacherous-thorns/weebStreet', repositionShit, 0, 0.95, 0.95);
    add(bgStreet);
    bgStreet.antialiasing = false;

    var widShit = Std.int(bgSky.width * 6);
    if(!ClientPrefs.lowQuality) {
        fgTrees = new BGSprite('stages/treacherous-thorns/weebTreesBack', repositionShit + 170, 130, 0.9, 0.9);
        fgTrees.setGraphicSize(Std.int(widShit * 0.8));
        fgTrees.updateHitbox();
        add(fgTrees);
        fgTrees.antialiasing = false;
    }

    bgSky.setGraphicSize(widShit);
    bgSchool.setGraphicSize(widShit);
    bgStreet.setGraphicSize(widShit);

    bgSky.updateHitbox();
    bgSchool.updateHitbox();
    bgStreet.updateHitbox();

    bgSky2 = new BGSprite('stages/treacherous-thorns/weebSkyThorns', 0, 0, 0.1, 0.1);
    add(bgSky2);
    bgSky2.antialiasing = false;

    bgSchool2 = new BGSprite('stages/treacherous-thorns/weebSchoolThorns', repositionShit, 0, 0.6, 0.90);
    add(bgSchool2);
    bgSchool2.antialiasing = false;

    bgStreet2 = new BGSprite('stages/treacherous-thorns/weebStreetThorns', repositionShit, 0, 0.95, 0.95);
    add(bgStreet2);
    bgStreet2.antialiasing = false;

    if(!ClientPrefs.lowQuality) {
        fgTrees2 = new BGSprite('stages/treacherous-thorns/weebTreesBackThorns', repositionShit + 170, 130, 0.9, 0.9);
        fgTrees2.setGraphicSize(Std.int(widShit * 0.8));
        fgTrees2.updateHitbox();
        add(fgTrees2);
        fgTrees2.antialiasing = false;
    }

    bgTrees2 = new FlxSprite(repositionShit - 410, -800);
    bgTrees2.frames = Paths.getPackerAtlas('stages/treacherous-thorns/weebTreesThorns');
    bgTrees2.animation.add('treeLoop', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18], 12);
    bgTrees2.animation.play('treeLoop');
    bgTrees2.scrollFactor.set(0.85, 0.85);
    add(bgTrees2);
    bgTrees2.antialiasing = false;

    if(!ClientPrefs.lowQuality) {
        treeLeaves = new BGSprite('stages/treacherous-thorns/petals', repositionShit, -40, 0.85, 0.85, ['PETALS ALL'], true);
        treeLeaves.setGraphicSize(widShit);
        treeLeaves.updateHitbox();
        add(treeLeaves);
        treeLeaves.antialiasing = false;
    }

    bgSky2.setGraphicSize(widShit);
    bgSchool2.setGraphicSize(widShit);
    bgStreet2.setGraphicSize(widShit);
    bgTrees2.setGraphicSize(Std.int(widShit * 1.45));

    bgSky2.updateHitbox();
    bgSchool2.updateHitbox();
    bgStreet2.updateHitbox();
    bgTrees2.updateHitbox();
}

function onCreatePost(){
    playHUD.ratingPrefix = 'pixelUI/';
	playHUD.ratingSuffix = '-pixel';
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
}
 function onUpdate()
{
	if (dad.curCharacter == "senpai-pissed"){
		curbg = 1;
	}else{
		curbg = 2;
	}

	if(curbg == 2){
		//dad.x = -10;
		//dad.y = 200;

		bgSky.alpha = 1;
		bgSchool.alpha = 1;
		bgStreet.alpha = 1;
		fgTrees.alpha = 1;

		bgSky2.alpha = 0.0001;
		bgSchool2.alpha = 0.0001;
		bgStreet2.alpha = 0.0001;
		fgTrees2.alpha = 0.0001;
		bgTrees2.alpha = 0.0001;
		treeLeaves.alpha = 0.0001;
    	}else{
		//dad.x = 270;
		//dad.y = 430;

		bgSky.alpha = 0.0001;
		bgSchool.alpha = 0.0001;
		bgStreet.alpha = 0.0001;
		fgTrees.alpha = 0.0001;

		bgSky2.alpha = 1;
		bgSchool2.alpha = 1;
		bgStreet2.alpha = 1;
		fgTrees2.alpha = 1;
		bgTrees2.alpha = 1;
		treeLeaves.alpha = 1;
    }

}


