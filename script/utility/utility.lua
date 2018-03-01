--Rl-Time
function realTime()
    local realtime = getRealTime()

    setTime(realtime.hour, realtime.minute)
    setMinuteDuration(60000)
end
addEventHandler("onResourceStart", getResourceRootElement(), realTime)

--Motion-blur
function changeBlurLevel()
    setPlayerBlurLevel ( source, 0 )
end

addEventHandler ( "onPlayerJoin", getRootElement(), changeBlurLevel )

function scriptStart()
    setPlayerBlurLevel ( getRootElement(), 0)
end

addEventHandler ("onResourceStart",getResourceRootElement(getThisResource()),scriptStart)

function scriptRestart()
	setTimer ( scriptStart, 4000, 1 )
end

addEventHandler("onResourceStart",getRootElement(),scriptRestart)

--Veh-Frezze
function toggleFreezeStatus ( thePlayer )
	-- if he is in a vehicle,
	if getPedOccupiedVehicle ( thePlayer ) then
		-- get the vehicle element
		local playerVehicle = getPlayerOccupiedVehicle ( thePlayer )
		-- get the current freeze status
		local currentFreezeStatus = isElementFrozen ( playerVehicle )
		-- get the new freeze status (the opposite of the previous state)
		local newFreezeStatus = not currentFreezeStatus
		-- set the new freeze status
		setElementFrozen ( playerVehicle, newFreezeStatus )
		--triggerClientEvent ( PlayerSource, "infobox_start", getRootElement(), "\n\nDu bist kein Serverleiter!", 5000, 255, 0, 0 )
	end
end

addCommandHandler ("break", toggleFreezeStatus )

function drawIt()
    dxDrawRectangle(0, 0, 200, 200, tocolor(0, 0, 0, 150))
   dxDrawText("BOX", 0, 0)
end
addEventHandler("onClientRender", getRootElement(), drawIt)

