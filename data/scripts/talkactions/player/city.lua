local talk = TalkAction("!city")

local cities = {
  thais = Position(32345, 32224, 7),
  carlin = Position(32334, 31782, 7),
  venore = Position(32922, 32076, 7),
  ab = Position(32682, 31688, 7),
  kaz = Position(32660, 31957, 11),
  edron = Position(33168, 31805, 8),
  dara = Position(33215, 32459, 8),
  ank = Position(33126, 32845, 7),
  yala = Position(32794, 31248, 7),
  farm = Position(33026, 31456, 11),
  port = Position(32631, 32747, 7),
  isa = Position(33917, 31480, 7),
  fey = Position(33491, 32223, 6),
  mara = Position(33811, 32800, 7),
  candia = Position(33379, 32182, 7),
  silver = Position(33777, 32841, 7),
  moon = Position(33797, 32753, 4),
  bou = Position(32390, 32489, 7),
  cobra = Position(33385, 32627, 7),
  rosha = Position(33552, 32386, 6),
  rathe = Position(33637, 31896, 7),
  krai = Position(33655, 31661, 8),
  gray = Position(33444, 31317, 8),
  svar = Position(32269, 31141, 7),
  liber = Position(32331, 32835, 7)
}

function talk.onSay(player, words, param)
  local inFight = player:isPzLocked() or player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT)

  if inFight then
    player:sendTextMessage(MESSAGE_LOOK, "Voce nao pode usar !city em batalha.")
    player:getPosition():sendMagicEffect(CONST_ME_POFF)
    return true
  end

  if param == "" then
    local msg = "Cidades disponiveis: \n\n"
    for name, _ in pairs(cities) do
      msg = msg .. "- " .. name .. "\n"
    end

    player:showTextDialog(639, msg)
    return true
  end

  local destination = cities[string.lower(param)]

  if not destination then
    player:sendTextMessage(MESSAGE_LOOK, "Cidade '" .. param .. "' nao encontrada. Use !city para ver as opcoes.")
    return true
  end

  player:getPosition():sendMagicEffect(CONST_ME_POFF)
  player:teleportTo(destination)
  player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
  return true
end

talk:separator(" ")
talk:groupType("normal")
talk:register()
