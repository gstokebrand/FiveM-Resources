--
-- Code made by gstokebrand, 2019
-- https://github.com/gstokebrand/FiveM-Resources
-- GPL-3.0
--

function text(content)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(1.1,1.1)
    SetTextEntry("STRING")
    AddTextComponentString(content)
    DrawText(0.5,0.01)
end
Citizen.CreateThread(function()

    while true do
        Citizen.Wait(5)
        local rot = (GetEntityHeading(GetVehiclePedIsIn(GetPlayerPed(-1), false)))
        --If statement to check what direction the car is facing
        if 22.5 < rot and rot < 67.5 then
            rot = "NW"
        elseif 67.5 < rot and rot < 112.5 then
            rot = "W"
        elseif 112.5 < rot and rot < 157.5 then
            rot = "SW"
        elseif 157.5 < rot and rot < 202.5 then
            rot = "S"
        elseif 202.5 < rot and rot < 247.5 then
            rot = "SE"
        elseif 247.5 < rot and rot < 292.5 then
            rot = "E"
        elseif 292.5 < rot and rot < 337.5 then
            rot = "NE"
        else
            rot = "N"
        end
        if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
            text(rot)
        end
    end
end)
