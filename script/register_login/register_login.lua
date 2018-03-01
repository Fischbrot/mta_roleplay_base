function isRegistered()
    local player = getPlayerName( source )
    local query = dbQuery(handler, "SELECT * FROM `Player` WHERE `Serial` = '"..getPlayerSerial( source ).."'")
    local result, num_rows = dbPoll(query, -1)
    local answer = result[1]
    if (answer == nil) then
        dbFree(query)
        outputChatBox(""..getPlayerName( source ).." is NOT registered")
        triggerClientEvent ( source, "showRegisterScreen", source) 
    elseif (result[1]["Serial"] == getPlayerSerial( source )) then
        triggerClientEvent ( source, "showLoginScreen", source) 
        outputChatBox(""..getPlayerName( source ).." is registered")
    else 
        dbFree(query)
        outputChatBox(""..getPlayerName( source ).." is NOT registered")
        triggerClientEvent ( source, "showRegisterScreen", source) 
    end 

end 
addEventHandler( "onPlayerJoin", getRootElement(), isRegistered)

function getRegisterData ( password )
    local user = getPlayerName ( source )
    local pw = sha256(password)
    local serial = getPlayerSerial ( source )
    local insert = dbExec(handler, "INSERT INTO `Player` (`User`, `Password`, `Money`, `Serial`, `Registered`) VALUES ('"..user.."', '"..pw.."', '500', '"..serial.."', 'true')")
    local query = dbQuery(handler, "SELECT * FROM `Player` WHERE `User` = '"..getPlayerName ( source ).."'")
    local result, num_affected_rows, last_insert_id = dbPoll(query, -1)    
    if insert then 
        outputChatBox("INFO: "..user.." is now registered on this server! Welcome!")
        local money = result[1]["Money"]
        setPlayerMoney(source, tonumber(money))
    else 
        outputDebugString("INFO: "..user.." Could not register.")
    end
end
addEvent ("getRegisterData", true )
addEventHandler ("getRegisterData", getRootElement(), getRegisterData )

function getLoginData ( password, sourcePlayer )
    local loginpw = sha256(password)
    local query = dbQuery(handler, "SELECT * FROM `Player` WHERE `User` = '"..getPlayerName ( source ).."'")
    local result, num_affected_rows, last_insert_id = dbPoll(query, -1)
    if (result[1]["Password"] == loginpw) then
        local money = result[1]["Money"]
        setPlayerMoney(source, tonumber(money))
        outputChatBox("Logedin")

        setElementData(source, "logedin", true)
        setElementData(source, "adminlvl", result[1]["Adminlevel"])

        if (getElementData(source, "adminlvl") > 0) then
        	outputChatBox("You are Adminlevel "..result[1]["Adminlevel"].."!")
        end
    else 
        outputChatBox("Wrong Password!")
        triggerClientEvent ( source, "showLoginScreen", source)
        setElementData(source, "logedin", false)
    end
end

addEvent ("getLoginData", true )
addEventHandler ("getLoginData", getRootElement(), getLoginData )

function isLogedIn(player)
	if (getElementData(player, "logedin") == true) then
		outputChatBox("You are logged in!")
	else
		outputChatBox("Fail!")
	end
end
addCommandHandler("logedin", isLogedIn)