Citizen.CreateThread(function()
    local player = GetPlayerPed(-1)
    local teleportKey = Config.teleportKey
    local teleportLocations = Config.teleportLocations

    while true do
        Citizen.Wait(10)
        local playerLoc = GetEntityCoords(player)

        for _, location in ipairs(teleportLocations) do
            local loc1 = {
                x = location[1][1],
                y = location[1][2],
                z = location[1][3] - 1,
                heading = location[1][4]
            }

            local loc2 = {
                x = location[2][1],
                y = location[2][2],
                z = location[2][3] - 1,
                heading = location[2][4]
            }

            local controlName = string.sub(GetControlInstructionalButton(1, teleportKey, false), 3)

            local Red, Green, Blue = location[3][1], location[3][2], location[3][3]

            DrawMarker(1, loc1.x, loc1.y, loc1.z, 0, 0, 0, 0, 0, 0, 1.2, 1.2, 0.2, Red, Green, Blue, 100, 0, 0, 0, 0)
            DrawMarker(1, loc2.x, loc2.y, loc2.z, 0, 0, 0, 0, 0, 0, 1.2, 1.2, 0.2, Red, Green, Blue, 100, 0, 0, 0, 0)

            if CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, loc1.x, loc1.y, loc1.z, 2) then
                lib.showTextUI("[" .. controlName .. "] - " .. location[4])

                if IsControlJustReleased(1, teleportKey) then
                    TriggerServerEvent("mmo-teleports:checkPerm", player, loc2, location)
                end

            elseif CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, loc2.x, loc2.y, loc2.z, 2) then
                lib.showTextUI("[" .. controlName .. "] - " .. location[5])

                if IsControlJustReleased(1, teleportKey) then
                    TriggerServerEvent("mmo-teleports:checkPerm", player, loc1, location)
                end
            else
                lib.hideTextUI()
            end
        end
    end
end)

RegisterNetEvent('mmo-teleports:tp')
AddEventHandler('mmo-teleports:tp', function(player, location)
    if IsPedInAnyVehicle(player, true) and Config.teleportVehicles then
        local vehicle = GetVehiclePedIsUsing(player)
        if vehicle then
            SetEntityCoords(vehicle, location.x, location.y, location.z)
            SetEntityHeading(vehicle, location.heading)
        end
    else
        SetEntityCoords(player, location.x, location.y, location.z)
        SetEntityHeading(player, location.heading)
    end
end)

function CheckPos(x, y, z, cx, cy, cz, radiusSquared)
    local distanceSquared = (x - cx) ^ 2 + (y - cy) ^ 2 + (z - cz) ^ 2
    return distanceSquared <= radiusSquared
end
