local cities = {
  Carlin = Position(32334, 31782, 7),
  Venore = Position(32922, 32076, 7),
  AbDendriel = Position(32682, 31688, 7),
  Kazordoon = Position(32660, 31957, 11),
  Edron = Position(33168, 31805, 8),
  Darashia = Position(33215, 32459, 8),
  Ankrahmun = Position(33126, 32845, 7),
  Yalahar = Position(32794, 31248, 7),
  Farmine = Position(33026, 31456, 11),
  PortHope = Position(32631, 32747, 7),
  Issavi = Position(33917, 31480, 7),
  Feyrist = Position(33491, 32223, 6),
  Maradera = Position(33811, 32800, 7),
  Candia = Position(33379, 32182, 7),
  SilverBeach = Position(33777, 32841, 7),
  MoonBase = Position(33797, 32753, 4),
  Cobra = Position(33385, 32627, 7),
  Rosha = Position(33552, 32386, 6),
  Rathe = Position(33637, 31896, 7),
  Krailos = Position(33655, 31661, 8),
  GrayBeach = Position(33444, 31317, 8),
  Svargrond = Position(32269, 31141, 7),
  LibertyBay = Position(32331, 32835, 7)
}

local function showUberModal(player)
  local messageDefalt = "Escolha uma opcao:\n\nUse as setas para navegar e clique em OK para confirmar.\n\n"

  local modal = ModalWindow({
      title = "Uber menu",
      message = messageDefalt
  })

  -- Opção: Cidades
  modal:addChoice("Cidades", function(player, button, choice)
      if button.name ~= "OK" then return true end

      local cityModal = ModalWindow({
          title = "Escolha a cidade",
          message = messageDefalt
      })

      -- adiciona Thais primeiro
      cityModal:addChoice("Thais", function(player, button, choice)
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        player:teleportTo(Position(32345, 32224, 7), false)
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
      end)

      -- adiciona o resto das cidades (exceto Thais)
      for cityName, pos in pairs(cities) do
          if cityName ~= "Thais" then
              cityModal:addChoice(cityName, function(player, button, choice)
                player:getPosition():sendMagicEffect(CONST_ME_POFF)
                player:teleportTo(pos)
                player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
              end)
          end
      end

      cityModal:addButton("OK")
      cityModal:addButton("Fechar")
      cityModal:setDefaultEnterButton(1)
      cityModal:setDefaultEscapeButton(2)
      cityModal:sendToPlayer(player)
  end)

  -- Opção: NPC
  modal:addChoice("NPC", function(player, button, choice)
      if button.name ~= "OK" then return true end
      player:sendTextMessage(MESSAGE_LOOK, "Voce falou com o NPC Uber!")
  end)

  modal:addButton("OK")
  modal:addButton("Fechar")
  modal:setDefaultEnterButton(1)
  modal:setDefaultEscapeButton(2)
  modal:sendToPlayer(player)
end

local talk = TalkAction("!uber")
function talk.onSay(player, words, param)
  local inPz = player:getTile():hasFlag(TILESTATE_PROTECTIONZONE)
	local inFight = player:isPzLocked() or player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT)

  if not inPz and inFight then
    player:sendTextMessage(MESSAGE_FAILURE, "Você não pode usar o Uber enquanto estiver em batalha. Aguarde.")
    return true
  end

  showUberModal(player)
  return true
end

talk:separator(" ")
talk:groupType("normal")
talk:register()
