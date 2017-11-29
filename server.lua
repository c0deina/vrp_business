--Settings--
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_empresas")

RegisterServerEvent('hbo:checkmoney')
AddEventHandler('hbo:checkmoney', function(empresa)
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	if vRP.hasGroup({user_id,'HBO'}) then
	TriggerClientEvent('hbo:alreadyin', player)
	else if vRP.tryFullPayment({user_id,1320000}) then
		vRP.addUserGroup({user_id,'HBO'})
		TriggerClientEvent('hbo:success', player)
	  else
		TriggerClientEvent('hbo:notenough', player)
	  end
	 end
end)