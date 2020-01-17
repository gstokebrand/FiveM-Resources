function text(content)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(1.1,1.1)
    SetTextEntry("STRING")
    AddTextComponentString("GEAR: " .. content)
    DrawText(0.01,0.69)
end
Citizen.CreateThread(function()

    while true do
        Citizen.Wait(1)
        local gear = (GetVehicleCurrentGear(GetVehiclePedIsIn(GetPlayerPed(-1), false)))
        if gear == 0 then
            gear = "R"
        end
        if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
            text(gear)
        end
    end
end)
