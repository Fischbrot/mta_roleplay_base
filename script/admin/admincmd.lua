function goto_func(player,command,target)
	tplayer = getPlayerFromName( target )
	if (getElementData(player, "adminlvl") > 0) then
		if target then
			if getElementData ( tplayer, "logedin" ) == true then
				local x,y,z = getElementPosition(tplayer)
				if getPedOccupiedVehicleSeat ( player ) == 0 then
					setElementInterior ( player, getElementInterior(tplayer) )
					setElementInterior ( getPedOccupiedVehicle(player), getElementInterior(tplayer) )
					setElementPosition ( getPedOccupiedVehicle ( player ), x+3, y+3, z )
					setElementDimension ( getPedOccupiedVehicle ( player ), getElementDimension ( tplayer ) )
					setElementDimension ( player, getElementDimension ( tplayer ) )
					setElementVelocity(getPedOccupiedVehicle(player),0,0,0)
					setVehicleFrozen ( getPedOccupiedVehicle(player), true )
					setTimer ( setVehicleFrozen, 500, 1, getPedOccupiedVehicle(player), false )
				else
					removePedFromVehicle ( player )
					setElementPosition ( player, x, y + 1, z )
					setElementInterior ( player, getElementInterior(tplayer) )
					setElementDimension ( player, getElementDimension ( tplayer ) )
				end
				else
					outputChatBox ( "Spieler ist nicht eingeloggt!" )
				end
			else
				outputChatBox ( "Du bist kein Moderator!" )
			end
		else
			outputChatBox ( "Verwende: /goto [Name]" )
		end
end
addCommandHandler("goto", goto_func)
addEvent ("goto", true )
addEventHandler ("goto", getRootElement(), goto_func )


function gethere_func(player,command,target)
	tplayer = getPlayerFromName( target )
	if (getElementData(player, "adminlvl") > 0) then
		if target then
			if getElementData ( tplayer, "logedin" ) == true then
				local x,y,z = getElementPosition(player)
				if getPedOccupiedVehicleSeat ( tplayer ) == 0 then
					setElementInterior ( tplayer, getElementInterior(player) )
					setElementInterior ( getPedOccupiedVehicle(tplayer), getElementInterior(player ) )
					setElementPosition ( getPedOccupiedVehicle(tplayer), x+3, y+3, z )
					setElementDimension ( tplayer, getElementDimension ( player ) )
					setElementDimension ( getPedOccupiedVehicle(tplayer), getElementDimension ( player ) )
					setElementVelocity(getPedOccupiedVehicle(tplayer),0,0,0)
					setVehicleFrozen ( getPedOccupiedVehicle(tplayer), true )
					setTimer ( setVehicleFrozen, 500, 1, getPedOccupiedVehicle(tplayer), false )
				else
					removePedFromVehicle ( tplayer )
					setElementPosition ( tplayer, x, y + 1, z )
					setElementInterior ( tplayer, getElementInterior(player) )
					setElementDimension ( tplayer, getElementDimension ( player ) )
				end
			else
				outputChatBox ( "Spieler ist nicht eingeloggt!" )
			end
		else
			outputChatBox ( "Du bist kein Moderator!" )
		end
	else
		outputChatBox ( "Verwende: /goto [Name]" )
	end
end
addCommandHandler("gethere", gethere_func)
addEvent ("gethere", true )
addEventHandler ("gethere", getRootElement(), gethere_func )


function skydive_func(player,command,target)
	tplayer = getPlayerFromName( target )
	if (getElementData(player, "adminlvl") > 0) then
		if target then
			if getElementData ( tplayer, "logedin" ) == true then
				local x,y,z = getElementPosition(tplayer)
				if getPedOccupiedVehicleSeat ( tplayer ) == 0 then
					setElementPosition ( getPedOccupiedVehicle(tplayer), x, y, z+2000 )
				else
					removePedFromVehicle ( tplayer )
					setElementPosition ( tplayer, x, y, z+2000 )
				end
				outputChatBox("Oh, i forgot to give you a parachute, shame on me.")
			else
				outputChatBox ( "Spieler ist nicht eingeloggt!" )
			end
		else
			outputChatBox ( "Du bist kein Moderator!" )
		end
	else
		outputChatBox ( "Verwende: /goto [Name]" )
	end
end
addCommandHandler("skydive", skydive_func)
addEvent ("skydive", true )
addEventHandler ("skydive", getRootElement(), skydive_func )



function portToPlace_func (player, cmd, faction, ort)
	if (getElementData(player, "adminlvl") > 0) then
		if faction then
			if faction == "bahnhof" then
				x, y, z = -1992.699, 110.165, 27.539
			elseif faction == "bain" then
				x, y, z = 1667.462890625,-1686.1025390625,21.4375
			elseif faction == "pentagon" then
				x, y, z = -2108.529296875, -425.4052734375, 35.3359375
			elseif faction == "thinman" then
				x, y, z = -322.830078125,1532.3017578125,75.359375
			elseif faction == "grove" then
				x, y, z = 2495.42, -1686.91, 13.51
			elseif faction == "fahrschule" then
				x, y, z = -2046.2838, -93.7088, 35.172
			elseif faction == "zero" then
				x, y, z = -2251.648, 126.1136, 35.172
			elseif faction == "jobcenter" then
				x, y, z = -2152.022, 250.247, 35.32
			elseif faction == "flugjob" then
				x, y, z = -1422.6966, -307.50, 6.2
			elseif faction == "ammunation" then
				x, y, z = -2625.685, 217.826, 4.4773
			elseif faction == "army" then
				if ort == "sf" then
					x, y, z = -1530, 471.295, 7.1875
				elseif ort == "lv" then
					x, y, z = 196.0439453125,1903.7470703125,17.640625
				elseif ort == "ls" then
					x, y, z = 2752.599609375,-2423.4423828125,13.647100448608
				end
			elseif faction == "camorra" then
				if ort == "sf" then
					x, y, z = -705.07, 959.5633, 12.41
				elseif ort == "ls" then
					x, y, z = 708.0455, -1424.749, 13.539
				elseif ort == "lv" then
					x, y, z = 2297.252, 1748.105, 10.82
				end
			elseif faction == "compton" then
				if ort == "sf" then
					x, y, z = -2209.4443359375,40.3173828125,35.3203125
				elseif ort == "ls" then
					x, y, z = 2424.096, -1230.081, 24.876
				end
			elseif faction == "fbi" then
				if ort == "sf" then
					x, y, z = -2436.471, 505.294, 29.932
				elseif ort == "ls" then
					x, y, z = 1261.411, -2026.78, 59.379
				end
			elseif faction == "reporter" then
				if ort == "sf" then
					x, y, z = -2039.985, 475.6399, 35.1722
				elseif ort == "ls" then
					x, y, z = 1261.411, -2026.78, 59.379
				end
			elseif faction == "sapd" then
				if ort == "sf" then
					x, y, z = -1627.94, 732.2522, 14.46
				elseif ort == "ls" then
					x, y, z = 1534.931, -1672.639, 13.3828
				elseif ort == "lv" then
					x, y, z = 2311.918, 2450.3564, 10.82
				end
			elseif faction == "surenos" then
				if ort == "sf" then
					x, y, z = -2183.0927734375,973.7822265625,80
				elseif ort == "ls" then
					x, y, z = 2225.198, -1329.256, 23.98
				elseif ort == "lv" then
					x, y, z = -800.16796875,2403.685546875,156.07870483398
				end
			elseif faction == "terror" then
				if ort == "sf" then
					x, y, z = -1980.03, -1615.191, 87.6322
				elseif ort == "ls" then
					x, y, z = 2221.5107421875,-2238.177734375,13.546875
				end
			elseif faction == "watts" then
				if ort == "sf" then
					x, y, z = -2462.1875, -126.4244, 25.7238
				elseif ort == "ls" then
					x, y, z = 1105.8626, -1208.111, 17.804
				end
			elseif faction == "nsa" then
				if ort == "sf" then
					x, y, z = -1745.1999511719, 770.29998779297, 24.89999961853
				end
			elseif faction == "yakuza" then
				if ort == "sf" then
					x, y, z = -2206.168, 640.921, 49.4375
				elseif ort == "ls" then
					x, y, z = 2808.968, -1577.713, 10.929
				elseif ort == "lv" then
					x, y, z = 1904.026, 957.25128, 10.82
				end
			end
				if x and y and z then
					local seat = getPedOccupiedVehicleSeat ( player )
					if seat == 0 then
						local veh = getPedOccupiedVehicle ( player )
						setElementPosition ( veh, x, y, z )
						setElementInterior ( veh, 0 )
						setElementDimension ( veh, 0 )
						setElementFrozen ( veh, true )
						setTimer ( setElementFrozen, 500, 1, veh, false )
					else
						removePedFromVehicle ( player )
						setElementPosition ( player, x, y, z )
						setElementInterior ( player, 0 )
						setElementDimension ( player, 0 )
					end
				end
		end
	end
end
addCommandHandler ( "port", portToPlace_func )
