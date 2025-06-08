local talk = TalkAction("!temple")

function talk.onSay(player, words, param)
    local templePosition = Position(32369, 32241, 7)
    local inFight = player:isPzLocked() or player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT)

    if inFight then
        player:sendTextMessage(MESSAGE_LOOK, "Voce nao pode usar !temple em batalha.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    player:getPosition():sendMagicEffect(CONST_ME_POFF)
    player:teleportTo(templePosition)
    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

talk:separator(" ")
talk:groupType("normal")
talk:register()
