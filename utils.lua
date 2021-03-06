local PRE_VALOR_ERROR = '\'addCustomEvent\' function. '
function addCustomEvent(dados)
    if (type(dados) ~= 'table') then
        error(PRE_VALOR_ERROR..'#1 argumento: Valor especificado não é uma tabela, obtido \''..type(dados)..'\'', 2)
    end
    
    if (not dados.eventName) then
        error(PRE_VALOR_ERROR..'#eventName: especifique o nome do evento.', 2)
    else
        if (type(dados.eventName) ~= 'string') then
            error(PRE_VALOR_ERROR..'#eventName: nome do evento deve ser uma \'string\', obtido \''..type(dados.eventName)..'\'', 2)
        end
    end
    
    if not (dados.allowRemoteTrigger == true or dados.allowRemoteTrigger == false) then
        if (dados.allowRemoteTrigger == nil) then
            dados.allowRemoteTrigger = false
        else
            error(PRE_VALOR_ERROR..'#allowRemoteTrigger deve ser \'true\' ou \'false\'', 2)
        end
    end
    
    if (not dados.attachedTo) then
        error(PRE_VALOR_ERROR..'Especifique o elemento em que o evento deve ser anexado.', 2)
    end
    if (not isElement(dados.attachedTo)) then
        error(PRE_VALOR_ERROR..'#attachedTo deve conter um elemento para anexar o evento, obtido \''..type(dados.attachedTo)..'\'', 2)
    end
    
    if (not dados.theFunction) then
        error(PRE_VALOR_ERROR..'#theFunction especifique a função que o evento vai executar ao ser acionado.', 2)
    end
    if (type(dados.theFunction) ~= 'function') then
        error(PRE_VALOR_ERROR..'#theFunction deve-se conter uma função para o evento executar quando acionado.', 2)
    end
    
    if not (dados.propagate == true or dados.propagate == false) then
        if (dados.propagate == nil) then
            dados.propagate = true
        else
            error(PRE_VALOR_ERROR..'#propagate deve ser \'true\' ou \'false\'')
        end
    end
    
    if (not dados.priority) then
        dados.priority = 'normal'
    else
        if (type(dados.priority) ~= 'string') then
            error(PRE_VALOR_ERROR..'#priority: o valor deve ser do tipo \'string\', obtido \''..type(dados.priority)..'\'', 2)
        end
        if not (dados.priority:find('^normal') or dados.priority:find('^high') or dados.priority:find('^low')) then
            error(PRE_VALOR_ERROR..'#priority: valores inválidos foram informados', 2)
        end
    end
    
    return addEvent(dados.eventName, dados.allowRemoteTrigger), addEventHandler(dados.eventName, dados.attachedTo, dados.theFunction, dados.propagate, dados.priority)
end