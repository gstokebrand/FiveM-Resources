--
-- Code made by gstokebrand, 2019
-- https://github.com/gstokebrand/FiveM-Resources
-- GPL-3.0
--

--rpm at which the rpm will turn red. Any value larger than 100 will disable the color change.
local rpmcolor = 90

--[[
    Color to change to.
    Default = r
    r = Red
    b = Blue
    g = Green
    y = Yellow
    p = Purple
    c = Grey
    m = Dark Grey
    u = Black
    o = Orange
--]]
local color = "r"

--Determines whether "Idle" should be displayed when rpm at 20%
local idletxt = false



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
        local rpm = math.floor(100 * (GetVehicleCurrentRpm(GetVehiclePedIsIn(GetPlayerPed(-1), false))))
        if rpm >= rpmcolor then
           rpm = "~" .. color .. "~" .. rpm .. "%"
        elseif rpm == 20 and idletxt == true then
            rpm = "Idle"
        else 
            rpm = rpm .. "%"
        end
        if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
            text(rpm)
        end
    end
end)
