
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
				DrawSpecialText("Press [~g~E~s~] to buy this business!")
				if(IsControlJustPressed(1, Key)) then
				TriggerServerEvent('business:checkmoney')
			end
		end
	end
end)

Citizen.CreateThread(function ()
	while true do
	local user_id = vRP.getUserId({source})
		Citizen.Wait(5000) -- Every 30 minutes you get paid your business money.
		TriggerServerEvent('business:salary')
		vRP.notify({"~g~Your business earnings: $26400!"})
	end
end)

RegisterNetEvent('business:success')
AddEventHandler('business:success', function()
	vRP.notify({"~g~You are now the owner of this business, Congrats!"})
end)
RegisterNetEvent('business:notenough')
AddEventHandler('business:notenough', function()
	vRP.notify({"~r~Not enough money."})
end)
RegisterNetEvent('business:alreadyin')
AddEventHandler('business:alreadyin', function()
	vRP.notify({"~r~You already own this business."})
end)
