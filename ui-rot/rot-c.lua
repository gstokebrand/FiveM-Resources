function text(content) 
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(1.1,1.1)
    SetTextEntry("STRING")
    AddTextComponentString("GEAR: " .. content)
    DrawText(0.01,0.6)
end
Citizen.CreateThread(function()

    while true do
        Citizen.Wait(1)
        local rot = (GetEntityHeading(GetVehiclePedIsIn(GetPlayerPed(-1), false)))
        if 22.5 < rot and rot < 67.5 then
            rot = "NE"
        elseif 67.5 < rot and rot < 112.5 then
            rot = "E"
        elseif 112.5 < rot and rot < 157.5 then
            rot = "SE"
        elseif 157.5 < rot and rot < 202.5 then
            rot = "S"
        elseif 202.5 < rot and rot < 247.5 then
            rot = "SW"
        elseif 247.5 < rot and rot < 292.5 then
            rot = "W"
        elseif 292.5 < rot and rot < 337.5 then
            rot = "NW"
        else
            rot = "N"
        end
        --ition to check if the ped is in a vehicle
        if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
            text(rot)
        end
    end
end)
