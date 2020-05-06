--
-- Code made by gstokebrand, 2020
-- https://github.com/gstokebrand/FiveM-Resources
-- GPL-3.0
--

function text(content)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(0.8,0.8)
    SetTextEntry("STRING")
    AddTextComponentString("Fuel: " .. content)
    DrawText(0.01,0.555)
end
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local fuel = (GetVehicleFuelLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false)))
        if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
            text(fuel)
        end
    end
end)