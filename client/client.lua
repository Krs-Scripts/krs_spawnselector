RegisterNUICallback('close', function(data)
    SetNuiFocus(false, false)
end)

function openSpawnSelector()
    SendNUIMessage({
        type = "openSpawnSelector",
    })
    SetNuiFocus(true, true)
end

exports('openSpawnSelector', function(state)
    return openSpawnSelector(state)
end)

AddEventHandler('esx:onPlayerSpawn', function()
    local createCam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 706.6160, 1000.603, 355.71, 0.00, 0.00, 0.00, 100.00, false, 0)
    SetCamActive(createCam, true)
    RenderScriptCams(true, false, 1, true, true)
    FreezeEntityPosition(cache.ped, true)
    SetEntityVisible(cache.ped, false, false)
end)

-- RegisterCommand('map', function()
--     exports.krs_spawnselector:openSpawnSelector(true)
-- end)

RegisterNetEvent('krs_spawnselector:spawnPlayer', function()
    exports.krs_spawnselector:openSpawnSelector(true)
end)

RegisterNuiCallback('lastposition', function(data, cb)
    local data = lib.callback.await('krs_spawnselector:GetPlayerLastCoords', 100)
    local decodedData = json.decode(data[1].position)
    local coords = vector3(decodedData.x, decodedData.y, decodedData.z)
    local heading = decodedData.heading
    local playerPed = cache.ped
    SetEntityCoords(playerPed, coords.x, coords.y, coords.z, false, false, false, true)
    SetEntityHeading(playerPed, heading)
    SetNuiFocus(false,false)
    RenderScriptCams(false, false, 1, true, true) 
    DestroyCam(createCam, false)
    FreezeEntityPosition(playerPed, false)
    SetEntityVisible(playerPed, true, false)
    cb(true)
end)

local function teleportPlayer(coords, heading)
    local playerPed = cache.ped
    SetEntityCoords(playerPed, coords.x, coords.y, coords.z, false, false, false, true)
    SetEntityHeading(playerPed, heading)
    SetNuiFocus(false, false)
    RenderScriptCams(false, false, 1, true, true) 
    DestroyCam(createCam, false)
    FreezeEntityPosition(playerPed, false)
    SetEntityVisible(playerPed, true, false)
end

RegisterNUICallback('sandy', function()
    teleportPlayer(cfg.PointSandy, cfg.PointSandy.w)
end)

RegisterNUICallback('police', function()
    teleportPlayer(cfg.PointPolice, cfg.PointPolice.w)
end)

RegisterNUICallback('airport', function()
    teleportPlayer(cfg.PointAirport, cfg.PointAirport.w)
end)

RegisterNUICallback('hospital', function()
    teleportPlayer(cfg.PointHospital, cfg.PointHospital.w)
end)

RegisterNUICallback('paleto', function()
    teleportPlayer(cfg.PointPaleto, cfg.PointPaleto.w)
end)