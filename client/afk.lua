local ESX = exports['es_extended']:getSharedObject()
local isLoggedIn = LocalPlayer.state.isLoggedIn
local checkUser = true
local prevPos, time = nil, nil
local timeMinutes = {
    ['900'] = 'minutes',
    ['600'] = 'minutes',
    ['300'] = 'minutes',
    ['150'] = 'minutes',
    ['60'] = 'minutes',
    ['30'] = 'seconds',
    ['20'] = 'seconds',
    ['10'] = 'seconds',
}

ESX.TriggerServerCallback('qb-afkkick:server:GetPermissions', function(userGroups)
    local checkUser = true -- Default to true, assume user can be kicked

    for group in pairs(userGroups) do
        if Config.AFK.ignoredGroups[group] then
            checkUser = false -- User is in an ignored group
            break
        end
    end

    -- Now you can use checkUser to decide if the user should be kicked or not
    if checkUser then
        -- Logic for kicking the user for being AFK
        print("User is not in an ignored group. Proceed with AFK kick.")
    else
        print("User is in an ignored group. No action taken.")
    end
end)

RegisterNetEvent('ESX:Client:OnPlayerLoaded', function()
    updatePermissionLevel()
    isLoggedIn = true
end)

RegisterNetEvent('ESX:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

RegisterNetEvent('ESX:Client:OnPermissionUpdate', function()
    updatePermissionLevel()
end)

CreateThread(function()
    while true do
        Wait(10000)
        local ped = PlayerPedId()
        if isLoggedIn == true or Config.AFK.kickInCharMenu == true then
            if checkUser then
                local currPos = GetEntityCoords(ped, true)
                if prevPos then
                    if currPos == prevPos then
                        if time then
                            if time > 0 then
                                local _type = timeMinutes[tostring(time)]
                                if _type == 'minutes' then
                                    ESX.ShowNotification("You are AFK and will be kicked in "..math.ceil(time/60).." minute(s)!") 
                                elseif _type == 'seconds' then
                                    ESX.ShowNotification("You are AFK and will be kicked in "..time.." seconds!") 
                                end
                                time -= 10
                            else
                                TriggerServerEvent('KickForAFK')
                            end
                        else
                            time = Config.AFK.secondsUntilKick
                        end
                    else
                        time = Config.AFK.secondsUntilKick
                    end
                end
                prevPos = currPos
            end
        end
    end
end)
