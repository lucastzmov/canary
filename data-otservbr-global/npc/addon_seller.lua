local internalNpcName = "Addon Seller"
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
		text = 'Come see my addons itens!'
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
	{ itemName = "ankh", clientId = "3077", price = 200000 },
	{ itemName = "ape fur", clientId = "5883", price = 200000 },
	{ itemName = "banana staff", clientId = "3348", price = 200000 },
	{ itemName = "bat wing", clientId = "5894", price = 200000 },
	{ itemName = "batwing hat", clientId = "9103", price = 200000 },
	{ itemName = "basalt fetish", clientId = "17856", price = 200000 },
	{ itemName = "black shield", clientId = "3429", price = 200000 },
	{ itemName = "bear paw", clientId = "5896", price = 200000 },
	{ itemName = "behemoth claw", clientId = "5930", price = 200000 },
	{ itemName = "blue piece of cloth", clientId = "5912", price = 200000 },
	{ itemName = "bonelord eye", clientId = "5898", price = 200000 },
	{ itemName = "brown piece of cloth", clientId = "5913", price = 200000 },
	{ itemName = "blue crystal shard", clientId = "16119", price = 200000 },
	{ itemName = "bronze prison key", clientId = "20272", price = 200000 },
	{ itemName = "book of lies", clientId = "22755", price = 200000 },
	{ itemName = "brutus bloodbeard's hat", clientId = "6099", price = 200000 },
	{ itemName = "chicken feather", clientId = "5890", price = 200000 },
	{ itemName = "crown legs", clientId = "3382", price = 200000 },
	{ itemName = "copper prison key", clientId = "20271", price = 200000 },
	{ itemName = "capricious robe", clientId = "34145", price = 200000 },
	{ itemName = "crusader helmet", clientId = "3391", price = 200000 },
	{ itemName = "crown", clientId = "3011", price = 200000 },
	{ itemName = "deadeye devious' eye patch", clientId = "6102", price = 200000 },
	{ itemName = "damaged steel helmet", clientId = "5924", price = 200000 },
	{ itemName = "demon dust", clientId = "5526", price = 200000 },
	{ itemName = "demonic essence", clientId = "6499", price = 200000 },
	{ itemName = "dragon claw", clientId = "5919", price = 200000 },
	{ itemName = "dream warden claw", clientId = "20275", price = 200000 },
	{ itemName = "dream warden mask", clientId = "20276", price = 200000 },
	{ itemName = "dubious piece of cloth", clientId = "12552", price = 200000 },
	{ itemName = "elemental spikes", clientId = "12803", price = 200000 },
	{ itemName = "enchanted chicken wing", clientId = "5891", price = 200000 },
	{ itemName = "eye patch", clientId = "6098", price = 200000 },
	{ itemName = "ferumbras' hat", clientId = "5903", price = 200000 },
	{ itemName = "dream matter", clientId = "20063", price = 200000 },
	{ itemName = "final judgement", clientId = "31738", price = 200000 },
	{ itemName = "fish fin", clientId = "5895", price = 200000 },
	{ itemName = "flask of warrior's sweat", clientId = "5885", price = 200000 },
	{ itemName = "green piece of cloth", clientId = "5910", price = 200000 },
	{ itemName = "hardened bone", clientId = "5925", price = 200000 },
	{ itemName = "holy orchid", clientId = "5922", price = 200000 },
	{ itemName = "honeycomb", clientId = "5902", price = 200000 },
	{ itemName = "hook", clientId = "6097", price = 200000 },
	{ itemName = "huge chunk of crude iron", clientId = "5892", price = 200000 },
	{ itemName = "iron ore", clientId = "5880", price = 200000 },
	{ itemName = "legion helmet", clientId = "3374", price = 200000 },
	{ itemName = "lizard leather", clientId = "5876", price = 200000 },
	{ itemName = "lizard scale", clientId = "5881", price = 200000 },
	{ itemName = "ludicrous piece of cloth", clientId = "12555", price = 200000 },
	{ itemName = "luminous piece of cloth", clientId = "12556", price = 200000 },
	{ itemName = "mage's cap", clientId = "12599", price = 200000 },
	{ itemName = "magic sulphur", clientId = "5904", price = 200000 },
	{ itemName = "mandrake", clientId = "5014", price = 200000 },
	{ itemName = "minotaur leather", clientId = "5878", price = 200000 },
	{ itemName = "nose ring", clientId = "5804", price = 200000 },
	{ itemName = "obvious piece of cloth", clientId = "12554", price = 200000 },
	{ itemName = "ominous piece of cloth", clientId = "12551", price = 200000 },
	{ itemName = "peg leg", clientId = "6126", price = 200000 },
	{ itemName = "perfect behemoth fang", clientId = "5893", price = 200000 },
	{ itemName = "piece of draconian steel", clientId = "5889", price = 200000 },
	{ itemName = "piece of hell steel", clientId = "5888", price = 200000 },
	{ itemName = "piece of royal steel", clientId = "5887", price = 200000 },
	{ itemName = "plague bell", clientId = "12787", price = 200000 },
	{ itemName = "plague mask", clientId = "12786", price = 200000 },
	{ itemName = "red dragon leather", clientId = "5948", price = 200000 },
	{ itemName = "red dragon scale", clientId = "5882", price = 200000 },
	{ itemName = "red piece of cloth", clientId = "5911", price = 200000 },
	{ itemName = "ron the ripper's sabre", clientId = "6101", price = 200000 },
	{ itemName = "shadow cowl", clientId = "31737", price = 200000 },
	{ itemName = "shard", clientId = "7290", price = 200000 },
	{ itemName = "slime mould", clientId = "12601", price = 200000 },
	{ itemName = "sniper gloves", clientId = "5875", price = 200000 },
	{ itemName = "silver token", clientId = "22516", price = 200000 },
	{ itemName = "green crystal shard", clientId = "16121", price = 200000 },
	{ itemName = "soul stone", clientId = "5809", price = 200000 },
	{ itemName = "spider silk", clientId = "5879", price = 200000 },
	{ itemName = "spirit container", clientId = "5884", price = 200000 },
	{ itemName = "spool of yarn", clientId = "5886", price = 200000 },
	{ itemName = "ring of the sky", clientId = "3006", price = 200000 },
	{ itemName = "shroud of despair", clientId = "22757", price = 200000 },
	{ itemName = "death gaze", clientId = "22758", price = 200000 },
	{ itemName = "impaler of the igniter", clientId = "22760", price = 200000 },
	{ itemName = "tribal mask", clientId = "3403", price = 200000 },
	{ itemName = "treader of torment", clientId = "22756", price = 200000 },
	{ itemName = "turtle shell", clientId = "5899", price = 200000 },
	{ itemName = "vampire dust", clientId = "5905", price = 200000 },
	{ itemName = "voluminous piece of cloth", clientId = "12553", price = 200000 },
	{ itemName = "visage of the end days", clientId = "22754", price = 200000 },
	{ itemName = "voodoo doll", clientId = "3002", price = 200000 },
	{ itemName = "white piece of cloth", clientId = "5909", price = 200000 },
	{ itemName = "wolf paw", clientId = "5897", price = 200000 },
	{ itemName = "yellow piece of cloth", clientId = "5914", price = 200000 },
	{ itemName = "golden lotus brooch", clientId = "21974", price = 200000 },
	{ itemName = "peacock feather fan", clientId = "21975", price = 200000 },
	{ itemName = "mysterious voodoo skull", clientId = "5668", price = 200000 },
	{ itemName = "sun fruit", clientId = "29995", price = 200000 },
	{ itemName = "miraculum", clientId = "11474", price = 200000 },
	{ itemName = "gold token", clientId = "22721", price = 200000 },
	{ itemName = "pure energy", clientId = "948", price = 200000 },
	{ itemName = "titanium token", clientId = "22724", price = 200000 },
	{ itemName = "falcon crest", clientId = "28823", price = 200000 },
	{ itemName = "lion trophy", clientId = "2684", price = 200000 },
	{ itemName = "hunter's quiver", clientId = "11469", price = 200000 },
	{ itemName = "soul orb", clientId = "5944", price = 200000 },
	{ itemName = "medusa shield", clientId = "3436", price = 200000 },
	{ itemName = "dragon scale mail", clientId = "3386", price = 200000 },
	{ itemName = "torch", clientId = "2920", price = 200000 },
	{ itemName = "violet crystal shard", clientId = "16120", price = 200000 },
	{ itemName = "essence of a bad dream", clientId = "10306", price = 200000 },
	{ itemName = "golden prison key", clientId = "20273", price = 200000 },
	{ itemName = "silver prison key", clientId = "20270", price = 200000 },
	{ itemName = "ring of ending", clientId = "20182", price = 200000 },
	{ itemName = "distorted robe", clientId = "34149", price = 200000 },
	{ itemName = "vibrant robe", clientId = "34144", price = 200000 },
	{ itemName = "infernal robe", clientId = "34146", price = 200000 },
	{ itemName = "ice flower", clientId = "29974", price = 200000 },
	{ itemName = "gruesome fan", clientId = "34024", price = 200000 },
	{ itemName = "small enchanted amethyst", clientId = "678", price = 200000 },
	{ itemName = "small enchanted emerald", clientId = "677", price = 200000 },
	{ itemName = "small enchanted ruby", clientId = "676", price = 200000 },
	{ itemName = "small enchanted sapphire", clientId = "675", price = 200000 },
	{ itemName = "spellbook of enlightenment", clientId = "8072", price = 200000 },
	{ itemName = "shadow herb", clientId = "3740", price = 200000 },
	{ itemName = "star herb", clientId = "3736", price = 200000 },
	{ itemName = "glob of mercury", clientId = "9053", price = 200000 },
	{ itemName = "glob of acid slime", clientId = "9054", price = 200000 },
	{ itemName = "glob of tar", clientId = "9055", price = 200000 },
	{ itemName = "nail", clientId = "953", price = 200000 },
	{ itemName = "royal medal", clientId = "9222", price = 200000},
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
