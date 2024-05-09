local videoCache = {}

function onCreate()
    addHaxeLibrary('MP4Handler', 'vlc')
    addHaxeLibrary('Event', 'openfl.events')
    cacheFuck()
end

local videoSprites = {}
function makeVideoSprite(tag, videoPath, x, y, camera, hasVolume)
    runHaxeCode([[
        ]]..tag..[[ = new MP4Handler();
        ]]..tag..[[.playVideo(Paths.video("]]..videoPath..[["));
        ]]..tag..[[.visible = false; 
        ]]..tag..[[.volume = ]]..(hasVolume and 1 or 0)..[[;
        setVar("]]..tag..[[hasVolume", ]]..(hasVolume and 1 or 0)..[[);

        ]]..tag..[[.finishCallback = function()
        { 
            game.remove(game.getLuaObject("]]..tag..[[")); 
            game.callOnLuas("onVideoFinished",["]]..tag..[["]);
            return;
        }
        FlxG.stage.removeEventListener("enterFrame", ]]..tag..[[.update);
    ]])
    makeLuaSprite(tag, nil, x, y)
    setObjectCamera(tag, camera)
    addLuaSprite(tag, false)
    table.insert(videoSprites, tag)
end

function cacheFuck()
    if #videoCache == 0 then
    else
        for i = 1,#videoCache do
            local tag = videoCache[i]..'c'
            runHaxeCode([[
            ]]..tag..[[ = new MP4Handler();
            ]]..tag..[[.playVideo(Paths.video("]]..videoCache[i]..[["));
            ]]..tag..[[.finishVideo();
            ]])
        end
        --debugPrint('bro the video has been cached!')
    end
end

function onUpdatePost()
    for _, __ in pairs(videoSprites) do
        runHaxeCode([[
            if (game.getLuaObject("]]..__..[[") != null)
            {
                game.getLuaObject("]]..__..[[").loadGraphic(]]..__..[[.bitmapData);
                if (getVar("]]..__..[[hasVolume"))
                    ]]..__..[[.volume = 1;
            }
        ]])
    end
end

function onPause()
    for _, __ in pairs(videoSprites) do
        runHaxeCode([[
            ]]..__..[[.pause();
        ]])
    end
end

function onResume()
    for _, __ in pairs(videoSprites) do
        runHaxeCode([[
            ]]..__..[[.resume();
        ]])
    end
end