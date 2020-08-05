
-- BADLAND BASE V3.0
-- DO NOT REDISTRIBUTE

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
poinT = Tunnel.getInterface("bdl_policepoint")
arS = {}
vSERVER = Tunnel.getInterface("bdl_policepoint")

local clocks = {
	{ ['x'] = -1102.86, ['y'] = -829.57, ['z'] = 14.29 },
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		for k,v in pairs(clocks) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			local clocks = clocks[k]
			if distance <= 30 then
				DrawMarker(23, clocks.x, clocks.y, clocks.z-0.97,0,0,0,0,0,0,1.0,1.0,0.5,150,150,0,100,0,0,0,0)
				if distance <= 1.5 then
					drawTxt("PRESSIONE  ~r~E~w~  PARA BATER SEU PONTO",4,0.5,0.92,0.5,255,255,255,180)
					if IsControlJustPressed(0,38) then
						TriggerServerEvent('bdl:service')
					end
				end
			end
		end
	end
end)

function poinT.remWeapons()
	RemoveAllPedWeapons(PlayerPedId,true)
end

function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end