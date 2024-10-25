local ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('KickForAFK', function()
	DropPlayer(source, "You were kicked for being AFK")
end)

ESX.RegisterServerCallback('esx-afkkick:server:GetPermissions', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        cb(xPlayer.getGroup())
    else
        cb('user') -- or whatever default you want to return
    end
end)

