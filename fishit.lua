local DISCORD_WEBHOOK = "https://discord.com/api/webhooks/1441942579145867384/Ns0Pn3wLACcJjrlwBhTbPJmreeLuEnu6fMmD03sK34orPmIXnegHaQwYagG-LraJHivS"
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local FISH_THUMBNAILS = {
    ["Ancient Lochness Monster"] = "https://tr.rbxcdn.com/180DAY-7263c3f92e0b0384f3bd09f1bbb1ca7c/420/420/Image/Png/noFilter",
    ["Ancient Whale"] = "https://tr.rbxcdn.com/180DAY-2b9cae3ec359b825fe2fd8e66ef06245/420/420/Image/Png/noFilter",
    ["Blob Shark"] = "https://tr.rbxcdn.com/180DAY-de341f23e8add220fefbe2db159fd9ec/420/420/Image/Png/noFilter",
    ["Bloodmoon Whale"] = "https://tr.rbxcdn.com/180DAY-b4cbfa058b1b550cd3ccefa0ccf47360/420/420/Image/Png/noFilter",
    ["Bone Whale"] = "https://tr.rbxcdn.com/180DAY-308e892131ab2778802ada80f0474cff/420/420/Image/Png/noFilter",
    ["Cryoshade Glider"] = "https://tr.rbxcdn.com/180DAY-0ce44b25092b07e5431211628c211d5c/420/420/Image/Png/noFilter",
    ["Crystal Crab"] = "https://tr.rbxcdn.com/180DAY-644fdd8d9b29c3c4da83e170b9b3eab0/420/420/Image/Png/noFilter",
    ["Dead Zombie Shark"] = "https://tr.rbxcdn.com/180DAY-3171321da5dc01cb79a90621e56446e4/420/420/Image/Png/noFilter",
    ["Eerie Shark"] = "https://tr.rbxcdn.com/180DAY-b24c218862625f0b1c7a8c84b161cd6d/420/420/Image/Png/noFilter",
    ["Elshark Gran Maja"] = "https://tr.rbxcdn.com/180DAY-86cb026448324f7b7bbf6f78e410ae7d/420/420/Image/Png/noFilter",
    ["Frostborn Shark"] = "https://tr.rbxcdn.com/180DAY-95e31005ee70d0dd081590e066e2d8a8/420/420/Image/Png/noFilter",
    ["Ghost Shark"] = "https://tr.rbxcdn.com/180DAY-6821cd73df0603ad9d833fd93eca7558/420/420/Image/Png/noFilter",
    ["Ghost Worm Fish"] = "https://tr.rbxcdn.com/180DAY-fd55b0cb0aceba27ab9e7ad2dc43a18e/420/420/Image/Png/noFilter",
    ["Giant Squid"] = "https://tr.rbxcdn.com/180DAY-ad8d392c5e6afe4cf421b5d1071b9a5e/420/420/Image/Png/noFilter",
    ["Gladiator Shark"] = "https://tr.rbxcdn.com/180DAY-4c8efbc434010eb8503b1eef5f327fe6/420/420/Image/Png/noFilter",
    ["Great Christmas Whale"] = "https://tr.rbxcdn.com/180DAY-c53826109548afdbbef84999d9251ad2/420/420/Image/Png/noFilter",
    ["Great Whale"] = "https://tr.rbxcdn.com/180DAY-427f3f35097642ce11568366678b16af/420/420/Image/Png/noFilter",
    ["King Jelly"] = "https://tr.rbxcdn.com/180DAY-92fc8bfa788c39623c28f22b0706adc0/420/420/Image/Png/noFilter",
    ["Lochness Monster"] = "https://tr.rbxcdn.com/180DAY-e5870f13dcd954fb9735530fdefeb176/420/420/Image/Png/noFilter",
    ["Megalodon"] = "https://tr.rbxcdn.com/180DAY-4f77aa0bcdcfa908e42bad55c2544b79/420/420/Image/Png/noFilter",
    ["Monster Shark"] = "https://tr.rbxcdn.com/180DAY-64489f77e3319c5639d380d34ad871a5/420/420/Image/Png/noFilter",
    ["Mosasaur Shark"] = "https://tr.rbxcdn.com/180DAY-bbdfb5e8578a81214175a40239d81d96/420/420/Image/Png/noFilter",
    ["Orca"] = "https://tr.rbxcdn.com/180DAY-e3d4495262428ed404619d8e6f16d6ec/420/420/Image/Png/noFilter",
    ["Queen Crab"] = "https://tr.rbxcdn.com/180DAY-75f017dc45d893c85ae39873590042b1/420/420/Image/Png/noFilter",
    ["Robot Kraken"] = "https://tr.rbxcdn.com/180DAY-489ffa039a70e41ad60d70997ada55ed/420/420/Image/Png/noFilter",
    ["Scare"] = "https://tr.rbxcdn.com/180DAY-681f78926850a4c4fa9c784bd61ea392/420/420/Image/Png/noFilter",
    ["Skeleton Narwhal"] = "https://tr.rbxcdn.com/180DAY-c7d7f5f265fb857bfe91cc9692747dac/420/420/Image/Png/noFilter",
    ["Talon Serpent"] = "https://tr.rbxcdn.com/180DAY-941fe7a348c160449eec612d16c2ec0c/420/420/Image/Png/noFilter",
    ["Thin Armor Shark"] = "https://tr.rbxcdn.com/180DAY-11649b435ccc75c49b95e85f5e3d6011/420/420/Image/Png/noFilter",
    ["Wild Serpent"] = "https://tr.rbxcdn.com/180DAY-7a67cc1042a3d44268057c1c0bac2c13/420/420/Image/Png/noFilter",
    ["Worm Fish"] = "https://tr.rbxcdn.com/180DAY-7299ff7cfe763fc20a4ad726678c8059/420/420/Image/Png/noFilter",
    ["Zombie Megalodon"] = "https://tr.rbxcdn.com/180DAY-749e1b19f00c8c2e2ea7c53a69ff981b/420/420/Image/Png/noFilter",
    ["Zombie Shark"] = "https://tr.rbxcdn.com/180DAY-b14df5d94402e2626876f48525c838d3/420/420/Image/Png/noFilter",
}

local TIER_MAP = {
    [7] = "SECRET"
}

local TIER_COLORS = {
    [7] = 65535
}

local TIER_EMOJI = {
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
    
    print("[FishIT] 📊 Loading SECRET fish database...")
    
    for _, mod in ipairs(items:GetChildren()) do
        if mod:IsA("ModuleScript") then
            local ok, data = pcall(require, mod)
            if ok and data and data.Data then
                local name = data.Data.Name
                local tier = data.Data.Tier
                
                -- HANYA SECRET (7) ONLY
                if name and tier and tier == 7 then
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
    
    print(string.format("[FishIT] ✅ Loaded %d SECRET fish", loadedCount))
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
            request({
                Url = DISCORD_WEBHOOK,
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json"
                },
                Body = payload
            })
        end)
        
        if success then
            print("[FishIT] ✅ Webhook sent!")
        else
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
    
    local color = TIER_COLORS[info.tier] or 65535
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
print("[FishIT] 🎣 FISH IT LOGGER V13.0 FINAL")
print("[FishIT] ✅ SECRET ONLY (TIER 7)")
print("[FishIT] ========================================")
print("[FishIT] 📊 Loading database...")

loadDatabase()
task.wait(0.5)

local coveragePercent = loadedCount > 0 and math.floor((thumbnailCount / loadedCount) * 100) or 0

print(string.format("[FishIT] ✓ Database: %d SECRET fish loaded", loadedCount))
print(string.format("[FishIT] ✓ Thumbnails: %d fish (%d%% coverage)", thumbnailCount, coveragePercent))
print("[FishIT] ✓ Filter: SECRET ONLY (TIER 7)")
print("[FishIT] ✓ Smart mutation detection enabled")
print("[FishIT] 🚀 Starting real-time monitor...")

startMonitor()

task.wait(1)
sendWebhook(
    "✅ Fish IT Logger Started",
    "**v13.0 FINAL - SECRET ONLY!**\n🚀 Event-driven, real-time\n✨ Smart mutation detection\n🟣 SECRET TIER 7 ONLY",
    {
        {name = "📊 Database", value = tostring(loadedCount) .. " SECRET fish", inline = true},
        {name = "🎯 Filter", value = "Tier 7 Only", inline = true},
        {name = "🖼️ Thumbnails", value = string.format("✅ %d fish (%d%%)", thumbnailCount, coveragePercent), inline = true}
    },
    65535
)

print("[FishIT] ========================================")
print("[FishIT] ✅ READY! Monitoring SECRET catches...")
print("[FishIT] ========================================")
