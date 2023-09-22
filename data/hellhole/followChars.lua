local xx = 300;
local yy = 500;

local xx2 = 1000;
local yy2 = 600;

local xx3 = 550;
local yy3 = 200;

local ofs = 60;
local ofs2 = 60;
local ofs3 = 60;

local dadzoom = 0.75;
local bfzoom = 1;
local gfzoom = 0.55;
local shake = false;

function onCreate()

end

function onCreatePost()
    triggerEvent('Camera Follow Pos',xx,yy)
end

function onUpdate(elapsed)
    follow()

    if curStep == 400 then
        shake = true;
    end

    if (curStep >= 400 and curStep <= 528) or (curStep >= 784 and curStep <= 1040) or (curStep >= 2912 and curStep <= 3424) then
       if curStep%4 == 0 then
         triggerEvent('Add Camera Zoom','0.05','0')
       end
    end

    if (curStep >= 528 and curStep <= 752) or (curStep >= 1040 and curStep <= 1280) or (curStep >= 1344 and curStep <= 1856) or
        (curStep >= 2128 and curStep <= 2368) or (curStep >= 2768 and curStep <= 2896) then
       if curStep%8 == 0 then
         triggerEvent('Add Camera Zoom','0.02','0')
       end
    end

    triggerEvent('Screen Shake','0, 0','0.1, 0.0025');
end

function follow()

    if gfSection == true then
        setProperty('defaultCamZoom',gfzoom)
        if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx3-ofs3,yy3)
        end
        if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx3+ofs3,yy3)
                triggerEvent('Screen Shake','0.05, 0.03','0.1, 0.02');
        end
        if getProperty('gf.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx3,yy3-ofs3)
                triggerEvent('Screen Shake','0.05, 0.03','0.1, 0.02');
        end
        if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx3,yy3+ofs3)
                triggerEvent('Screen Shake','0.05, 0.03','0.1, 0.02');
        end
        if getProperty('gf.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx3,yy3)
                triggerEvent('Screen Shake','0.05, 0.03','0.1, 0.02');
        end
    elseif mustHitSection == false then
            setProperty('defaultCamZoom',dadzoom)
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs2,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs2,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs2,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs2,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs2)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'still' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
    else
            setProperty('defaultCamZoom',bfzoom)
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if shake then
        triggerEvent('Screen Shake','0.05, 0.02','0.1, 0.0075');
    end
end