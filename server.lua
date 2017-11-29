--Settings--
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_business")

RegisterServerEvent('business:salary')
AddEventHandler('business:salary', function()
  	local user_id = vRP.getUserId({source})
	if vRP.hasGroup({user_id,'HBO'}) then
		vRP.giveMoney({user_id,26400})
	end																														
end)

RegisterServerEvent('business:checkmoney')
AddEventHandler('business:checkmoney', function()
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	if vRP.hasGroup({user_id,'HBO'}) then
	TriggerClientEvent('business:alreadyin', player)
	else if vRP.tryFullPayment({user_id,1320000}) then
		vRP.addUserGroup({user_id,'HBO'})
		TriggerClientEvent('business:success', player)
	  else
		TriggerClientEvent('business:notenough', player)
	  end
	 end
end)
