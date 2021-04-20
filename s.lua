addCustomEvent {
    eventName = 'onClientRequestServerToInit',
    attachedTo = root,
    allowRemoteTrigger = true,
    theFunction = function ()
        triggerClientEvent(client, 'initRenderEvent', source)
    end
}

--[[
function onClientElementGetInWater()
    -- FAÇA QUALQUER COISA QUANDO UM JOGADOR ENTRAR NA ÁGUA
end
addCustomEvent { eventName='onClientElementGetInWater', attachedTo=root, theFunction=onClientElementGetInWater, allowRemoteTrigger = true }
]]