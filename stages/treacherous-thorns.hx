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

var curbg:Int = -1;

function onLoad()
{
	GameOverSubstate.deathSoundName = 'fnf_loss_sfx-pixel';
	GameOverSubstate.loopSoundName = 'gameOver-pixel';
	GameOverSubstate.endSoundName = 'gameOverEnd-pixel';
	GameOverSubstate.characterName = 'bf-pixel-dead';

	var repositionShit:Float = -200;

	bgSky = new BGSprite('stages/treacherous-thorns/weebSky', 0, 0, 0.1, 0.1);
	bgSky.antialiasing = false;
	add(bgSky);

	bgSchool = new BGSprite('stages/treacherous-thorns/weebSchool', repositionShit, 0, 0.6, 0.90);
	bgSchool.antialiasing = false;
	add(bgSchool);

	bgStreet = new BGSprite('stages/treacherous-thorns/weebStreet', repositionShit, 0, 0.95, 0.95);
	bgStreet.antialiasing = false;
	add(bgStreet);

	var widShit:Int = Std.int(bgSky.width * 6);

	if (!ClientPrefs.lowQuality)
	{
		fgTrees = new BGSprite('stages/treacherous-thorns/weebTreesBack', repositionShit + 170, 130, 0.9, 0.9);
		fgTrees.setGraphicSize(Std.int(widShit * 0.8));
		fgTrees.updateHitbox();
		fgTrees.antialiasing = false;
		add(fgTrees);
	}

	bgSky.setGraphicSize(widShit);
	bgSchool.setGraphicSize(widShit);
	bgStreet.setGraphicSize(widShit);

	bgSky.updateHitbox();
	bgSchool.updateHitbox();
	bgStreet.updateHitbox();

	bgSky2 = new BGSprite('stages/treacherous-thorns/weebSkyThorns', 0, 0, 0.1, 0.1);
	bgSky2.antialiasing = false;
	add(bgSky2);

	bgSchool2 = new BGSprite('stages/treacherous-thorns/weebSchoolThorns', repositionShit, 0, 0.6, 0.90);
	bgSchool2.antialiasing = false;
	add(bgSchool2);

	bgStreet2 = new BGSprite('stages/treacherous-thorns/weebStreetThorns', repositionShit, 0, 0.95, 0.95);
	bgStreet2.antialiasing = false;
	add(bgStreet2);

	if (!ClientPrefs.lowQuality)
	{
		fgTrees2 = new BGSprite('stages/treacherous-thorns/weebTreesBackThorns', repositionShit + 170, 130, 0.9, 0.9);
		fgTrees2.setGraphicSize(Std.int(widShit * 0.8));
		fgTrees2.updateHitbox();
		fgTrees2.antialiasing = false;
		add(fgTrees2);
	}

	bgTrees2 = new FlxSprite(repositionShit - 410, -800);
	bgTrees2.frames = Paths.getPackerAtlas('stages/treacherous-thorns/weebTreesThorns');
	bgTrees2.animation.add('treeLoop', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18], 12);
	bgTrees2.animation.play('treeLoop');
	bgTrees2.scrollFactor.set(0.85, 0.85);
	bgTrees2.antialiasing = false;
	add(bgTrees2);

	if (!ClientPrefs.lowQuality)
	{
		treeLeaves = new BGSprite('stages/treacherous-thorns/petals', repositionShit, -40, 0.85, 0.85, ['PETALS ALL'], true);
		treeLeaves.setGraphicSize(widShit);
		treeLeaves.updateHitbox();
		treeLeaves.antialiasing = false;
		add(treeLeaves);
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

function onCreatePost()
{
	if (playHUD != null)
	{
		playHUD.ratingPrefix = 'pixelUI/';
		playHUD.ratingSuffix = '-pixel';
	}
}

function schoolIntro(dialogueBox)
{
	inCutscene = true;
	snapCamToPos(600, 550);

	var black:FlxSprite = new FlxSprite(-100, -100).makeGraphic(FlxG.width * 2, FlxG.height * 2, FlxColor.BLACK);
	black.scrollFactor.set();
	black.cameras = [camHUD];
	add(black);

	var red:FlxSprite = new FlxSprite(-100, -100).makeGraphic(FlxG.width * 2, FlxG.height * 2, 0xFFFF1B31);
	red.scrollFactor.set();
	red.cameras = [camOther];

	var senpaiEvil:FlxSprite = new FlxSprite();
	senpaiEvil.frames = Paths.getSparrowAtlas('weeb/senpaiCrazy');
	senpaiEvil.animation.addByPrefix('idle', 'Senpai Pre Explosion', 24, false);
	senpaiEvil.setGraphicSize(Std.int(senpaiEvil.width * 6));
	senpaiEvil.scrollFactor.set();
	senpaiEvil.updateHitbox();
	senpaiEvil.screenCenter();
	senpaiEvil.cameras = [camOther];
	senpaiEvil.x += 300;
}

function onUpdate(elapsed:Float)
{
	var targetBG:Int = (dad != null && dad.curCharacter == "senpai-pissed") ? 1 : 2;

	if (curbg != targetBG)
	{
		curbg = targetBG;
		setStageVisibility(curbg == 2);
	}
}

function setStageVisibility(isNormalStage:Bool)
{
	var alphaNormal:Float = isNormalStage ? 1.0 : 0.0001;
	var alphaThorns:Float = isNormalStage ? 0.0001 : 1.0;

	if (bgSky != null) bgSky.alpha = alphaNormal;
	if (bgSchool != null) bgSchool.alpha = alphaNormal;
	if (bgStreet != null) bgStreet.alpha = alphaNormal;
	if (fgTrees != null) fgTrees.alpha = alphaNormal;

	if (bgSky2 != null) bgSky2.alpha = alphaThorns;
	if (bgSchool2 != null) bgSchool2.alpha = alphaThorns;
	if (bgStreet2 != null) bgStreet2.alpha = alphaThorns;
	if (fgTrees2 != null) fgTrees2.alpha = alphaThorns;
	if (bgTrees2 != null) bgTrees2.alpha = alphaThorns;
	if (treeLeaves != null) treeLeaves.alpha = alphaThorns;
}
