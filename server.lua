RegisterServerEvent('mmo-teleports:checkPerm')
AddEventHandler('mmo-teleports:checkPerm', function(player, specificLocation, perm)
    if Config.useAce then
        if IsPlayerAceAllowed(source, perm[6]) then
            TriggerClientEvent("mmo-teleports:tp", -1, player, specificLocation)
        end
    else
        TriggerClientEvent("mmo-teleports:tp", -1, player, specificLocation)
    end
end)
