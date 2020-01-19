function text(content)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(1.1,1.1)
    SetTextEntry("STRING")
    AddTextComponentString("RPM: " .. content)
    DrawText(0.01,0.6)
end
Citizen.CreateThread(function()

    while true do
        Citizen.Wait(1)
        local rpm = (GetVehicleCurrentRpm(GetVehiclePedIsIn(GetPlayerPed(-1), false)))
        if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
            text(rpm)
        end
    end
end)
