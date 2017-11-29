--Settings--
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_empresas")

RegisterServerEvent('business:salary')
AddEventHandler('business:salary', function()
  	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"business") then
		vRP.giveMoney(user_id,26400)
		vRPclient.notify(source,{"Your business earnings: $26400"})
	end																														
end)

RegisterServerEvent('hbo:checkmoney')
AddEventHandler('hbo:checkmoney', function(empresa)
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	if vRP.hasGroup({user_id,"HBO"}) then
	TriggerClientEvent('hbo:alreadyin', player)
	else if vRP.tryFullPayment({user_id,1320000}) then
		vRP.addUserGroup({user_id,"HBO"})
		TriggerClientEvent('hbo:success', player)
	  else
		TriggerClientEvent('hbo:notenough', player)
	  end
	 end
end)
