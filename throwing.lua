# MYO_APPs

scriptId="com.Eng&MathHack.demo1.script3"
	scriptTitle="Test"
	scriptDetailsUrl=""
	--throw a ball with this
	lock=true
	mouse=false
	count=0;
	x=0
	y=0
	z=0
	a=0
	b=0
	c=0
	yaw=0
	myo.setLockingPolicy("none")
	function onForegroundWindowChange(app,title)
		myo.debug("onForegroundWindowChange: "..app..","..title)
		return true
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
		return true
	end
	function onWaveIn(edge)
		return true
	end
	function onDoubleTap(edge)
		return true
	end
	function onFist(edge)
		if(edge=="off") then
			x,y,z=myo.getAccel()
			a,b,c=myo.getGyro()
			myo.debug("x "..x.."y "..y.."z "..z)
			myo.debug("a "..a.."b "..b.."c "..c)
		end
	end
	function onRest(edge)
	end
	function onFingerSpread(edge)
		if(edge=="on")then
			yaw=myo.getYaw()
			myo.debug("current yaw="..yaw)
		end
	end
	if not myo.isUnlocked() then
		lock=true
	end
