local zoom = true
local notess = true
--hasta aqui se escuchan sus tripas

function onCreate()
    makeLuaSprite('blackScreen', '', 0,0)
    makeGraphic('blackScreen',20,120,'000000')
    setObjectCamera('blackScreen', 'other')
    setGraphicSize('blackScreen', screenWidth, screenHeight);

    makeLuaSprite('bg','bg/silly_mirror',0,0)
    makeLuaSprite('whiteScreen','bg/white_mirror',0,0)
    makeLuaSprite('bg2','bg/broken_mirror',0,0)

    makeAnimatedLuaSprite('floor','bg/bgAssets',0,0)
    addAnimationByPrefix('floor', '1','Silly_floor', 1,true)

    makeAnimatedLuaSprite('idk','bg/bgAssets',0,0)
    addAnimationByPrefix('idk', '1','Silly_idk_1', 1,true)

    makeAnimatedLuaSprite('idk2','bg/bgAssets',0,0)
    addAnimationByPrefix('idk2', '1','Silly_idk_2', 1,true)

    makeLuaSprite('vig','bg/vignette',0,0)
    setObjectCamera('vig', 'hud')

    makeLuaSprite('bars','bg/bars',0,0)
    setObjectCamera('bars', 'hud')

    makeLuaSprite('Barr', 'Bar/Barblack', 408, 615);
    setObjectCamera('Barr', 'camHUD')
    scaleObject('Barr', 0.26, 0.42)

    makeLuaSprite('Barrr', 'Bar/Barblack', 31, 615);
    setObjectCamera('Barrr', 'camHUD')
    scaleObject('Barrr', 0.26, 0.42)

    makeLuaSprite('BarBlue', 'Bar/Bar', 300, 615);
    setObjectCamera('BarBlue', 'camHUD')
    scaleObject('BarBlue', 0.26, 0.42)

    makeLuaSprite('BarRed', 'Bar/BarDad', 200, 615);
    setObjectCamera('BarRed', 'camHUD')
    scaleObject('BarRed', 0.450, 0.625)

    makeLuaSprite('healthh', 'Bar/Silly_Healthbar', -25, 480);
    setObjectCamera('healthh', 'camHUD')
    scaleObject('healthh', 0.5, 0.5)

    makeAnimatedLuaSprite('icons', 'icons/billyicon', 230, 553)
    addAnimationByPrefix('icons', '1', 'icon2', 1, true)
    addAnimationByPrefix('icons', '2', 'icon3', 1, false)
    addAnimationByPrefix('icons', '3', 'icon1', 1, false)
    addAnimationByPrefix('icons', '4', 'icon4', 1, false)
    addAnimationByPrefix('icons', '5', 'icon5', 1, false)
    setObjectCamera('icons', 'camHUD')
    scaleObject('icons', 1, 1)

  addLuaSprite('bg',false)
  addLuaSprite('bg2',false)
  addLuaSprite('whiteScreen',false)
  addLuaSprite('floor',false)
  addLuaSprite('idk',false)
  addLuaSprite('idk2',false)
  addLuaSprite('vig',false)
  addLuaSprite('bars',false)
  addLuaSprite('blackScreen',false)

  addLuaSprite('Barr', false)
  addLuaSprite('BarBlue', false)
  addLuaSprite('Barrr', false)
  addLuaSprite('BarRed', false)
  addLuaSprite('healthh', false)
  addLuaSprite('icons', false);

  setProperty('whiteScreen.alpha', 0)
  setProperty('bg2.alpha', 0)
end

function onCountdownStarted()
	runHaxeCode([[
		for (strum in game.opponentStrums)
		{
			strum.cameras = [game.camGame];
			strum.scrollFactor.set(1, 1);
		        strum.scale.set(0.94, 0.94);
		}
		for (note in game.unspawnNotes) 
		{
			if (!note.mustPress) {
				note.cameras = [game.camGame];
				note.scrollFactor.set(1, 1);
				note.scale.set(0.94, 0.94);
			} 
		};
	]])
	if downscroll then
		loserScrollHateHateHATEDownscroll = 180
	else
		loserScrollHateHateHATEDownscroll = 0
	end
	noteScaleOfficialRealLife = getPropertyFromGroup('unspawnNotes', 0, 'scale.x')
end

function onUpdate()
  setProperty('healthBarBG.alpha', 0);
  setProperty('healthBar.alpha', 0);
  setProperty('iconP2.alpha', 0);
  setProperty('iconP1.flipX', true);

     noteTweenX('left', 0, 800, 0.001, 'linear');
     noteTweenX('down', 1, 1010, 0.001, 'linear');  
     noteTweenX('up', 2, 1230, 0.001, 'linear');
     noteTweenX('right', 3, 1455, 0.001, 'linear');

     noteTweenY('left1', 0, 480, 0.001, 'linear');
     noteTweenY('down2', 1, 480, 0.001, 'linear');
     noteTweenY('up3', 2, 480, 0.001, 'linear');
     noteTweenY('right4', 3, 480, 0.001, 'linear');

     setPropertyFromGroup('strumLineNotes', 0, 'alpha', 0.5);
     setPropertyFromGroup('strumLineNotes', 1, 'alpha', 0.5);
     setPropertyFromGroup('strumLineNotes', 2, 'alpha', 0.5);
     setPropertyFromGroup('strumLineNotes', 3, 'alpha', 0.5);

    if notess == true then
	for i = 0, 3 do
		setObjectOrder('bg2', 1)
		setObjectOrder('strumLineNotes', 2)
		setObjectOrder('notes', 3)
		setObjectOrder('opponent', 4)
    end
  end
end

function onUpdatePost(elapsed)
  setProperty('iconP1.x', 375);
  setProperty('iconP1.y', 553.75);
  setProperty('scoreTxt.x', -270);

  if getProperty('BarBlue.x') > 409 then
      setProperty('BarBlue.x',  409);
 end

    if getProperty('healthBar.percent') > 0 then
      setProperty('BarRed.x', 30)
      setProperty('BarRed.scale.x', 0.305)
 end
    if getProperty('healthBar.percent') > 15 then
      setProperty('BarRed.x', 70)
      setProperty('BarRed.scale.x', 0.305)
 end
    if getProperty('healthBar.percent') > 20 then
      setProperty('BarRed.x', 90)
      setProperty('BarRed.scale.x', 0.305)
 end
    if getProperty('healthBar.percent') > 25 then
      setProperty('BarRed.x', 120)
      setProperty('BarRed.scale.x', 0.305)
 end
    if getProperty('healthBar.percent') > 30 then
      setProperty('BarRed.x', 135)
      setProperty('BarRed.scale.x', 0.3)
 end
    if getProperty('healthBar.percent') > 35 then
      setProperty('BarRed.x', 142)
      setProperty('BarRed.scale.x', 0.2125)
 end
    if getProperty('healthBar.percent') > 40 then
      setProperty('BarRed.x', 157)
      setProperty('BarRed.scale.x', 0.17)
 end
    if getProperty('healthBar.percent') > 45 then
      setProperty('BarRed.x', 170)
      setProperty('BarRed.scale.x', 0.1275)
 end
    if getProperty('healthBar.percent') > 60 then
      setProperty('BarRed.x', 190)
      setProperty('BarRed.scale.x', 0.085)
 end
    if getProperty('healthBar.percent') > 70 then
      setProperty('BarRed.x', 220)
      setProperty('BarRed.scale.x', 0.0425)
 end

    if zoom == true then
	if mustHitSection == false then
        setProperty('defaultCamZoom',0.625)
    else
        setProperty('defaultCamZoom',0.5)
    end
  end
end

function onSongStart()
  callScript('scripts/VideoSpriteHandler', 'makeVideoSprite', {'openVid', 'open', 220, 120, 'camOther', false})
  setProperty('openVid.scale.x', 1.52)
  setProperty('openVid.scale.y', 1.5)
  setProperty('openVid.antialiasing', false)
end

function onStepHit()
  if curStep == 127 then
     setProperty('openVid.alpha', 0)
 end
  if curStep == 126 then
     doTweenAlpha('alpha','blackScreen','0','1.15','sineOut')
 end
  if curStep == 2704 then
     objectPlayAnimation('icons','4',true)
 end
  if curStep == 3328 then
     objectPlayAnimation('icons','5',true)
 end
  if curStep == 3344 then
     zoom = false
 end
  if curStep == 3350 then
     noteTweenAlpha('player1', 4, 0, 1.4,'sineOut')
     noteTweenAlpha('player2', 5, 0, 1.4,'sineOut')
     noteTweenAlpha('player3', 6, 0, 1.4,'sineOut')
     noteTweenAlpha('player4', 7, 0, 1.4,'sineOut')

     doTweenAlpha('bar','Barr','0','1.4','linear')
     doTweenAlpha('barblue','BarBlue','0','1.4','linear')
     doTweenAlpha('barr','Barrr','0','1.4','linear')
     doTweenAlpha('barred','BarRed','0','1.4','linear')
     doTweenAlpha('health','healthh','0','1.4','linear')

     doTweenAlpha('score','scoreTxt','0','1.4','linear')
     doTweenAlpha('iconP1','icons','0','1.4','linear')
     doTweenAlpha('iconP2','iconP1','0','1.4','linear')

     doTweenAlpha('timeBar','timeBar','0','1.4','linear')
     doTweenAlpha('BarScore','timeBarTxt','0','1.4','linear')
 end
  if curStep == 3376 then
     setProperty('defaultCamZoom',0.625)
 end
  if curStep == 3408 then
     setProperty('defaultCamZoom',0.67)
 end
  if curStep == 3440 then
     setProperty('defaultCamZoom',0.7)
     playSound('mirror_break', 1);
     doTweenAlpha('broken','bg2','1','0.5','linear')
     doTweenAlpha('alphaWhite','whiteScreen','0.5','0.1','linear')
 end
  if curStep == 3443 then
     doTweenAlpha('alphaWhite','whiteScreen','0','0.7','linear')
 end
  if curStep == 3464 then
     setProperty('defaultCamZoom',0.73)
 end
  if curStep == 3472 then
     setProperty('defaultCamZoom',0.76)
 end
  if curStep == 3480 then
     setProperty('defaultCamZoom',0.79)
     doTweenAlpha('alpha','blackScreen','1','1.05','sineOut')
 end
  if curStep == 3485 then
     setProperty('defaultCamZoom',1.1)
 end
  if curStep == 3495 then
     callScript('scripts/VideoSpriteHandler', 'makeVideoSprite', {'myWay', 'SO_STAY_FINAL', 0, 0, 'camHUD', false})
     setObjectOrder('myWay', 1)
     setObjectOrder('bars', 2)
     notess = false

     setPropertyFromGroup('strumLineNotes', 4, 'x', 412);
     setPropertyFromGroup('strumLineNotes', 5, 'x', 524);
     setPropertyFromGroup('strumLineNotes', 6, 'x', 636);
     setPropertyFromGroup('strumLineNotes', 7, 'x', 748);
 end
  if curStep == 3496 then
     setProperty('blackScreen.alpha', 0)
 end
  if curStep == 3621 then
     noteTweenAlpha('player1', 4, 1, 1,'sineOut')
     noteTweenAlpha('player2', 5, 1, 1,'sineOut')
     noteTweenAlpha('player3', 6, 1, 1,'sineOut')
     noteTweenAlpha('player4', 7, 1, 1,'sineOut')
 end
  if curStep == 3886 then
     setProperty('blackScreen.alpha', 1)
 end
  if curStep == 3887 then
     zoom = true
     notess = true
     setProperty('myWay.alpha', 0)
     doTweenAlpha('alpha','blackScreen','0','1.2','sineOut')
     doTweenColor('bfOut','boyfriend','c0c4e4',0.01,'quadInOut')
     doTweenColor('dadOut','dad','c0c4e4',0.01,'quadInOut')

     noteTweenX('player1',4,defaultPlayerStrumX0, 1.5,'sineOut')
     noteTweenX('player2',5,defaultPlayerStrumX1, 1.5,'sineOut')
     noteTweenX('player3',6,defaultPlayerStrumX2, 1.5,'sineOut')
     noteTweenX('player4',7,defaultPlayerStrumX3, 1.5,'sineOut')
 end
  if curStep == 4176 then
     setProperty('camGame.alpha', 0)
 end
end

function goodNoteHit()
     setProperty('BarBlue.x', getProperty('BarBlue.x') + 3.7000)
end

function opponentNoteHit()
     setProperty('BarBlue.x', getProperty('BarBlue.x') - 2.5250)

    health = getProperty('health')
    if getProperty('health') > 0.1 then
        setProperty('health', health- 0.015);
    end
end

function onEvent(name,value1,value2)
    if name == 'Change Character' then
       if value2 == 'bf-lookalike' then	
      objectPlayAnimation('icons','2',true)
    end
       if value2 == 'transLookalike2' then	
      objectPlayAnimation('icons','3',true)
    end
  end
end