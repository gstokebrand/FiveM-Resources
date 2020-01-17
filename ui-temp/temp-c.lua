function text(content) 
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(1.1,1.1)
    SetTextEntry("STRING")
    AddTextComponentString("TEMP: " .. content .. "°C")
    DrawText(0.01,0.645)
end
Citizen.CreateThread(function()

    while true do
        Citizen.Wait(1)
        local temp = (GetVehicleEngineTemperature(GetVehiclePedIsIn(GetPlayerPed(-1), false)))
        -- Condition to check if the ped is in a vehicle
        if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
            text(math.floor(temp))
        end
    end
end)
