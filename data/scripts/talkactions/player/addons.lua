-- Mission
-- 0: Quando ele não iniciou a quest
-- 1: Quando ele aceita a quest
-- 2: Quando ele entrega os itens

-- Addon
-- 2: Addon full

local talk = TalkAction("!addons")

local addons = {
  {
    name = "Citizen",
    outfit_female = 136,
    outfit_male = 128,
    storages = {
      Storage.Quest.U7_8.CitizenOutfits.AddonBackpack,
      Storage.Quest.U7_8.CitizenOutfits.AddonHat,
    },
  },
  {
    name = "Hunter",
    outfit_female = 137,
    outfit_male = 129,
    storages = {
      Storage.Quest.U7_8.HunterOutfits.Hunter.AddonHat,
      Storage.Quest.U7_8.HunterOutfits.Hunter.AddonGlove,
    },
  },
  {
    name = "Knight",
    outfit_female = 139,
    outfit_male = 131,
    storages = {
      Storage.Quest.U7_8.KnightOutfits.AddonSword,
      Storage.Quest.U7_8.KnightOutfits.AddonHelmet,
    },
  },
  {
    name = "Mage",
    outfit_female = 138,
    outfit_male = 130,
    storages = {
      Storage.Quest.U7_8.MageAndSummonerOutfits.AddonWand,
      Storage.Quest.U7_8.MageAndSummonerOutfits.AddonHatCloak,
    },
  },
  {
    name = "Summoner",
    outfit_female = 141,
    outfit_male = 133,
    storages = {
      Storage.Quest.U7_8.MageAndSummonerOutfits.AddonBelt,
      Storage.Quest.U7_8.MageAndSummonerOutfits.AddonWandTimer,
    },
  },
  {
    name = "Barbarian",
    outfit_female = 147,
    outfit_male = 143,
    storages = {
      Storage.Quest.U7_8.BarbarianOutfits.BarbarianAddon,
    },
  },
  {
    name = "Druid",
    outfit_female = 148,
    outfit_male = 144,
    storages = {
      Storage.Quest.U7_8.DruidOutfits.DruidHatAddon,
      Storage.Quest.U7_8.DruidOutfits.DruidBodyAddon,
    },
  },
  {
    name = "Nobleman",
    outfit_female = 140,
    outfit_male = 132,
    storages = {
      Storage.Quest.U7_8.NoblemanOutfits.NoblemanFirstAddon,
      Storage.Quest.U7_8.NoblemanOutfits.NoblemanSecondAddon,
    },
  },
  {
    name = "Oriental",
    outfit_female = 150,
    outfit_male = 146,
    storages = {
      Storage.Quest.U7_8.OrientalOutfits.FirstOrientalAddon,
      Storage.Quest.U7_8.OrientalOutfits.SecondOrientalAddon,
    },
  },
  {
    name = "Warrior",
    outfit_female = 142,
    outfit_male = 134,
    storages = {
      Storage.Quest.U7_8.WarriorOutfits.WarriorShoulderAddon,
      Storage.Quest.U7_8.WarriorOutfits.WarriorSwordAddon,
    },
  },
  {
    name = "Wizard",
    outfit_female = 149,
    outfit_male = 145,
    storages = {
      Storage.Quest.U7_8.WizardOutfits,
    },
  },
  {
    name = "Assassin",
    outfit_female = 156,
    outfit_male = 152,
    storages = {
      Storage.Quest.U7_8.AssassinOutfits.AssassinFirstAddon,
      Storage.Quest.U7_8.AssassinOutfits.AssassinSecondAddon,
    },
  },
  {
    name = "Beggar",
    outfit_female = 157,
    outfit_male = 153,
    storages = {
      Storage.Quest.U7_8.BeggarOutfits.BeggarFirstAddonDoor,
      Storage.Quest.U7_8.BeggarOutfits.BeggarSecondAddon,
    },
  },
  {
    name = "Pirate",
    outfit_female = 155,
    outfit_male = 151,
    storages = {
      Storage.Quest.U7_8.PirateOutfits.PirateSabreAddon,
      Storage.Quest.U7_8.PirateOutfits.PirateHatAddon,
    },
  },
  {
    name = "Shaman",
    outfit_female = 158,
    outfit_male = 154,
    storages = {
      Storage.Quest.U7_8.ShamanOutfits.AddonStaffMask,
    },
  },
  {
    name = "Norseman",
    outfit_female = 252,
    outfit_male = 251,
    storages = {
      Storage.Quest.U8_0.TheIceIslands.NorsemanOutfit,
    },
  },
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
		title = "Addons",
		message = "Escolha um addon full para comprar por " .. PRICE .. " gold coins:"
	})

	for _, addon in pairs(addons) do
		local name = addon.name
		local outfit_female = addon.outfit_female
		local outfit_male = addon.outfit_male
		local storages = addon.storages

		window:addChoice(name, function(player, button, choice)
			if button.name == "Cancel" then return true end

			for _, storage in ipairs(storages) do
				if player:getStorageValue(storage) == 2 then
					player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, "Voce ja possui esse addon.")
					return true
				end
			end

			if not player:removeMoney(PRICE) then
				player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, "Voce precisa de " .. PRICE .. " gold coins.")
				return true
			end

			player:addOutfitAddon(outfit_female, 1)
			player:addOutfitAddon(outfit_male, 1)
			player:addOutfitAddon(outfit_female, 2)
			player:addOutfitAddon(outfit_male, 2)

			for _, storage in ipairs(storages) do
				player:setStorageValue(storage, 2)
			end

			player:sendTextMessage(MESSAGE_LOOK, "Voce comprou o addon: " .. name .. "!")
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
