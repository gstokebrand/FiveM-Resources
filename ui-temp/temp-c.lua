--
-- Code made by gstokebrand, 2019
-- https://github.com/gstokebrand/FiveM-Resources
-- GPL-3.0
--

--Temperature unit to use when player first joins server, true = °C, false = °F, other values will result in errors
local celsius = true

--Command enabled. Boolean value required. Keep this enabled if you want the player to have control over the unit changer.
local cmdenabled = true

local temp = 0
local unit = ""

function notify(string)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(string)
    DrawNotification(true, false)
end

function text(content, unitl)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(1.1,1.1)
    SetTextEntry("STRING")
    AddTextComponentString("TEMP: " .. content .. unitl)
    DrawText(0.01,0.645)
end

--/temp command changes temperature unit
RegisterCommand("temp", function()
    if cmdenabled == true then
        if celsius == true then
            celsius = false
            notify('~w~Changed temp unit to °F')
        elseif celsius == false then
            celsius = true
            notify('~w~Changed temp unit to °C')
        else
            notify('~r~Fatal error')
        end
    else
        TriggerEvent("chatMessage",  "[Server]", {255,0,0}, "Command disabled!")
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if celsius == true then
            temp = math.floor((GetVehicleEngineTemperature(GetVehiclePedIsIn(GetPlayerPed(-1), false))))
            unit = "°C"
        elseif celsius == false then
            temp = math.floor(((GetVehicleEngineTemperature(GetVehiclePedIsIn(GetPlayerPed(-1), false))) * 1.8) + 32)
            unit = "°F"
        else
            temp = "incorrect config!"
            unit = ""
        end
        if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
            text(temp, unit)
        end
    end
end)
