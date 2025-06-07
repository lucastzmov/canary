local talk = TalkAction("!dp")

function talk.onSay(player, words, param)
    local depotPosition = Position(32346, 32224, 7)

    -- Verifica se o jogador está com status que impede teleport (opcional)
    if player:getCondition(CONDITION_INFIGHT) then
        player:sendCancelMessage("Você não pode usar !dp enquanto estiver em batalha.")
        return false
    end

    player:teleportTo(depotPosition)
    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return false
end

talk:separator(" ")
talk:groupType("normal")
talk:register()
