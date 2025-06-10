local talk = TalkAction("!tp")

local cities = {
	{ name = "Ab'Dendriel", pos = Position(32732, 31634, 7) },
	{ name = "Carlin", pos = Position(32360, 31782, 7) },
	{ name = "Kazordoon", pos = Position(32649, 31925, 11) },
	{ name = "Thais", pos = Position(32369, 32241, 7) },
	{ name = "Venore", pos = Position(32957, 32076, 7) },
	{ name = "Ankhrahmun", pos = Position(33194, 32853, 8) },
	{ name = "Edron", pos = Position(33217, 31814, 8) },
	{ name = "Farmine", pos = Position(33023, 31521, 11) },
	{ name = "Darashia", pos = Position(33213, 32454, 1) },
	{ name = "Liberty Bay", pos = Position(32317, 32826, 7) },
	{ name = "Port Hope", pos = Position(32594, 32745, 7) },
	{ name = "Svargrond", pos = Position(32212, 31132, 7) },
	{ name = "Yalahar", pos = Position(32787, 31276, 7) },
	{ name = "Gray Beach", pos = Position(33447, 31323, 9) },
	{ name = "Krailos", pos = Position(33657, 31665, 8) },
	{ name = "Rathleton", pos = Position(33594, 31899, 6) },
	{ name = "Roshamuul", pos = Position(33513, 32363, 6) },
	{ name = "Issavi", pos = Position(33921, 31477, 5) },
	{ name = "Bounac", pos = Position(32424, 32445, 7) },
	{ name = "Feyrist", pos = Position(33490, 32221, 7) },
	{ name = "Gnomprona", pos = Position(33517, 32856, 14) },
	{ name = "Marapur", pos = Position(33842, 32853, 7) },
	{ name = "Candia", pos = Position(33338, 32125, 7) },
	{ name = "Silvertides", pos = Position(33776, 32842, 7) },
	{ name = "Moonfall", pos = Position(33797, 32755, 5) }
}

local cooldowns = {}
local COOLDOWN_TIME = 5

local function canOpenModal(player)
  local playerId = player:getId()
  local now = os.time()
  if cooldowns[playerId] and (now - cooldowns[playerId] < COOLDOWN_TIME) then
    return false, COOLDOWN_TIME - (now - cooldowns[playerId])
  end
  cooldowns[playerId] = now
  return true
end

local function showModal(player)
	local window = ModalWindow({
		title = "Cidades",
		message = "Escolha uma cidade para se teletransportar"
	})

	for _, city in pairs(cities) do
		local name = city.name
		local pos = city.pos

		window:addChoice(name, function(player, button, choice)
			if button.name == "Cancel" then return true end

			local inPz = player:getTile():hasFlag(TILESTATE_PROTECTIONZONE)
			local inFight = player:isPzLocked() or player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT)

			if inPz or not inFight then
				player:getPosition():sendMagicEffect(CONST_ME_POFF)
				player:teleportTo(pos)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			else
    		player:getPosition():sendMagicEffect(CONST_ME_POFF)
				player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, "Voce nao pode ir enquanto estiver em batalha.")
			end
		end)
	end

	window:addButton("Select")
	window:addButton("Cancel")
	window:setDefaultEnterButton(0)
	window:setDefaultEscapeButton(1)
	window:sendToPlayer(player)
end

function talk.onSay(player, words, param)
	local canOpen, waitTime = canOpenModal(player)

  if not canOpen then
    player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, "Espere " .. math.ceil(waitTime) .. " segundos antes de abrir novamente.")
    return true
  end

	showModal(player)

	return true
end

talk:separator(" ")
talk:groupType("normal")
talk:register()
