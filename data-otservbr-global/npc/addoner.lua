local internalNpcName = "Addoner"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 1

npcConfig.outfit = {
	lookType = 128,
	lookHead = 55,
	lookBody = 30,
	lookLegs = 24,
	lookFeet = 115,
	lookAddons = 0,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{
		text = 'Come see my addons!'
	}
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

addoninfo = {
	['first citizen addon'] = {cost = 15000, outfit_female = 136, outfit_male = 128, addon = 1, storageID = Storage.Quest.U7_8.AddonBackpack},
	['second citizen addon'] = {cost = 15000, outfit_female = 136, outfit_male = 128, addon = 2, storageID = Storage.Quest.U7_8.AddonHat},

	['first hunter addon'] = {cost = 15000, outfit_female = 137, outfit_male = 129, addon = 1, storageID = Storage.Quest.U7_8.AddonHat},
	['second hunter addon'] = {cost = 15000, outfit_female = 137, outfit_male = 129, addon = 2, storageID = Storage.Quest.U7_8.AddonGlove},

	['first knight addon'] = {cost = 15000, outfit_female = 139, outfit_male = 131, addon = 1, storageID = Storage.Quest.U7_8.AddonSword},
	['second knight addon'] = {cost = 15000, outfit_female = 139, outfit_male = 131, addon = 2, storageID = Storage.Quest.U7_8.AddonHelmet},

	['first mage addon'] = {cost = 15000, outfit_female = 138, outfit_male = 130, addon = 1, storageID = Storage.Quest.U7_8.AddonWand},
	['second mage addon'] = {cost = 15000, items = {{5903,1}}, outfit_female = 138, outfit_male = 130, addon = 2, storageID = Storage.Quest.U7_8.AddonHatCloak},

	['first summoner addon'] = {cost = 15000, outfit_female = 141, outfit_male = 133, addon = 1, storageID = Storage.Quest.U7_8.AddonBelt},
	['second summoner addon'] = {cost = 15000, outfit_female = 141, outfit_male = 133, addon = 2, storageID = Storage.Quest.U7_8.AddonWandTimer},

	['first barbarian addon'] = {cost = 15000, outfit_female = 147, outfit_male = 143, addon = 1, storageID = 51032},
	['second barbarian addon'] = {cost = 15000, outfit_female = 147, outfit_male = 143, addon = 2, storageID = 51033},

	['first druid addon'] = {cost = 15000, outfit_female = 148, outfit_male = 144, addon = 1, storageID = Storage.Quest.U7_8.DruidHatAddon},
	['second druid addon'] = {cost = 15000, outfit_female = 148, outfit_male = 144, addon = 2, storageID = Storage.Quest.U7_8.DruidBodyAddon},

	['first nobleman addon'] = {cost = 150000, outfit_female = 140, outfit_male = 132, addon = 1, storageID = Storage.Quest.U7_8.NoblemanFirstAddon},
	['second nobleman addon'] = {cost = 150000, outfit_female = 140, outfit_male = 132, addon = 2, storageID = Storage.Quest.U7_8.NoblemanSecondAddon},

	['first oriental addon'] = {cost = 15000, outfit_female = 150, outfit_male = 146, addon = 1, storageID = Storage.Quest.U7_8.FirstOrientalAddon},
	['second oriental addon'] = {cost = 15000, outfit_female = 150, outfit_male = 146, addon = 2, storageID = Storage.Quest.U7_8.SecondOrientalAddon},

	['first warrior addon'] = {cost = 15000, outfit_female = 142, outfit_male = 134, addon = 1, storageID = Storage.Quest.U7_8.WarriorShoulderAddon},
	['second warrior addon'] = {cost = 15000, outfit_female = 142, outfit_male = 134, addon = 2, storageID = Storage.Quest.U7_8.WarriorSwordAddon},

	['first wizard addon'] = {cost = 15000, outfit_female = 149, outfit_male = 145, addon = 1, storageID = 51034},
	['second wizard addon'] = {cost = 15000, outfit_female = 149, outfit_male = 145, addon = 2, storageID = 51035},

	['first assassin addon'] = {cost = 15000, outfit_female = 156, outfit_male = 152, addon = 1, storageID = Storage.Quest.U7_8.AssassinFirstAddon},
	['second assassin addon'] = {cost = 15000, outfit_female = 156, outfit_male = 152, addon = 2, storageID = Storage.Quest.U7_8.AssassinSecondAddon},

	['first beggar addon'] = {cost = 15000, outfit_female = 157, outfit_male = 153, addon = 1, storageID = Storage.Quest.U7_8.BeggarFirstAddonDoor},
	['second beggar addon'] = {cost = 15000, outfit_female = 157, outfit_male = 153, addon = 2, storageID = Storage.Quest.U7_8.BeggarSecondAddon},

	['first pirate addon'] = {cost = 15000, outfit_female = 155, outfit_male = 151, addon = 1, storageID = Storage.Quest.U7_8.PirateSabreAddon},
	['second pirate addon'] = {cost = 15000, outfit_female = 155, outfit_male = 151, addon = 2, storageID = Storage.Quest.U7_8.PirateHatAddon},

	['first shaman addon'] = {cost = 15000, outfit_female = 158, outfit_male = 154, addon = 1, storageID = 51036},
	['second shaman addon'] = {cost = 15000, outfit_female = 158, outfit_male = 154, addon = 2, storageID = 51037},

	['first norseman addon'] = {cost = 15000, outfit_female = 252, outfit_male = 251, addon = 1, storageID = 51038},
	['second norseman addon'] = {cost = 15000, outfit_female = 252, outfit_male = 251, addon = 2, storageID = 51039}
}

-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end

-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_TRADE, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end

-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType) end

npcHandler:setMessage(MESSAGE_GREET, "Welcome |PLAYERNAME|! If you want some addons, just ask me! Example: {first citizen addon}.")

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcType:register(npcConfig)
