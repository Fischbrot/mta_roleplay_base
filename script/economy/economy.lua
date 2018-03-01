function pay( player, command, target, amount )

	local targetPlayer = getPlayerFromName( target )

	if (getPlayerName( player ) == target) then
		outputChatBox("You can't send money to yourself!")
	else
		if (getElementData(player, "logedin") == true ) then
			if (getElementData(targetPlayer, "logedin") == true ) then
				local query = dbQuery(handler, "SELECT * FROM `Player` WHERE `Serial` = '"..getPlayerSerial( player ).."'")
				local result, num_rows = dbPoll(query, -1)
	    		local answer = result[1]
				local giveMoney = tonumber(amount)
				local player = player
				local raw_money = result[1]["Money"]
				local money = tonumber(raw_money)
		
				local query = dbQuery(handler, "SELECT * FROM `Player` WHERE `Serial` = '"..getPlayerSerial( targetPlayer ).."'")
				local result, num_rows = dbPoll(query, -1)
	    		local answer = result[1]
	    		local targetPlayerMoney_raw = result[1]["Money"]
	    		local targetPlayerMoney = tonumber(targetPlayerMoney_raw)
		
			
		
				if ( tonumber(amount) <=  money ) then -- Check if the string exist
					outputChatBox("Give "..target.." "..giveMoney.."$")
					local money = money - giveMoney
					local giveMoney = targetPlayerMoney + giveMoney 
					local insert = dbExec(handler, "UPDATE `Player` SET `Money` = '"..money.."' WHERE `User` = '"..getPlayerName( player ).."'")
					local insert = dbExec(handler, "UPDATE `Player` SET `Money` = '"..giveMoney.."' WHERE `User` = '"..getPlayerName( targetPlayer ).."'")
		
					setPlayerMoney(targetPlayer, giveMoney )
					setPlayerMoney(player, money)
				else 
					outputChatBox("You don't have enough money!")
				end
			else
				outputChatBox("Player is offline!")
			end
		else 
			outputChatBox("You are not logged in!")
		end
	end
end
addCommandHandler("pay", pay)	