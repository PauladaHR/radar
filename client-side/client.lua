local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

vSERVER = Tunnel.getInterface(GetCurrentResourceName())

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped) then
            local playerCoords = GetEntityCoords(ped)
            for _,coords in pairs(cfg.locs) do
                local distance = #(playerCoords - vector3(coords["x"],coords["y"],coords["z"]))
                if distance <= 25 then
                    local currentVeh = GetVehiclePedIsUsing(ped)
                    local speed = GetEntitySpeed(currentVeh) * cfg.typeSpeed
                    if speed >= cfg.maxVehicleSpeed then
                        vSERVER.finesPayment()
                        break
                    end
                end
            end
        end
        Wait(1000)
    end
end)

CreateThread(function()
	for _,v in pairs(cfg.locs) do
		local blip = AddBlipForCoord(v["x"],v["y"],v["z"])
		SetBlipSprite(blip,cfg.blipType)
		SetBlipAsShortRange(blip,true)
		SetBlipColour(blip,cfg.blipColor)
		SetBlipScale(blip,cfg.blipScale)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Radar")
		EndTextCommandSetBlipName(blip)
	end
end)