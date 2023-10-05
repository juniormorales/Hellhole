duration = 0;

function onCreate()
precacheImage('jumpscare/Gold')
precacheImage('jumpscare/GoldAlt')
end

function onEvent(name, value1, value2)
	if name == "goldScream" then
		if value1 == "Gold" then
            makeLuaSprite('image', 'jumpscare/Gold', -150, -50);
			scaleObject('image', 0.4, 0.4)
		elseif value1 == "GoldAlt" then         
			makeLuaSprite('image', 'jumpscare/GoldAlt', -340, -220)    
			scaleObject('image', 0.5, 0.52)
		end
        addLuaSprite('image', true);
        setObjectCamera('image', 'other');
		setObjectOrder('image', 1)
		runTimer('chauP', value2);
		duration = value2;
	   stopShake = false
	end
end

function onUpdate()
	if stopShake == false then
	cameraShake('other', 0.0125, 0.5)
	end
end

function onTimerCompleted(tag, loops, loopsleft)
	if tag == 'chauP' then
		doTweenAlpha('adiosJumpscare', 'image', 0, 0.1, 'linear');
		stopShake = true
	end
end

function onTweenCompleted(tag)
	if tag == 'adiosJumpscare' then
		removeLuaSprite('image', true);
		cameraShake('other', 0,0)
	end
end