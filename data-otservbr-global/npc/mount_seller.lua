local internalNpcName = "Mount Seller"
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
		text = 'Come see my mount itens!'
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

npcConfig.shop = {
	{ itemName = "astral shaper rune", clientId = "24960", price = 20000 },
  { itemName = "bag of apple slices", clientId = "12548", price = 20000 },
  { itemName = "bamboo leaves", clientId = "12549", price = 20000 },
  { itemName = "beer tap", clientId = "32114", price = 20000 },
  { itemName = "candle stump", clientId = "27605", price = 20000 },
  { itemName = "carrot on a stick", clientId = "12311", price = 20000 },
  { itemName = "colourful water lily", clientId = "39548", price = 20000 },
  { itemName = "control unit", clientId = "21186", price = 20000 },
  { itemName = "crackling egg", clientId = "23684", price = 20000 },
  { itemName = "decorative blue sheet", clientId = "32103", price = 20000 },
  { itemName = "decorative green sheet", clientId = "32105", price = 20000 },
  { itemName = "decorative red sheet", clientId = "32104", price = 20000 },
  { itemName = "decorative ribbon", clientId = "16155", price = 20000 },
  { itemName = "diapason", clientId = "12547", price = 20000 },
  { itemName = "eldritch crystal", clientId = "36835", price = 20000 },
  { itemName = "fiery horseshoe", clientId = "36938", price = 20000 },
  { itemName = "fist on a stick", clientId = "12546", price = 20000 },
  { itemName = "four-leaf clover", clientId = "14143", price = 20000 },
  { itemName = "foxtail", clientId = "14142", price = 20000 },
  { itemName = "giant shrimp", clientId = "12318", price = 20000 },
  { itemName = "glow wine", clientId = "16154", price = 20000 },
  { itemName = "golden can of oil", clientId = "12801", price = 20000 },
  { itemName = "golden fir cone", clientId = "12550", price = 20000 },
  { itemName = "golem wrench", clientId = "16251", price = 20000 },
  { itemName = "harness", clientId = "12307", price = 20000 },
  { itemName = "hunting horn", clientId = "12260", price = 20000 },
  { itemName = "inert astral shaper rune", clientId = "25059", price = 20000 },
  { itemName = "iron loadstone", clientId = "16153", price = 20000 },
  { itemName = "leather whip", clientId = "12306", price = 20000 },
  { itemName = "leech", clientId = "17858", price = 20000 },
  { itemName = "library ticket", clientId = "28791", price = 20000 },
  { itemName = "maxilla maximus", clientId = "12304", price = 20000 },
  { itemName = "melting horn", clientId = "20355", price = 20000 },
  { itemName = "menacing egg", clientId = "23685", price = 20000 },
  { itemName = "music box", clientId = "12046", price = 20000 },
  { itemName = "mysterious scroll", clientId = "22865", price = 20000 },
  { itemName = "nail case", clientId = "19136", price = 20000 },
  { itemName = "nightmare horn", clientId = "20274", price = 20000 },
  { itemName = "pegasus feather", clientId = "48424", price = 20000 },
  { itemName = "percht skull", clientId = "30192", price = 20000 },
  { itemName = "purple tendril lantern", clientId = "30171", price = 20000 },
  { itemName = "red silk flower", clientId = "34258", price = 20000 },
  { itemName = "reins", clientId = "12308", price = 20000 },
  { itemName = "scorpion sceptre", clientId = "12509", price = 20000 },
  { itemName = "slingshot", clientId = "5907", price = 20000 },
  { itemName = "slug drug", clientId = "12519", price = 20000 },
  { itemName = "spectral horse tack", clientId = "34074", price = 20000 },
  { itemName = "spectral horseshoe", clientId = "34072", price = 20000 },
  { itemName = "spectral saddle", clientId = "34073", price = 20000 },
  { itemName = "spectral scrap of cloth", clientId = "32629", price = 20000 },
  { itemName = "sugar oat", clientId = "12802", price = 20000 },
  { itemName = "sweet smelling bait", clientId = "12320", price = 20000 },
  { itemName = "tin key", clientId = "12305", price = 20000 },
  { itemName = "turquoise tendril lantern", clientId = "30170", price = 20000 },
  { itemName = "vibrant egg", clientId = "23538", price = 20000 },
  { itemName = "wind-up key", clientId = "37397", price = 20000 },
  { itemName = "wind-up loco", clientId = "37398", price = 20000 },
}

-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_TRADE, string.format("Sold %ix %s for %i gold.",  amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType) end

npcType:register(npcConfig)
