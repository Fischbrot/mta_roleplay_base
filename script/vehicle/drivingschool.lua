function d_blip() 
	local d_blip_sf = createBlip( -2026.59, -101.53, 35.16, 36, 0, 0, 0, 255 )
	local d_marker_sf = createPickup ( -2026.59, -101.53, 35.16, 3, 1239 );
	setPickupRespawnInterval(d_marker_sf, 10)
	addEventHandler ( "onPickupHit", d_marker_sf, show_drivingschool )
end
addEventHandler("onResourceStart", getRootElement(), d_blip)


function show_drivingschool(source)
	triggerClientEvent ( source, "showDrivingschool", source)
end

function resultDrivingschool(giveLicense)
    local user = getPlayerName ( source )
    if (giveLicense == "carlicense") then
		local insert = dbExec(handler, "UPDATE `License` SET `carlicense`='true' WHERE `User` = '"..user.."' ")
    end	
    if (giveLicense == "bikelicense") then
		local insert = dbExec(handler, "UPDATE `License` SET `bikelicense`='true' WHERE `User` = '"..user.."' ")
    end	
    if (giveLicense == "lkwlicense") then
		local insert = dbExec(handler, "UPDATE `License` SET `lkwlicense`='true' WHERE `User` = '"..user.."' ")
    end	
    if (giveLicense == "gunlicense") then
		local insert = dbExec(handler, "UPDATE `License` SET `gunlicense`='true' WHERE `User` = '"..user.."' ")
    end	
    if (giveLicense == "planelicense") then
		local insert = dbExec(handler, "UPDATE `License` SET `planelicense`='true' WHERE `User` = '"..user.."' ")
    end	
    if (giveLicense == "helilicense") then
		local insert = dbExec(handler, "UPDATE `License` SET `helilicense`='true' WHERE `User` = '"..user.."' ")
    end	
    local query = dbQuery(handler, "SELECT * FROM `License` WHERE `User` = '"..getPlayerName ( source ).."'")
    local result, num_affected_rows, last_insert_id = dbPoll(query, -1)    
    if (result[1]["carlicense"] == "true") then
        setElementData(source, "carlicense", true)
    else
        setElementData(source, "carlicense", false)
    end
    if (result[1]["bikelicense"] == "true") then
        setElementData(source, "bikelicense", true)
    else
        setElementData(source, "bikelicense", false)
    end
    if (result[1]["lkwlicense"] == "true") then
        setElementData(source, "lkwlicense", true)
    else
        setElementData(source, "lkwlicense", false)
    end
    if (result[1]["gunlicense"] == "true") then
        setElementData(source, "gunlicense", true)
    else
        setElementData(source, "gunlicense", false)
    end
    if (result[1]["planelicense"] == "true") then
        setElementData(source, "planelicense", true)
    else
        setElementData(source, "planelicense", false)
    end
    if (result[1]["helilicense"] == "true") then
        setElementData(source, "helilicense", true)
    else
        setElementData(source, "helilicense", false)
    end
end
addEvent ("resultDrivingschool", true )
addEventHandler ("resultDrivingschool", getRootElement(), resultDrivingschool )


function myLicenses(player)
    if (getElementData(player, "carlicense") == true) then
        carlicense = "| carlicense |"
    else
        carlicense = ""
    end
    if (getElementData(player, "bikelicense") == true) then
        bikelicense = "| bikelicense |"
    else
        bikelicense = ""
    end
    if (getElementData(player, "lkwlicense") == true) then
        lkwlicense = "| lkwlicense |"
    else
        lkwlicense = ""
    end
    if (getElementData(player, "gunlicense") == true) then
        gunlicense = "| gunlicense |"
    else
        gunlicense = ""
    end
    if (getElementData(player, "planelicense") == true) then
        planelicense = "| planelicense |"
    else
        planelicense = ""
    end
    if (getElementData(player, "helilicense") == true) then
        helilicense = "| helilicense |"
    else
        helilicense = ""
    end
    outputChatBox("Your licenses are: "..carlicense.. "" ..bikelicense.. "" ..lkwlicense.. "" ..gunlicense.. "" ..planelicense.. "" ..helilicense.. "")
end
addCommandHandler("licenses", myLicenses)