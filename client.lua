
Key = 38 -- E

vRP = Proxy.getInterface("vRP")

local blips = {
	{title="Warner Bros Studios (1320000)", colour=29, id=374, x=-1013.8024, y=-489.4412, z=37.0622},
}


Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 5)
      SetBlipScale(info.blip, 1.2)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

function DrawSpecialText(m_text, showtime)
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end

-- Warner Bros Studios

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -1014.1352539062,-489.65014648438,37.068202972412, true ) < 5 then
				DrawSpecialText("Pulsa [~g~E~s~] para comprar Warner Bros Studios!")
				if(IsControlJustPressed(1, Key)) then
				TriggerServerEvent('hbo:checkmoney')
			end
		end
	end
end)


RegisterNetEvent('hbo:success')
AddEventHandler('hbo:success', function()
	vRP.notify({"~g~Ahora eres dueño de esta empresa, Suerte!"})
end)
RegisterNetEvent('hbo:notenough')
AddEventHandler('hbo:notenough', function()
	vRP.notify({"~r~Dinero insuficiente."})
end)
RegisterNetEvent('hbo:alreadyin')
AddEventHandler('hbo:alreadyin', function()
	vRP.notify({"~r~Ya eres dueño de esta empresa."})
end)
