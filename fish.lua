local DISCORD_WEBHOOK = "https://discord.com/api/webhooks/1442916848839692318/UGywwGiLE60TrS42vPfF_5gHBQj4QwjLAv_HwaUg_RhF-qLXbhDU8ou2VOXV8z7brryL"
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- ===== FISH THUMBNAIL URLs (MYTHIC & SECRET ONLY) =====
local FISH_THUMBNAILS = {
    ["Super Enchant Stone"] = "https://tr.rbxcdn.com/180DAY-6214f7112b49a6b1cabf0b15bbb3c2f2/420/420/Image/Png/noFilter",
    ["Blob Shark"] = "https://tr.rbxcdn.com/180DAY-de341f23e8add220fefbe2db159fd9ec/420/420/Image/Png/noFilter",
    ["Great Christmas Whale"] = "https://tr.rbxcdn.com/180DAY-c53826109548afdbbef84999d9251ad2/420/420/Image/Png/noFilter",
    ["Gingerbread Shark"] = "https://tr.rbxcdn.com/180DAY-5361cac2ad5a55fbaa8f1809faee2625/420/420/Image/Png/noFilter",
    ["Cursed Soul"] = "https://tr.rbxcdn.com/180DAY-4d7824ae5e13bbfc19164dcd5161db2d/420/420/Image/Png/noFilter",
    ["Loving Shark"] = "https://tr.rbxcdn.com/180DAY-4d2f17cc22fa7a31f6414b72022163f8/420/420/Image/Png/noFilter",
    ["Ares Rod"] = "https://tr.rbxcdn.com/180DAY-fabaa51e63294e73b4dfd127f505419e/420/420/Image/Png/noFilter",
    ["Ghoul Rod"] = "https://tr.rbxcdn.com/180DAY-acfb059fd249a9eb5f9b7c1319905fd6/420/420/Image/Png/noFilter",
    ["Crystalized"] = "https://tr.rbxcdn.com/180DAY-7f6cb280edde6e2e5394ab290e701010/420/420/Image/Png/noFilter",
    ["Neptune's Trident"] = "https://tr.rbxcdn.com/180DAY-9ca9426d8a0704b14f1facb73c18c818/420/420/Image/Png/noFilter",
    ["Frostborn Shark"] = "https://tr.rbxcdn.com/180DAY-95e31005ee70d0dd081590e066e2d8a8/420/420/Image/Png/noFilter",
    ["Great Whale"] = "https://tr.rbxcdn.com/180DAY-427f3f35097642ce11568366678b16af/420/420/Image/Png/noFilter",
    ["Robot Kraken"] = "https://tr.rbxcdn.com/180DAY-489ffa039a70e41ad60d70997ada55ed/420/420/Image/Png/noFilter",
    ["King Crab"] = "https://tr.rbxcdn.com/180DAY-759396ad59e6d31e9d6bf6a025288e4b/420/420/Image/Png/noFilter",
    ["Giant Squid"] = "https://tr.rbxcdn.com/180DAY-ad8d392c5e6afe4cf421b5d1071b9a5e/420/420/Image/Png/noFilter",
    ["Blob Fish"] = "https://tr.rbxcdn.com/180DAY-aa1e7cbb92cdaf7ab8e145b0fbe06dbb/420/420/Image/Png/noFilter",
    ["Angler Rod"] = "https://tr.rbxcdn.com/180DAY-b6ca6ba8fc0accb896b30849e599874a/420/420/Image/Png/noFilter",
    ["Worm Fish"] = "https://tr.rbxcdn.com/180DAY-7299ff7cfe763fc20a4ad726678c8059/420/420/Image/Png/noFilter",
    ["Hermit Crab"] = "https://tr.rbxcdn.com/180DAY-bc9045fa1cab0cf9bb5ba7c3d02d2c91/420/420/Image/Png/noFilter",
    ["Queen Crab"] = "https://tr.rbxcdn.com/180DAY-75f017dc45d893c85ae39873590042b1/420/420/Image/Png/noFilter",
    ["Jelly"] = "https://tr.rbxcdn.com/180DAY-8ccffafeb58cd7aa957ad9216c162d12/420/420/Image/Png/noFilter",
    ["Ghostfinn Rod"] = "https://tr.rbxcdn.com/180DAY-e47da8ac97ecd18b011860577fd8e50d/420/420/Image/Png/noFilter",
    ["Cursed"] = "https://tr.rbxcdn.com/180DAY-61e6990fdbe8551f99fd9dbb3bebf7b8/420/420/Image/Png/noFilter",
    ["Orca"] = "https://tr.rbxcdn.com/180DAY-e3d4495262428ed404619d8e6f16d6ec/420/420/Image/Png/noFilter",
    ["Crystal Crab"] = "https://tr.rbxcdn.com/180DAY-644fdd8d9b29c3c4da83e170b9b3eab0/420/420/Image/Png/noFilter",
    ["Galactic"] = "https://tr.rbxcdn.com/180DAY-4de6bc89c37357884a59ac8a16ccc610/420/420/Image/Png/noFilter",
    ["Enlightened"] = "https://tr.rbxcdn.com/180DAY-636338d901c04e2e87fe380c6f824442/420/420/Image/Png/noFilter",
    ["Fiery"] = "https://tr.rbxcdn.com/180DAY-740dc9607105470d85d515f4ca2de486/420/420/Image/Png/noFilter",
    ["Monster Shark"] = "https://tr.rbxcdn.com/180DAY-64489f77e3319c5639d380d34ad871a5/420/420/Image/Png/noFilter",
    ["Luminous Fish"] = "https://tr.rbxcdn.com/180DAY-0355ceedc86250e6096900a663abe398/420/420/Image/Png/noFilter",
    ["Eerie Shark"] = "https://tr.rbxcdn.com/180DAY-b24c218862625f0b1c7a8c84b161cd6d/420/420/Image/Png/noFilter",
    ["Scare"] = "https://tr.rbxcdn.com/180DAY-681f78926850a4c4fa9c784bd61ea392/420/420/Image/Png/noFilter",
    ["Armor Catfish"] = "https://tr.rbxcdn.com/180DAY-3f26b72daadb14c7f51172f81707b25a/420/420/Image/Png/noFilter",
    ["Thin Armor Shark"] = "https://tr.rbxcdn.com/180DAY-11649b435ccc75c49b95e85f5e3d6011/420/420/Image/Png/noFilter",
    ["Timeless"] = "https://tr.rbxcdn.com/180DAY-f86ca9224a81102d1a76ca9114d0417d/420/420/Image/Png/noFilter",
    ["Lochness Monster"] = "https://tr.rbxcdn.com/180DAY-e5870f13dcd954fb9735530fdefeb176/420/420/Image/Png/noFilter",
    ["Continuum"] = "https://tr.rbxcdn.com/180DAY-84b9c020bd1fa9dc3c7fb810a6e1d853/420/420/Image/Png/noFilter",
    ["Megalodon"] = "https://tr.rbxcdn.com/180DAY-4f77aa0bcdcfa908e42bad55c2544b79/420/420/Image/Png/noFilter",
    ["Magma Shark"] = "https://tr.rbxcdn.com/180DAY-890b267e5dacdd20b5564118847109a3/420/420/Image/Png/noFilter",
    ["Holy Trident"] = "https://tr.rbxcdn.com/180DAY-7eff52194c2c25a0684ab5e7388cb196/420/420/Image/Png/noFilter",
    ["Sharp One"] = "https://tr.rbxcdn.com/180DAY-3862add6dcf806cbed83baa83de95e5c/420/420/Image/Png/noFilter",
    ["Hybodus Shark"] = "https://tr.rbxcdn.com/180DAY-2359f88446dff833cb251d07372b4597/420/420/Image/Png/noFilter",
    ["Panther Eel"] = "https://tr.rbxcdn.com/180DAY-7909d18f78c0649ac89c3282ee920696/420/420/Image/Png/noFilter",
    ["Amethyst"] = "https://tr.rbxcdn.com/180DAY-87e28e43c61d6a54df5fb547c545968a/420/420/Image/Png/noFilter",
    ["Electric Guitar"] = "https://tr.rbxcdn.com/180DAY-3c301538651a861ba1b1fb63e99f93a4/420/420/Image/Png/noFilter",
    ["Element Rod"] = "https://tr.rbxcdn.com/180DAY-3ed5c5f8c70e19fa3560dca2fce7c07e/420/420/Image/Png/noFilter",
    ["Ghost Shark"] = "https://tr.rbxcdn.com/180DAY-6821cd73df0603ad9d833fd93eca7558/420/420/Image/Png/noFilter",
    ["Ghost Worm Fish"] = "https://tr.rbxcdn.com/180DAY-fd55b0cb0aceba27ab9e7ad2dc43a18e/420/420/Image/Png/noFilter",
    ["Bamboo Rod"] = "https://tr.rbxcdn.com/180DAY-74919bec03b0d32f1c66fccc05ef0fa9/420/420/Image/Png/noFilter",
    ["Crocodile"] = "https://tr.rbxcdn.com/180DAY-4c2261fb3e3aef4355660d5170b1dfb6/420/420/Image/Png/noFilter",
    ["Mammoth Appafish"] = "https://tr.rbxcdn.com/180DAY-1298f3c861db2a0681e495aaabca376c/420/420/Image/Png/noFilter",
    ["Ancient Lochness Monster"] = "https://tr.rbxcdn.com/180DAY-7263c3f92e0b0384f3bd09f1bbb1ca7c/420/420/Image/Png/noFilter",
    ["Transcended Stone"] = "https://tr.rbxcdn.com/180DAY-aacf6c104a7ca767a91de515b492eae3/420/420/Image/Png/noFilter",
    ["King Jelly"] = "https://tr.rbxcdn.com/180DAY-92fc8bfa788c39623c28f22b0706adc0/420/420/Image/Png/noFilter",
    ["Ancient Relic Crocodile"] = "https://tr.rbxcdn.com/180DAY-c447b9fe0416eb311b55435196e7594f/420/420/Image/Png/noFilter",
    ["Bone Whale"] = "https://tr.rbxcdn.com/180DAY-308e892131ab2778802ada80f0474cff/420/420/Image/Png/noFilter",
    ["Mosasaur Shark"] = "https://tr.rbxcdn.com/180DAY-bbdfb5e8578a81214175a40239d81d96/420/420/Image/Png/noFilter",
    ["Elshark Gran Maja"] = "https://tr.rbxcdn.com/180DAY-86cb026448324f7b7bbf6f78e410ae7d/420/420/Image/Png/noFilter",
    ["Oceanic Harpoon"] = "https://tr.rbxcdn.com/180DAY-7ac45129efa2cd53c39ae65ecf52ba12/420/420/Image/Png/noFilter",
    ["Ancient Whale"] = "https://tr.rbxcdn.com/180DAY-2b9cae3ec359b825fe2fd8e66ef06245/420/420/Image/Png/noFilter",
    ["Dead Zombie Shark"] = "https://tr.rbxcdn.com/180DAY-3171321da5dc01cb79a90621e56446e4/420/420/Image/Png/noFilter",
    ["Zombie Shark"] = "https://tr.rbxcdn.com/180DAY-b14df5d94402e2626876f48525c838d3/420/420/Image/Png/noFilter",
    ["Dark Pumpkin Appafish"] = "https://tr.rbxcdn.com/180DAY-b7008b51763be85f7e3add203378c707/420/420/Image/Png/noFilter",
    ["Frankenstein Longsnapper"] = "https://tr.rbxcdn.com/180DAY-f22390ceedb9c917d5c98fe1e2ef102d/420/420/Image/Png/noFilter",
    ["Pumpkin Ray"] = "https://tr.rbxcdn.com/180DAY-20aab5d1ebe53ded83e1d7f436848077/420/420/Image/Png/noFilter",
    ["Zombie Megalodon"] = "https://tr.rbxcdn.com/180DAY-749e1b19f00c8c2e2ea7c53a69ff981b/420/420/Image/Png/noFilter",
    ["Reaver Scythe"] = "https://tr.rbxcdn.com/180DAY-92c7dde06b3de83ee73ca8938a912a08/420/420/Image/Png/noFilter",
    ["Soul Scythe"] = "https://tr.rbxcdn.com/180DAY-ec773d5260f78c59bbb53486f0ddcf78/420/420/Image/Png/noFilter",
    ["Spirit Staff"] = "https://tr.rbxcdn.com/180DAY-3d9aaf1e29c2cdc60e1baf9bd98ed80d/420/420/Image/Png/noFilter",
    ["Undead Guitar"] = "https://tr.rbxcdn.com/180DAY-b9da6fe1f5cd8f82ad79b02fb0335d84/420/420/Image/Png/noFilter",
    ["Heartfelt Blade"] = "https://tr.rbxcdn.com/180DAY-e4747938ab9821a9c8b85252499729de/420/420/Image/Png/noFilter",
    ["Divine Blade"] = "https://tr.rbxcdn.com/180DAY-cf2737700cad3406d2fa50cd9708b465/420/420/Image/Png/noFilter",
    ["Hammerhead Mummy"] = "https://tr.rbxcdn.com/180DAY-8bd199b2359239a309f59d5b2ce26a5e/420/420/Image/Png/noFilter",
    ["Bloodmoon Whale"] = "https://tr.rbxcdn.com/180DAY-b4cbfa058b1b550cd3ccefa0ccf47360/420/420/Image/Png/noFilter",
    ["Talon Serpent"] = "https://tr.rbxcdn.com/180DAY-941fe7a348c160449eec612d16c2ec0c/420/420/Image/Png/noFilter",
    ["Wild Serpent"] = "https://tr.rbxcdn.com/180DAY-7a67cc1042a3d44268057c1c0bac2c13/420/420/Image/Png/noFilter",
    ["Skeleton Narwhal"] = "https://tr.rbxcdn.com/180DAY-c7d7f5f265fb857bfe91cc9692747dac/420/420/Image/Png/noFilter",
    ["Eclipse Katana"] = "https://tr.rbxcdn.com/180DAY-e7ce9073b16302b88295ccfda098061a/420/420/Image/Png/noFilter",
    ["Princess Parasol"] = "https://tr.rbxcdn.com/180DAY-9ad1d624a9adde9e8c02b154fae64635/420/420/Image/Png/noFilter",
    ["Sea Crustacean"] = "https://tr.rbxcdn.com/180DAY-030ff045c8ccceca1c0b19b24201e1a8/420/420/Image/Png/noFilter",
    ["Runic Squid"] = "https://tr.rbxcdn.com/180DAY-0388d0df5b5a7c6841b432c9249447dd/420/420/Image/Png/noFilter",
    ["Runic Sea Crustacean"] = "https://tr.rbxcdn.com/180DAY-5732559dcad98e66b268dda79cd4a555/420/420/Image/Png/noFilter",
    ["Primordial Octopus"] = "https://tr.rbxcdn.com/180DAY-0862650c4b3a47803f935a9438d6303a/420/420/Image/Png/noFilter",
    ["1x1x1x1 Shark"] = "https://tr.rbxcdn.com/180DAY-23999978ceaa0ab507d63c7c89282b47/420/420/Image/Png/noFilter",
    ["Gladiator Shark"] = "https://tr.rbxcdn.com/180DAY-4c8efbc434010eb8503b1eef5f327fe6/420/420/Image/Png/noFilter",
    ["Fossilized Shark"] = "https://tr.rbxcdn.com/180DAY-d82e91bbd9c727c481b067229ddf5d80/420/420/Image/Png/noFilter",
    ["Flatheaded Whale Shark"] = "https://tr.rbxcdn.com/180DAY-c6727b35793a7a7cb6a1a249c3edaa3e/420/420/Image/Png/noFilter",
    ["Cavern Dweller"] = "https://tr.rbxcdn.com/180DAY-30557ab36397eb18c5b892a583c374d7/420/420/Image/Png/noFilter",
    ["Ancient Squid"] = "https://tr.rbxcdn.com/180DAY-ff5ff5510760de23488d199d3ea6564c/420/420/Image/Png/noFilter",
    ["Plasma Serpent"] = "https://tr.rbxcdn.com/180DAY-35165b79deef0e6438a21bacf94e288c/420/420/Image/Png/noFilter",
    ["Cryoshade Glider"] = "https://tr.rbxcdn.com/180DAY-0ce44b25092b07e5431211628c211d5c/420/420/Image/Png/noFilter",
    ["Starlight Manta Ray"] = "https://tr.rbxcdn.com/180DAY-0e45af5b857194a5eff1cfec5adaba6d/420/420/Image/Png/noFilter",
    ["Nox Aeterna"] = "https://tr.rbxcdn.com/180DAY-5daef9806c67515fe68bf71b3c517c91/420/420/Image/Png/noFilter",
    ["Dark Seahorse"] = "https://tr.rbxcdn.com/180DAY-808b42ec5ee34d70a0c6ecb07c159587/420/420/Image/Png/noFilter",
    ["Corruption Edge"] = "https://tr.rbxcdn.com/180DAY-aeb0c4a9e9ddaa1eadaf09da319f0cba/420/420/Image/Png/noFilter",
    ["Binary Edge"] = "https://tr.rbxcdn.com/180DAY-8019ff16f8e9913f4f1c07dfd6478ac1/420/420/Image/Png/noFilter",
    ["1x1x1x1 Ban Hammer"] = "https://tr.rbxcdn.com/180DAY-bdddfd3d0f0a539be663690ecb156901/420/420/Image/Png/noFilter",
    ["ElRetro Gran Maja"] = "https://tr.rbxcdn.com/180DAY-a124fb3fee23c00065ce18cb23cda596/420/420/Image/Png/noFilter",
    ["Starry Night Shark"] = "https://tr.rbxcdn.com/180DAY-9e99ffce215d3208ec6f14f01f526acf/420/420/Image/Png/noFilter",
    ["Frostbreaker Whale"] = "https://tr.rbxcdn.com/180DAY-ed54753f7f571f975ca1d7065012800c/420/420/Image/Png/noFilter",
}

local TIER_MAP = {
    [6] = "Mythic",
    [7] = "SECRET"
}

local TIER_COLORS = {
    [6] = 16711680,  -- Red for Mythic
    [7] = 65535      -- Cyan for SECRET
}

local TIER_EMOJI = {
    [6] = "🔴",
    [7] = "🟣"
}

local MUTATION_PREFIXES = {
    "Shiny ", "Sparkling ", "ALBINO ", "GOLD ", "CORRUPT ", "Darkened ",
    "Glossy ", "Frozen ", "Scorched ", "Lunar ", "Solar ", "Blessed ",
    "Cursed ", "Mosaic ", "Atlantean ", "Bioluminescent ", "Translucent ",
    "Ghastly ", "Spectral ", "STONE ", "FROZEN ", "HOLOGRAPHIC ",
    "Negative ", "Greyscale ", "Aurora ", "Hexed ", "Sinister ",
    "Electric ", "Glow ", "Big ", "Small ", "Radioactive ", "Mythical ",
    "Mutated ", "Neon ", "Crystal ", "Shadow ", "Ancient ", "Primal ",
    "Runic ", "Volcanic ", "Celestial ", "Abyssal ", "Divine ", "Infernal "
}

local fishDatabase = {}
local thumbnailCount = 0
local loadedCount = 0

local function getBaseFishName(fullName)
    if fishDatabase[fullName] then 
        return fullName, nil
    end
    
    for _, mutation in ipairs(MUTATION_PREFIXES) do
        if string.sub(fullName, 1, #mutation) == mutation then
            local baseName = string.sub(fullName, #mutation + 1)
            
            if fishDatabase[baseName] then
                return baseName, mutation
            end
            
            for dbName in pairs(fishDatabase) do
                if string.lower(dbName) == string.lower(baseName) then
                    return dbName, mutation
                end
            end
        end
    end
    
    for dbName in pairs(fishDatabase) do
        if string.lower(dbName) == string.lower(fullName) then
            return dbName, nil
        end
    end
    
    return fullName, nil
end

local function getThumbnailUrl(fishName)
    local baseName = getBaseFishName(fishName)
    return FISH_THUMBNAILS[baseName]
end

local function loadDatabase()
    local items = ReplicatedStorage:FindFirstChild("Items")
    if not items then 
        warn("[FishIT] ⚠️ Items folder not found!")
        return 
    end
    
    print("[FishIT] 📊 Loading MYTHIC & SECRET fish database...")
    
    for _, mod in ipairs(items:GetChildren()) do
        if mod:IsA("ModuleScript") then
            local ok, data = pcall(require, mod)
            if ok and data and data.Data then
                local name = data.Data.Name
                local tier = data.Data.Tier
                
                -- HANYA LOAD MYTHIC (6) DAN SECRET (7)
                if name and tier and (tier == 6 or tier == 7) then
                    local weightData = {}
                    if data.Weight then
                        if data.Weight.Big then
                            weightData.Big = {
                                Min = data.Weight.Big.Min,
                                Max = data.Weight.Big.Max
                            }
                        end
                        if data.Weight.Default then
                            weightData.Default = {
                                Min = data.Weight.Default.Min,
                                Max = data.Weight.Default.Max
                            }
                        end
                    end
                    
                    fishDatabase[name] = {
                        tier = tier,
                        rarity = TIER_MAP[tier],
                        price = data.SellPrice or 0,
                        weight = weightData
                    }
                    loadedCount = loadedCount + 1
                end
            end
        end
    end
    
    for _ in pairs(FISH_THUMBNAILS) do
        thumbnailCount = thumbnailCount + 1
    end
    
    print(string.format("[FishIT] ✅ Loaded %d Mythic & Secret fish", loadedCount))
    print(string.format("[FishIT] 🖼️ Thumbnails ready: %d fish", thumbnailCount))
end

local function getFishInfo(fullName)
    local baseName = getBaseFishName(fullName)
    return fishDatabase[baseName]
end

local function detectSize(weight, weightRanges)
    if not weight or not weightRanges then
        return "Normal", ""
    end
    
    local big = weightRanges.Big
    local default = weightRanges.Default
    
    if not big or not default or not big.Min or not big.Max or not default.Min or not default.Max then
        return "Normal", ""
    end
    
    if weight > big.Max then
        return "HUGE", " ⭐"
    end
    
    if weight >= big.Min and weight <= big.Max then
        return "BIG", " 🔥"
    end
    
    if weight < default.Min then
        return "Small", " 🔻"
    end
    
    return "Normal", ""
end

local function formatNum(n)
    if not n then return "0" end
    local s = tostring(n)
    while true do
        local k
        s, k = string.gsub(s, "^(-?%d+)(%d%d%d)", '%1,%2')
        if k == 0 then break end
    end
    return s
end

local function cleanHTML(text)
    local clean = text:gsub("<[^>]+>", "")
    clean = clean:gsub("%s+", " ")
    return clean:match("^%s*(.-)%s*$") or clean
end

local function parseMessage(raw)
    local text = cleanHTML(raw)
    
    if not string.find(text, "%[Server%]") then
        return nil
    end
    
    local player, fish, weight, chance = string.match(text,
        "%[Server%]:%s*([%w_]+)%s+obtained%s+an?%s+(.-)%s+%(([%d%.]+)kg%)%s+with%s+a%s+1%s+in%s+(.-)%s+chance")
    
    if not player then
        player, fish, weight, chance = string.match(text,
            "([%w_]+)%s+obtained%s+an?%s+(.-)%s+%(([%d%.]+)kg%)%s+with%s+a%s+1%s+in%s+(.-)%s+chance")
    end
    
    if fish then
        fish = fish:match("^%s*(.-)%s*$")
        fish = fish:gsub("[^%w%s%-]", "")
    end
    
    return player, fish, tonumber(weight), chance
end

local webhookQueue = {}
local isProcessing = false

local function processWebhookQueue()
    if isProcessing then return end
    isProcessing = true
    
    while #webhookQueue > 0 do
        local payload = table.remove(webhookQueue, 1)
        
        local success, err = pcall(function()
            local request = (syn and syn.request) or request or http_request or (http and http.request)
            
            if request then
                request({
                    Url = DISCORD_WEBHOOK,
                    Method = "POST",
                    Headers = {["Content-Type"] = "application/json"},
                    Body = payload
                })
            else
                HttpService:PostAsync(DISCORD_WEBHOOK, payload, Enum.HttpContentType.ApplicationJson, false)
            end
        end)
        
        if not success then
            warn("[FishIT] ⚠️ Webhook error:", err)
        end
        
        task.wait(0.5)
    end
    
    isProcessing = false
end

local function sendWebhook(title, desc, fields, color, thumbnailUrl)
    if not DISCORD_WEBHOOK or DISCORD_WEBHOOK == "YOUR_WEBHOOK_URL_HERE" then 
        warn("[FishIT] ⚠️ Webhook URL not set!")
        return 
    end
    
    local embed = {
        title = title,
        description = desc,
        color = color,
        fields = fields or {},
        timestamp = os.date("!%Y-%m-%dT%H:%M:%S.000Z"),
        footer = {text = "🎣 MORRIS NIH DEK"}
    }
    
    if thumbnailUrl then
        embed.thumbnail = {url = thumbnailUrl}
    end
    
    local payload = HttpService:JSONEncode({
        username = "🎣 BABU MORIS",
        avatar_url = "https://media.discordapp.net/attachments/1382053931433328740/1441828021060505620/Desain_tanpa_judul_3.png?ex=6923367c&is=6921e4fc&hm=baf89f8bfcef27b4de3df6e2c0c2a730a501cf90ac8a7dedbb88375c44a80208&=&format=webp&quality=lossless&width=656&height=656",
        embeds = {embed}
    })
    
    table.insert(webhookQueue, payload)
    task.spawn(processWebhookQueue)
end

local function logCatch(player, fishFullName, weight, chance)
    local info = getFishInfo(fishFullName)
    
    if not info then
        return
    end
    
    local baseName, mutation = getBaseFishName(fishFullName)
    local sizeCategory, sizeEmoji = detectSize(weight, info.weight)
    
    local displayName = fishFullName
    if mutation then
        displayName = mutation .. baseName
    end
    
    print(string.format("[FishIT] ✅ %s caught %s (%s) - %s %.2fkg", 
        player, displayName, info.rarity, sizeCategory, weight))
    
    local emoji = TIER_EMOJI[info.tier] or ""
    local title = emoji .. " " .. displayName .. " (" .. info.rarity .. ")"
    
    local mutationText = ""
    if mutation then
        mutationText = "\n✨ **Mutation:** " .. mutation:gsub("%s+$", "")
    end
    
    local description = "**" .. player .. "** caught a **" .. displayName .. "**" .. mutationText
    
    local weightField = string.format("**%.2f kg**", weight)
    if sizeCategory ~= "Normal" then
        weightField = string.format("**%.2f kg** (%s%s)", weight, sizeCategory, sizeEmoji)
    end
    
    local fields = {
        {name = "⚖️ Weight", value = weightField, inline = true},
        {name = "🎲 Rarity", value = "**" .. info.rarity .. "**", inline = true},
        {name = "🎯 Chance", value = "**1 in " .. formatNum(chance) .. "**", inline = true},
        {name = "💰 Price", value = "**$" .. formatNum(info.price) .. "**", inline = true}
    }
    
    local color = TIER_COLORS[info.tier] or 9807270
    local thumbnailUrl = getThumbnailUrl(fishFullName)
    
    sendWebhook(title, description, fields, color, thumbnailUrl)
end

local processedCache = {}
local CACHE_EXPIRY = 300

local function cleanCache()
    local now = tick()
    local newCache = {}
    for msg, time in pairs(processedCache) do
        if now - time < CACHE_EXPIRY then
            newCache[msg] = time
        end
    end
    processedCache = newCache
end

local function processMsg(text)
    if string.find(text, "%[Global%]") or not string.find(text, "%[Server%]") then
        return
    end
    
    if not string.find(text, "obtained") or not string.find(text, "chance") then
        return
    end
    
    if processedCache[text] then return end
    processedCache[text] = tick()
    
    local player, fish, weight, chance = parseMessage(text)
    if player and fish then
        task.spawn(logCatch, player, fish, weight, chance)
    end
end

local function startMonitor()
    task.spawn(function()
        pcall(function()
            local TextChatService = game:GetService("TextChatService")
            local channels = TextChatService:WaitForChild("TextChannels", 5)
            if channels then
                print("[FishIT] ✓ TextChat connected")
                
                for _, ch in ipairs(channels:GetChildren()) do
                    if ch:IsA("TextChannel") then
                        ch.MessageReceived:Connect(function(msg)
                            processMsg(msg.Text)
                        end)
                    end
                end
                
                channels.ChildAdded:Connect(function(ch)
                    if ch:IsA("TextChannel") then
                        ch.MessageReceived:Connect(function(msg)
                            processMsg(msg.Text)
                        end)
                    end
                end)
            end
        end)
    end)
    
    task.spawn(function()
        pcall(function()
            local events = ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents", 5)
            if events then
                local filter = events:WaitForChild("OnMessageDoneFiltering", 5)
                if filter then
                    print("[FishIT] ✓ Legacy Chat connected")
                    filter.OnClientEvent:Connect(function(data)
                        if data and data.Message then
                            processMsg(data.Message)
                        end
                    end)
                end
            end
        end)
    end)
    
    task.spawn(function()
        pcall(function()
            local gui = Players.LocalPlayer:WaitForChild("PlayerGui", 5)
            if gui then
                print("[FishIT] ✓ GUI monitor active")
                
                gui.DescendantAdded:Connect(function(obj)
                    if obj:IsA("TextLabel") then
                        task.delay(0.05, function()
                            pcall(function()
                                obj:GetPropertyChangedSignal("Text"):Connect(function()
                                    processMsg(obj.Text)
                                end)
                            end)
                        end)
                    end
                end)
            end
        end)
    end)
    
    task.spawn(function()
        while true do
            task.wait(CACHE_EXPIRY)
            cleanCache()
        end
    end)
end

print("[FishIT] ========================================")
print("[FishIT] 🎣 FISH IT LOGGER V10.0 - MYTHIC & SECRET")
print("[FishIT] ✅ Optimized | No Looping | Real-time")
print("[FishIT] ========================================")
print("[FishIT] 📊 Loading database...")

loadDatabase()
task.wait(0.5)

local coveragePercent = loadedCount > 0 and math.floor((thumbnailCount / loadedCount) * 100) or 0

print(string.format("[FishIT] ✓ Database: %d Mythic & Secret fish loaded", loadedCount))
print(string.format("[FishIT] ✓ Thumbnails: %d fish (%d%% coverage)", thumbnailCount, coveragePercent))
print("[FishIT] ✓ Filter: MYTHIC (Tier 6) & SECRET (Tier 7) ONLY")
print("[FishIT] ✓ Smart mutation detection enabled")
print("[FishIT] 🚀 Starting real-time monitor...")

startMonitor()

task.wait(1)
sendWebhook(
    "✅ Fish IT Logger Started",
    "**v10.0 - MYTHIC & SECRET ONLY!**\n🚀 Event-driven, no loops\n✨ Smart mutation detection\n🔴 Mythic • 🟣 SECRET",
    {
        {name = "📊 Database", value = tostring(loadedCount) .. " fish", inline = true},
        {name = "🎯 Filter", value = "Tier 6-7 Only", inline = true},
        {name = "🖼️ Thumbnails", value = string.format("✅ %d fish (%d%%)", thumbnailCount, coveragePercent), inline = true}
    },
    65280
)

print("[FishIT] ========================================")
print("[FishIT] ✅ READY! Monitoring Mythic & Secret catches...")
print("[FishIT] ========================================")
