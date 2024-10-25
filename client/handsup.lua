local handsUp = false

RegisterCommand(Config.HandsUp.command, function()
    local ped = PlayerPedId()
    if not HasAnimDictLoaded('missminuteman_1ig_2') then
        RequestAnimDict('missminuteman_1ig_2')
        while not HasAnimDictLoaded('missminuteman_1ig_2') do
            Wait(10)
        end
    end
    handsUp = not handsUp
   -- if exports['qb-policejob']:IsHandcuffed() then return end CHANGE FOR OKOK
    if handsUp then
        TaskPlayAnim(ped, 'missminuteman_1ig_2', 'handsup_base', 8.0, 8.0, -1, 50, 0, false, false, false)
        exports['esx-smallresources']:addDisableControls(Config.HandsUp.controls)
    else
        ClearPedTasks(ped)
        exports['esx-smallresources']:removeDisableControls(Config.HandsUp.controls)
    end
end, false)

RegisterKeyMapping(Config.HandsUp.command, 'Hands Up', 'keyboard', Config.HandsUp.keybind)
exports('getHandsup', function() return handsUp end)
