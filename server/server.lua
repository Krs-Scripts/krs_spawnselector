ESX = exports.es_extended:getSharedObject()

lib.callback.register('krs_spawnselector:GetPlayerLastCoords', function(source)
    local coords
    if ESX then 
        local xPlayer = ESX.GetPlayerFromId(source)
        local identifier = xPlayer.getIdentifier()
        coords = MySQL.query.await('SELECT `position` FROM `users` WHERE `identifier` = ?', {
            identifier
        })
        print(json.encode(coords))
    end
    return coords
end)