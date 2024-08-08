ESX = nil
ESX = exports["es_extended"]:getSharedObject()

isindeal = false

Citizen.CreateThread(function()

    if Config.Ped.ShowPed == true then
        local pedModel = GetHashKey(Config.Ped.PedModel)
        local pedCoords = Config.Ped.PedCoords
        local pedHeading = Config.Ped.PedHeading

        RequestModel(pedModel)

        while not HasModelLoaded(pedModel) do
            Citizen.Wait(10)
        end

        local ped = CreatePed(5, pedModel, pedCoords.x, pedCoords.y, pedCoords.z, pedHeading, false, false)

        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
    end

    while true do
        local sleep = 500
        
        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId(), false), Config.Ped.PedCoords.x, Config.Ped.PedCoords.y, Config.Ped.PedCoords.z) < 2.5 then
            sleep = 10
            ESX.ShowHelpNotification(Config.Text.Text)
            if IsControlJustPressed(0, Config.Menu.ControlToOpenMenu) then
                OpenBlackmarketMenu()
            end
        end

        if isindeal == true then
			sleep = 10
        end
        
		if IsControlJustReleased(0, 73) then
			isindeal = false
	    end

    Citizen.Wait(0)
    end
end)

function OpenBlackmarketMenu()
    ESX.UI.Menu.Open(
        "default", GetCurrentResourceName(), "blackmarket",
        {
            title = Config.Menu.MenuName,
            align = Config.Menu.MenuAlign,
            elements = Config.Items
        },
        function(data, menu)
            local item = data.current.item
            local amount = data.current.value
            local price = data.current.value * data.current.price

            local markerCoords = Config.Waypoint

            TriggerServerEvent("lurvorx_blackmarket:checkMoney", item, amount, price, markerCoords)

            Citizen.CreateThread(function()
                local hasPickedUpItem = false
                while not hasPickedUpItem do
                    Citizen.Wait(0)
                    if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId(), false), markerCoords.x, markerCoords.y, markerCoords.z) < 2.5 then
                        ESX.ShowHelpNotification("~INPUT_CONTEXT~ " .. Config.Strings.MarkerPlace.takeItem)
                        if IsControlJustPressed(0, Config.Menu.ControlToOpenMenu) then
                            TriggerServerEvent("lurvorx_blackmarket:buyItem", item, amount, price)
                            hasPickedUpItem = true
                        end
                    end
                end
            end)
        end,
        function(data, menu)
            menu.close()
            isindeal = false
        end
    )
end

RegisterNetEvent("lurvorx_blackmarket:setWaypoint")
AddEventHandler("lurvorx_blackmarket:setWaypoint", function(markerCoords)
    SetNewWaypoint(markerCoords.x, markerCoords.y)
end)
