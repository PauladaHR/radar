local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPC = Tunnel.getInterface("vRP")

src = {}
Tunnel.bindInterface(GetCurrentResourceName(), src)

function src.finesPayment()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local value = math.random(cfg.finesMinValue,cfg.finesMaxValue)
        if vRP.paymentFull(user_id,value) then    
            TriggerClientEvent("Notify",source,"amarelo","Atenção, você sofreu uma infração de velocidade no valor de <b>R$" ..value.. "</b> o valor ja foi debitado de sua conta.")
        else
            TriggerClientEvent("Notify",source,"amarelo","Você não tem dinheiro para pagar a multa, então a prefeitura a perdoou")
        end
    end
end