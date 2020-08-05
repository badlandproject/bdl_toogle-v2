
-- BADLAND BASE V3.0
-- DO NOT REDISTRIBUTE

-- [ Tunelagem & Variáveis ] --
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
arS = {}
poinT = {}
Tunnel.bindInterface("bdl_policepoint",poinT)

-- [ Evento Principal - Troque suas permissões e grupos aqui ] --
RegisterNetEvent('bdl:service')
AddEventHandler('bdl:service',function()
	local source = source
	local user_id = vRP.getUserId(source)
	   -- [ GET ON DUTY ]
	if vRP.hasPermission(user_id,"oos-rookie.permission") then
		TriggerClientEvent("Notify",source,"aviso","You got on duty. Do not forget your uniform and your equipments.",10000)
		poinT.getEquip()
		vRP.addUserGroup(user_id,"lspd-rookie")
	elseif vRP.hasPermission(user_id,"oos-officerjr.permission") then
		TriggerClientEvent("Notify",source,"aviso","You got on duty. Do not forget your uniform and your equipments.",10000)
		poinT.getEquip()
		vRP.addUserGroup(user_id,"lspd-officerjr")
	elseif vRP.hasPermission(user_id,"oos-officersr.permission") then
		TriggerClientEvent("Notify",source,"aviso","You got on duty. Do not forget your uniform and your equipments.",10000)
		poinT.getEquip()
		vRP.addUserGroup(user_id,"lspd-officersr")
	elseif vRP.hasPermission(user_id,"oos-detective.permission") then
		TriggerClientEvent("Notify",source,"aviso","You got on duty. Do not forget your uniform and your equipments.",10000)
		poinT.getEquip()
		vRP.addUserGroup(user_id,"lspd-detective")
	elseif vRP.hasPermission(user_id,"oos-sargeant.permission") then
		TriggerClientEvent("Notify",source,"aviso","You got on duty. Do not forget your uniform and your equipments.",10000)
		poinT.getEquip()
		vRP.addUserGroup(user_id,"lspd-sargeant")
	elseif vRP.hasPermission(user_id,"oos-lieutenant.permission") then
		TriggerClientEvent("Notify",source,"aviso","You got on duty. Do not forget your uniform and your equipments.",10000)
		poinT.getEquip()
		vRP.addUserGroup(user_id,"lspd-lieutenant")
	elseif vRP.hasPermission(user_id,"oos-captain.permission") then
		TriggerClientEvent("Notify",source,"aviso","You got on duty. Do not forget your uniform and your equipments.",10000)
		poinT.getEquip()
		vRP.addUserGroup(user_id,"lspd-captain")
	elseif vRP.hasPermission(user_id,"oos-comissioner.permission") then
		TriggerClientEvent("Notify",source,"aviso","You got on duty. Do not forget your uniform and your equipments.",10000)
		poinT.getEquip()
		vRP.addUserGroup(user_id,"lspd-comissioner")
		-- [ GET OFF DUTY ]
	elseif vRP.hasPermission(user_id,"rookie.permission") then
		TriggerClientEvent("Notify",source,"aviso","You got off duty. Do not forget to take off your uniform and your equipments.",10000)
		vRP.addUserGroup(user_id,"oos-rookie")
		poinT.remEquip()
	elseif vRP.hasPermission(user_id,"officerjr.permission") then
		TriggerClientEvent("Notify",source,"aviso","You got off duty. Do not forget to take off your uniform and your equipments.",10000)
		vRP.addUserGroup(user_id,"oos-officerjr")
		poinT.remEquip()
	elseif vRP.hasPermission(user_id,"officersr.permission") then
		TriggerClientEvent("Notify",source,"aviso","You got off duty. Do not forget to take off your uniform and your equipments.",10000)
		vRP.addUserGroup(user_id,"oos-officersr")
		poinT.remEquip()
	elseif vRP.hasPermission(user_id,"detective.permission") then
		TriggerClientEvent("Notify",source,"aviso","You got off duty. Do not forget to take off your uniform and your equipments.",10000)
		vRP.addUserGroup(user_id,"oos-detective")
		poinT.remEquip()
	elseif vRP.hasPermission(user_id,"sargeant.permission") then
		TriggerClientEvent("Notify",source,"aviso","You got off duty. Do not forget to take off your uniform and your equipments.",10000)
		vRP.addUserGroup(user_id,"oos-sargeant")
		poinT.remEquip()
	elseif vRP.hasPermission(user_id,"lieutenant.permission") then
		TriggerClientEvent("Notify",source,"aviso","You got off duty. Do not forget to take off your uniform and your equipments.",10000)
		vRP.addUserGroup(user_id,"oos-lieutenant")
		poinT.remEquip()
	elseif vRP.hasPermission(user_id,"captain.permission") then
		TriggerClientEvent("Notify",source,"aviso","You got off duty. Do not forget to take off your uniform and your equipments.",10000)
		vRP.addUserGroup(user_id,"oos-captain")
		poinT.remEquip()
	elseif vRP.hasPermission(user_id,"comissioner.permission") then
		TriggerClientEvent("Notify",source,"aviso","You got off duty. Do not forget to take off your uniform and your equipments.",10000)
		vRP.addUserGroup(user_id,"oos-comissioner")
		poinT.remEquip()
	else
		TriggerClientEvent("Notify",source,"negado","Denied. Are you a real police officer?",5000)
	end
end)

-- [ Função de equipamento automático ] --
function poinT.getEquip()
	local src = source
	local user_id = vRP.getUserId(src)
	if vRP.hasPermission(user_id,"oos-rookie.permission") then
		vRPclient._giveWeapons(source,{["WEAPON_STUNGUN"] = { ammo = 0 }})
		vRPclient._giveWeapons(source,{["WEAPON_FLASHLIGHT"] = { ammo = 0 }})
		vRPclient._giveWeapons(source,{["WEAPON_NIGHTSTICK"] = { ammo = 0 }})
		vRPclient._giveWeapons(source,{["WEAPON_COMBATPISTOL"] = { ammo = 50 }})
		vRPclient.setArmour(source,100)

	elseif vRP.hasPermission(user_id,"oos-officerjr.permission") or vRP.hasPermission(user_id,"oos-officersr.permission") then
		vRPclient._giveWeapons(source,{["WEAPON_STUNGUN"] = { ammo = 0 }})
		vRPclient._giveWeapons(source,{["WEAPON_FLASHLIGHT"] = { ammo = 0 }})
		vRPclient._giveWeapons(source,{["WEAPON_NIGHTSTICK"] = { ammo = 0 }})
		vRPclient._giveWeapons(source,{["WEAPON_COMBATPISTOL"] = { ammo = 50 }})
		vRPclient._giveWeapons(source,{["WEAPON_SMG"] = { ammo = 100 }})
		vRPclient.setArmour(source,100)

	elseif vRP.hasPermission(user_id,"oos-detective.permission") then
		vRPclient._giveWeapons(source,{["WEAPON_FLASHLIGHT"] = { ammo = 0 }})
		vRPclient._giveWeapons(source,{["WEAPON_PISTOL_MK2"] = { ammo = 50 }})

	elseif vRP.hasPermission(user_id,"oos-sargeant.permission") then
		vRPclient._giveWeapons(source,{["WEAPON_STUNGUN"] = { ammo = 0 }})
		vRPclient._giveWeapons(source,{["WEAPON_FLASHLIGHT"] = { ammo = 0 }})
		vRPclient._giveWeapons(source,{["WEAPON_NIGHTSTICK"] = { ammo = 0 }})
		vRPclient._giveWeapons(source,{["WEAPON_COMBATPISTOL"] = { ammo = 75 }})
		vRPclient._giveWeapons(source,{["WEAPON_SMG"] = { ammo = 120 }})
		vRPclient.setArmour(source,100)

	elseif vRP.hasPermission(user_id,"oos-lieutenant.permission") then
		vRPclient._giveWeapons(source,{["WEAPON_STUNGUN"] = { ammo = 0 }})
		vRPclient._giveWeapons(source,{["WEAPON_FLASHLIGHT"] = { ammo = 0 }})
		vRPclient._giveWeapons(source,{["WEAPON_NIGHTSTICK"] = { ammo = 0 }})
		vRPclient._giveWeapons(source,{["WEAPON_COMBATPISTOL"] = { ammo = 75 }})
		vRPclient._giveWeapons(source,{["WEAPON_SMG"] = { ammo = 120 }})
		vRPclient._giveWeapons(source,{["WEAPON_COMBATPDW"] = { ammo = 120 }})
		vRPclient.setArmour(source,100)

	elseif vRP.hasPermission(user_id,"oos-captain.permission") or vRP.hasPermission(user_id,"oos-comissioner.permission") then
		vRPclient._giveWeapons(source,{["WEAPON_STUNGUN"] = { ammo = 0 }})
		vRPclient._giveWeapons(source,{["WEAPON_FLASHLIGHT"] = { ammo = 0 }})
		vRPclient._giveWeapons(source,{["WEAPON_NIGHTSTICK"] = { ammo = 0 }})
		vRPclient._giveWeapons(source,{["WEAPON_COMBATPISTOL"] = { ammo = 100 }})
		vRPclient._giveWeapons(source,{["WEAPON_PISTOL_MK2"] = { ammo = 100 }})
		vRPclient._giveWeapons(source,{["WEAPON_SMG"] = { ammo = 150 }})
		vRPclient._giveWeapons(source,{["WEAPON_COMBATPDW"] = { ammo = 150 }})
		vRPclient._giveWeapons(source,{["WEAPON_CARBINERIFLE"] = { ammo = 200 }})
		vRPclient.setArmour(source,100)
	end
end

-- [ Função de remoção de equipamento automático ] --
function poinT.remEquip()
	local src = source
	local user_id = vRP.getUserId(src)
	vRPclient.setArmour(source,0)
	vRPclient._replaceWeapons(source,{["WEAPON_UNARMED"] = { ammo = 0 }})
end

-- [ Função de permissão client-side ] --
function arS.arsenalPermission(group)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		return vRP.hasPermission(user_id,group)
	end
end