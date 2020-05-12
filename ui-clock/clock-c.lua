--
-- Code made by gstokebrand, 2020
-- https://github.com/gstokebrand/FiveM-Resources
-- GPL-3.0
--

function text(hours, minutes)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(0.8,0.8)
    SetTextEntry("STRING")
    AddTextComponentString("~u~" .. hours .. ":" .. minutes)
    DrawText(0.01,0.01)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local h = GetClockHours()
        if string.len(tostring(h)) == 1 then
            h = 0 .. h
        end
        local m = GetClockMinutes()
        if string.len(tostring(m)) == 1 then
            m = 0 .. m
        end
        text(h, m)
    end
end)