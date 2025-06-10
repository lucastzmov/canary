local talk = TalkAction("!mounts")

local mounts = {
  { id = 1, name = "Widow Queen" },
  { id = 2, name = "Racing Bird" },
  { id = 3, name = "War Bear" },
  { id = 4, name = "Black Sheep" },
  { id = 5, name = "Midnight Panther" },
  { id = 6, name = "Draptor" },
  { id = 7, name = "Titanica" },
  { id = 8, name = "Tin Lizzard" },
  { id = 9, name = "Blazebringer" },
  { id = 10, name = "Rapid Boar" },
  { id = 11, name = "Stampor" },
  { id = 12, name = "Undead Cavebear" },
  { id = 13, name = "Donkey" },
  { id = 14, name = "Tiger Slug" },
  { id = 15, name = "Uniwheel" },
  { id = 16, name = "Crystal Wolf" },
  { id = 17, name = "War Horse" },
  { id = 18, name = "Kingly Deer" },
  { id = 19, name = "Tamed Panda" },
  { id = 20, name = "Dromedary" },
  { id = 21, name = "Scorpion King" },
  { id = 22, name = "Rented Horse" },
  { id = 25, name = "Rented Horse (Gray)" },
  { id = 26, name = "Rented Horse (Brown)" },
  { id = 27, name = "Lady Bug" },
  { id = 28, name = "Manta Ray" },
  { id = 29, name = "Ironblight" },
  { id = 30, name = "Magma Crawler" },
  { id = 31, name = "Dragonling" },
  { id = 32, name = "Gnarlhound" },
  { id = 35, name = "Water Buffalo" },
  { id = 38, name = "Ursagrodon" },
  { id = 39, name = "The Hellgrip" },
  { id = 40, name = "Noble Lion" },
  { id = 42, name = "Shock Head" },
  { id = 43, name = "Walker" },
  { id = 71, name = "Glooth Glider" },
  { id = 87, name = "Rift Runner" },
  { id = 94, name = "Sparkion" },
  { id = 98, name = "Neon Sparkid" },
  { id = 99, name = "Vortexion" },
  { id = 106, name = "Stone Rhino" },
  { id = 119, name = "Mole" },
  { id = 126, name = "Fleeting Knowledge" },
  { id = 130, name = "Lacewing Moth" },
  { id = 131, name = "Hibernal Moth" },
  { id = 132, name = "Cold Percht Sleigh" },
  { id = 133, name = "Bright Percht Sleigh" },
  { id = 134, name = "Dark Percht Sleigh" },
  { id = 144, name = "Gryphon" },
  { id = 147, name = "Cold Percht Sleigh Variant" },
  { id = 148, name = "Bright Percht Sleigh Variant" },
  { id = 149, name = "Dark Percht Sleigh Variant" },
  { id = 150, name = "Cold Percht Sleigh Final" },
  { id = 151, name = "Bright Percht Sleigh Final" },
  { id = 152, name = "Dark Percht Sleigh Final" },
  { id = 156, name = "Blue Rolling Barrel" },
  { id = 157, name = "Red Rolling Barrel" },
  { id = 158, name = "Green Rolling Barrel" },
  { id = 162, name = "Haze" },
  { id = 163, name = "Antelope" },
  { id = 167, name = "Phantasmal Jade" },
  { id = 174, name = "White Lion" },
  { id = 175, name = "Krakoloss" },
  { id = 183, name = "Shellodon" },
  { id = 184, name = "Singeing Steed" },
  { id = 201, name = "Giant Beaver" },
  { id = 202, name = "Noxious Ripptor" },
  { id = 206, name = "Mutated Abomination" },
  { id = 222, name = "Mystic Jaguar" },
  { id = 227, name = "Pegasus" }
}

local cooldowns = {}
local COOLDOWN_TIME = 5
local PRICE = 500000

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
		title = "Montarias",
		message = "Escolha uma montaria para comprar por " .. PRICE .. " gold coins:"
	})

	for _, mount in pairs(mounts) do
		local name = mount.name
		local id = mount.id


		window:addChoice(name, function(player, button, choice)
			if button.name == "Cancel" then return true end

			if player:hasMount(id) then
				player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, "Voce ja possui essa montaria.")
				return true
			end

			if not player:removeMoney(PRICE) then
				player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, "Voce precisa de " .. PRICE .. " gold coins.")
				return true
			end

			player:addMount(id)
			player:sendTextMessage(MESSAGE_LOOK, "Voce comprou a montaria: " .. name .. "!")
			player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
			return true
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
