#--MYO APPs
scriptId="com.Eng&MathHack.demo1.script2"
	scriptTitle="ForMinecraft"
	scriptDetailsUrl=""
	lock=true
	mouse=false
	--Used for playing mine craft
	function onForegroundWindowChange(app,title)
		myo.debug("onForegroundWindowChange: "..app..","..title)
		onLock(title)
		return true
	end
	function onLock(title)
		if(title=="Minecraft 1.7.10") then
			myo.setLockingPolicy("none")
			myo.unlock("hold")
		elseif not(titile=="Naruto") then
			myo.setLockingPolicy("standard")
			myo.lock()
			myo.controlMouse(false)
			mouse=false
		end
	end
	function onPoseEdge(pose,edge)
		myo.debug("onPoseEdge: "..pose..": "..edge)
		if(pose == "waveOut") then
			onWaveOut(edge)
		elseif(pose == "fist") then
			onFist(edge)
		elseif(pose == "waveIn") then
			onWaveIn(edge)
		elseif(pose == "doubleTap") then
			onDoubleTap(edge)
		elseif(pose=="fingersSpread") then
			onFingerSpread(edge)
		elseif(pose=="rest") then
			onRest(edge)
		end
	end
	function onWaveOut(edge)
		myo.debug("Successfully Waved Out!")
		if(edge=="on") then
			myo.keyboard("w","down")
			myo.controlMouse(true)
		elseif (edge=="off") then
			myo.keyboard("w","up")
			myo.controlMouse(false)
		end
		return true
	end
	function onWaveIn(edge)
		if(edge=="on") then
			myo.keyboard("s","down")
			myo.controlMouse(true)
		elseif (edge=="off") then
			myo.keyboard("s","up")
			myo.controlMouse(false)
		end
		return true
	end
	function onDoubleTap(edge)
		if(lock) then
			myo.unlock("hold")
			lock=false
		else
--			myo.mouse("left","click")
--			myo.debug("Doubletaped!")
			if(edge=="on") then
				myo.debug("Doubletaped!")
				myo.mouse("left","click")
			end
		end
		return true
	end
	function onFist(edge)
		if(edge=="on") then
			myo.controlMouse(true)
			myo.mouse("left","down")
		elseif(edge=="off") then
--			myo.vibrate("short")
			myo.mouse("left","up")
			myo.controlMouse(false)
		end
		myo.debug("Fist!")
	end
	function onRest(edge)
		if(lock==false) and (edge=="on") then
			myo.controlMouse(true)
		elseif (edge=="off") and (lock==false) then
			myo.controlMouse(false)
		elseif (lock==true) then
			myo.controlMouse(false)
		end
		return true
	end
	function onFingerSpread(edge)
		if(edge=="on") then
			myo.mouse("right","down")
			myo.controlMouse(true)
		elseif(edge=="off") then
			myo.mouse("right","up")
			myo.controlMouse(false)
--			myo.vibrate("short")
		end
	end
	if not myo.isUnlocked() then
		lock=true
	end
