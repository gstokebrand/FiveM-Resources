--
-- Code made by gstokebrand, 2019
-- https://github.com/gstokebrand/FiveM-Resources
-- GPL-3.0
--

--true = kmh, false = mph. Other values will result in an error. This can be changed in-game by using /speed
local kmh = true

--Command enabled. Boolean value required. Keep this enabled if you want the player to have control over the unit changer.
local cmdenabled = true

local speed = 0
local unit = ""

function notify(string)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(string)
    DrawNotification(true, false)
end

function text(content, content2)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(1.1,1.1)
    SetTextEntry("STRING")
    AddTextComponentString(content .. " " .. content2)
    DrawText(0.01,0.735)
end

--/speed command registration
RegisterCommand("speed", function()
    if cmdenabled == true then
        if kmh == true then
            kmh = false
            notify('~w~Speed unit changed to mp/h')
        elseif kmh == false then
            kmh = true
            notify('~w~Speed unit changed to km/h')
        else
            notify('~r~Fatal error')
        end
    else
        TriggerEvent("chatMessage",  "[Server]", {255,0,0}, "Command disabled!")
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if kmh == true then
            speed = math.floor((GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6))
            unit = "km/h"
        elseif kmh == false then
            speed = math.floor((GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.2369))
            unit = "mp/h"
        else
            speed = "Config error!"
        end
        if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
            text(speed, unit)
        end
    end
end)
