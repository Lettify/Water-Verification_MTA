addEventHandler('onClientResourceStart', resourceRoot, 
	function ()
		everyPlayers = getElementsByType('player')
		triggerServerEvent('onClientRequestServerToInit', localPlayer)
	end
)

local isPlayerInTable(player)
	for i, v in ipairs(everyPlayers) do
		if (v == player) then
			return true, i
		end
	end
	return false
end

local PLAYER_WAS_IN_WATER

local VEHICLE_WAS_IN_WATER = {}

function renderEvent()
	if (isElementInWater(localPlayer)) then
		if (not PLAYER_WAS_IN_WATER) then
			PLAYER_WAS_IN_WATER = true
			triggerServerEvent('onElementGetInWater', localPlayer)
			triggerEvent('onClientElementGetInWater', localPlayer)
		end
	else
		PLAYER_WAS_IN_WATER = false
	end
	
	for i, v in ipairs(getElementsByType('vehicle')) do
		if (isElementInWater(v)) then
			if (not VEHICLE_WAS_IN_WATER[v]) then
				VEHICLE_WAS_IN_WATER[v] = true
				triggerServerEvent('onElementGetInWater', v)
				triggerEvent('onClientElementGetInWater', v)
			end
		else
			VEHICLE_WAS_IN_WATER[v] = nil
		end
	end
end

addCustomEvent {
	eventName = 'initRenderEvent',
	attachedTo = resourceRoot,
	allowRemoteTrigger = true,
	theFunction = function ()
		addEventHandler('onClientRender', root, renderEvent)
	end
}


--[[
function onClientElementGetInWater()
	-- FAÇA QUALQUER COISA QUANDO UM ELEMENTO ENTRAR NA ÁGUA (CLIENT-SIDE)
end
addCustomEvent { eventName='onClientElementGetInWater', attachedTo=root, theFunction=onClientElementGetInWater }
]]