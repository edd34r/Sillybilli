local disableLyrics = false
local colorLyrics = nil
local textLyrics = ''
local time = ''

local timeStart = 0
local timeFinish = 0
local commaStart = 0
local commaEnd = 0

local number1 = nil
local number2 = nil

function onUpdate()
    if disableLyrics == true then
        setProperty('LyricsWow.alpha',getProperty('LyricsWow.alpha') - 0.05)
        if getProperty('LyricsWow.alpha') <= 0 then
            removeLuaText('LyricsWow',false)
            if bordersEnabled == false then
                LyricsInExecutation = false
            end
        end
    end
end


function onEvent(name,v1,v2)
    if name == 'ill make' then
        textLyrics = v1

        number1,number2 = string.find(string.lower(v1),'--0x',0,true)
        startLeters,allTextLeters = string.find(v1,v1,0,true)
        if number1 ~= nil and number2 ~= number1 + 4 then
            colorLyrics = string.sub(v1,number2 + 1,allTextLeters)
            textLyrics = string.sub(v1,startLeters,allTextLeters - 10)
        else
            colorLyrics = 'FFFFFF'
        end
        makeLuaText('LyricsWow',textLyrics,1280,0,680)
        setTextColor('LyricsWow',colorLyrics)
        setObjectCamera('LyricsWow','hud')
        setTextFont('LyricsWow','TimesNewRoman.ttf')

        setProperty('LyricsWow.antialiasing',false)
        setProperty('LyricsWow.alpha',1)
        addLuaText('LyricsWow',true)
        setProperty('LyricsWow.scale.x', 3)
        setProperty('LyricsWow.scale.y', 3)
        end

        if tonumber(v2) ~= nil then
            time = tonumber(v2)
        else
            if string.find(v2,'time:',0,true) ~= nil then
                timeStart,timeFinish = string.find(v2,'time:',0,true)
                commaStart,commaEnd = string.find(v2,',',timeFinish,true)
                if commaStart ~= nil then
                    time = string.sub(v2,timeFinish + 1,commaStart - 1)
                end
            else
                time = 0.3
            end
        end
        runTimer('removeLyricsEvent',time)
        runTimer('removeLyricsBars',time + 0.5)
        disableLyrics = false
        end

function onTimerCompleted(tag)
    if tag == 'removeLyricsEvent' then
        disableLyrics = true
    end
end

