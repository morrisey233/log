local DISCORD_WEBHOOK = "https://discord.com/api/webhooks/1441942579145867384/Ns0Pn3wLACcJjrlwBhTbPJmreeLuEnu6fMmD03sK34orPmIXnegHaQwYagG-LraJHivS"
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- ===== FISH THUMBNAIL URLs ===== (ISI SENDIRI NANTI)
local FISH_THUMBNAILS = {
    ["Abyshorn Fish"] = "https://tr.rbxcdn.com/180DAY-069836ae8379c1ff785af3f3da69d5b6/420/420/Image/Png/noFilter",
    ["Abyss Seahorse"] = "https://tr.rbxcdn.com/180DAY-c89ed00ff0c4102d0ea990e7f6c28f29/420/420/Image/Png/noFilter",
    ["Ancient Arapaima"] = "https://tr.rbxcdn.com/180DAY-809222218f8ca51eec5db1f0989bd4e8/420/420/Image/Png/noFilter",
    ["Ancient Lochness Monster"] = "https://tr.rbxcdn.com/180DAY-7263c3f92e0b0384f3bd09f1bbb1ca7c/420/420/Image/Png/noFilter",
    ["Ancient Pufferfish"] = "https://tr.rbxcdn.com/180DAY-43b69efb69a863950559bc82a788c803/420/420/Image/Png/noFilter",
    ["Ancient Relic Crocodile"] = "https://tr.rbxcdn.com/180DAY-c447b9fe0416eb311b55435196e7594f/420/420/Image/Png/noFilter",
    ["Ancient Squid"] = "https://tr.rbxcdn.com/180DAY-ff5ff5510760de23488d199d3ea6564c/420/420/Image/Png/noFilter",
    ["Ancient Whale"] = "https://tr.rbxcdn.com/180DAY-2b9cae3ec359b825fe2fd8e66ef06245/420/420/Image/Png/noFilter",
    ["Angler Fish"] = "https://tr.rbxcdn.com/180DAY-31613ab5d2a1e897a4bd2aaf8f399e69/420/420/Image/Png/noFilter",
    ["Freshwater Piranha"] = "https://tr.rbxcdn.com/180DAY-f7627ed670665bd753071c0e74693435/420/420/Image/Png/noFilter",
    ["Angrylion Fish"] = "https://tr.rbxcdn.com/180DAY-2db9cc43aabd0cace4c4a31b547b37db/420/420/Image/Png/noFilter",
    ["Antique Cup"] = "https://tr.rbxcdn.com/180DAY-1a3b3f6b501c9f2ff03b07ebb248da9f/420/420/Image/Png/noFilter",
    ["Antique Watch"] = "https://tr.rbxcdn.com/180DAY-d74b11d721257905d59d4933c526d6bb/420/420/Image/Png/noFilter",
    ["Armor Catfish"] = "https://tr.rbxcdn.com/180DAY-3f26b72daadb14c7f51172f81707b25a/420/420/Image/Png/noFilter",
    ["Arowana"] = "https://tr.rbxcdn.com/180DAY-638209746f2d965fa00209614843aa84/420/420/Image/Png/noFilter",
    ["Arrow Artifact"] = "https://tr.rbxcdn.com/180DAY-fe59af37f48686f375d2da5ddca41306/420/420/Image/Png/noFilter",
    ["Ash Basslet"] = "https://tr.rbxcdn.com/180DAY-801d0f8b4f1572806c64863e4262a360/420/420/Image/Png/noFilter",
    ["Astra Damsel"] = "https://tr.rbxcdn.com/180DAY-91c25280fa94865f6bf15c998867d219/420/420/Image/Png/noFilter",
    ["Axolotl"] = "https://tr.rbxcdn.com/180DAY-057cbd6a08e5c91d79add0ad271fb495/420/420/Image/Png/noFilter",
    ["Azure Damsel"] = "https://tr.rbxcdn.com/180DAY-ef7baecc225658f66998ffb574b3b482/420/420/Image/Png/noFilter",
    ["Baby Pumpkin Shark"] = "https://tr.rbxcdn.com/180DAY-09f878d28dbb5283a9ffc09a4ce9289e/420/420/Image/Png/noFilter",
    ["Baby Shrimp"] = "https://tr.rbxcdn.com/180DAY-9108993876146f8021df3e76b49bf426/420/420/Image/Png/noFilter",
    ["Ballina Angelfish"] = "https://tr.rbxcdn.com/180DAY-a74176d2a2628ecb49b710729f8d7b7b/420/420/Image/Png/noFilter",
    ["Banded Butterfly"] = "https://tr.rbxcdn.com/180DAY-e2959c62ba6bcf276216dc475d6c051f/420/420/Image/Png/noFilter",
    ["Bandit Angelfish"] = "https://tr.rbxcdn.com/180DAY-27887df27b7e9746358e38783756f37e/420/420/Image/Png/noFilter",
    ["Barracuda Fish"] = "https://tr.rbxcdn.com/180DAY-de2fa7de7acb5f2b7cb5d24d76a98f95/420/420/Image/Png/noFilter",
    ["Beanie Leedsicheye"] = "https://tr.rbxcdn.com/180DAY-46c5ea666f5ab92d1887ec72ca967ba8/420/420/Image/Png/noFilter",
    ["Blackcap Basslet"] = "https://tr.rbxcdn.com/180DAY-218d0a1a96f931dae1fe8768c8621f75/420/420/Image/Png/noFilter",
    ["Bleekers Damsel"] = "https://tr.rbxcdn.com/180DAY-479740228c5418064f34973288f6b5fb/420/420/Image/Png/noFilter",
    ["Blobby Shieldfish"] = "https://tr.rbxcdn.com/180DAY-ded63292088dc4f333446934afaf1e4c/420/420/Image/Png/noFilter",
    ["Blob Fish"] = "https://tr.rbxcdn.com/180DAY-aa1e7cbb92cdaf7ab8e145b0fbe06dbb/420/420/Image/Png/noFilter",
    ["Blob Shark"] = "https://tr.rbxcdn.com/180DAY-de341f23e8add220fefbe2db159fd9ec/420/420/Image/Png/noFilter",
    ["Bloodmoon Whale"] = "https://tr.rbxcdn.com/180DAY-b4cbfa058b1b550cd3ccefa0ccf47360/420/420/Image/Png/noFilter",
    ["Blue-Banded Goby"] = "https://tr.rbxcdn.com/180DAY-7c46aeefe3efc9328be61b46a82992df/420/420/Image/Png/noFilter",
    ["Blueflame Ray"] = "https://tr.rbxcdn.com/180DAY-f4c528999276a739bedd9e21b06b67a7/420/420/Image/Png/noFilter",
    ["Blue Lobster"] = "https://tr.rbxcdn.com/180DAY-c257a9b6d6170377dc50e1d1b5f6497e/420/420/Image/Png/noFilter",
    ["Blumato Clownfish"] = "https://tr.rbxcdn.com/180DAY-ceb80e92786c2c9643d46b5f079ce266/420/420/Image/Png/noFilter",
    ["Boar Fish"] = "https://tr.rbxcdn.com/180DAY-bf241fa97f794d7e2b92d426d8ed94ed/420/420/Image/Png/noFilter",
    ["Boa Angelfish"] = "https://tr.rbxcdn.com/180DAY-9f7e1ab5ceb7d3f5e36a844e35c7a960/420/420/Image/Png/noFilter",
    ["Boney Eel"] = "https://tr.rbxcdn.com/180DAY-7c0769097cc108cdfd0a1effc61740c4/420/420/Image/Png/noFilter",
    ["Bone Whale"] = "https://tr.rbxcdn.com/180DAY-308e892131ab2778802ada80f0474cff/420/420/Image/Png/noFilter",
    ["Bumblebee Grouper"] = "https://tr.rbxcdn.com/180DAY-275a1d1a3cca6d1f400157cfea359c92/420/420/Image/Png/noFilter",
    ["Candycane Lobster"] = "https://tr.rbxcdn.com/180DAY-848694da587e846f3646c67c34356381/420/420/Image/Png/noFilter",
    ["Candy Butterfly"] = "https://tr.rbxcdn.com/180DAY-3c1ca3685459f76e98ca5b660c5683ea/420/420/Image/Png/noFilter",
    ["Candy Corn Eel"] = "https://tr.rbxcdn.com/180DAY-2b0ad60337ef378ed06b41c33c389917/420/420/Image/Png/noFilter",
    ["Catfish"] = "https://tr.rbxcdn.com/180DAY-339a4f403a7f7194041f44f7ca0cf45a/420/420/Image/Png/noFilter",
    ["Cavern Dweller"] = "https://tr.rbxcdn.com/180DAY-30557ab36397eb18c5b892a583c374d7/420/420/Image/Png/noFilter",
    ["Charmed Tang"] = "https://tr.rbxcdn.com/180DAY-3bd6d4927011406d30d72c0eedae506c/420/420/Image/Png/noFilter",
    ["Christmastree Longnose"] = "https://tr.rbxcdn.com/180DAY-0f5934b48555977b485f7fe4ab5cfdd9/420/420/Image/Png/noFilter",
    ["Chrome Tuna"] = "https://tr.rbxcdn.com/180DAY-b56be54f22abe403f03181934b5b7bb2/420/420/Image/Png/noFilter",
    ["Clownfish"] = "https://tr.rbxcdn.com/180DAY-70efa988a569439d8858bea4390af194/420/420/Image/Png/noFilter",
    ["Coal Tang"] = "https://tr.rbxcdn.com/180DAY-83d7d8aa4947ee63e55f7eec29718dfb/420/420/Image/Png/noFilter",
    ["Conch Shell"] = "https://tr.rbxcdn.com/180DAY-69e0a4aa67696fc8f7035a312133964e/420/420/Image/Png/noFilter",
    ["Coney Fish"] = "https://tr.rbxcdn.com/180DAY-ea7ef7aacbe2b62e30026fb13e16e4aa/420/420/Image/Png/noFilter",
    ["Conspi Angelfish"] = "https://tr.rbxcdn.com/180DAY-eb7d14a9d5cad4a8cf361ab15a75c073/420/420/Image/Png/noFilter",
    ["Copperband Butterfly"] = "https://tr.rbxcdn.com/180DAY-d41630feb35fae1dbf1206baaf1812a2/420/420/Image/Png/noFilter",
    ["Corazon Damsel"] = "https://tr.rbxcdn.com/180DAY-7eb91a7ec3d1823fd50e085f0417f9e1/420/420/Image/Png/noFilter",
    ["Cow Clownfish"] = "https://tr.rbxcdn.com/180DAY-6b59638123d7ecdf8ef512000d7eb5d4/420/420/Image/Png/noFilter",
    ["Crescent Artifact"] = "https://tr.rbxcdn.com/180DAY-909346ff19a678f08feaea34fe4d9d94/420/420/Image/Png/noFilter",
    ["Crocodile"] = "https://tr.rbxcdn.com/180DAY-4c2261fb3e3aef4355660d5170b1dfb6/420/420/Image/Png/noFilter",
    ["Cryoshade Glider"] = "https://tr.rbxcdn.com/180DAY-0ce44b25092b07e5431211628c211d5c/420/420/Image/Png/noFilter",
    ["Crystal Crab"] = "https://tr.rbxcdn.com/180DAY-644fdd8d9b29c3c4da83e170b9b3eab0/420/420/Image/Png/noFilter",
    ["Crystal Salamander"] = "https://tr.rbxcdn.com/180DAY-9c2db5f154387f94cb5ca922e2baaead/420/420/Image/Png/noFilter",
    ["Curious Garfish"] = "https://tr.rbxcdn.com/180DAY-90eb2d4159dea341df12a5c8ea44f47a/420/420/Image/Png/noFilter",
    ["Cute Octopus"] = "https://tr.rbxcdn.com/180DAY-ef3dcdc459904b8b92d69ab6b5870d30/420/420/Image/Png/noFilter",
    ["Cypress Ratua"] = "https://tr.rbxcdn.com/180DAY-3e94450b383e1795002bb224e39ae6ef/420/420/Image/Png/noFilter",
    ["Dark Eel"] = "https://tr.rbxcdn.com/180DAY-4c80b41a707b1561114b062854e41859/420/420/Image/Png/noFilter",
    ["Dark Pumpkin Appafish"] = "https://tr.rbxcdn.com/180DAY-b7008b51763be85f7e3add203378c707/420/420/Image/Png/noFilter",
    ["Dark Tentacle"] = "https://tr.rbxcdn.com/180DAY-a4119143b9b64d31392e631d97b68a16/420/420/Image/Png/noFilter",
    ["Darwin Clownfish"] = "https://tr.rbxcdn.com/180DAY-c550b09a515fc2d8f4f0f6a7d9042e9d/420/420/Image/Png/noFilter",
    ["Dead Fish"] = "https://tr.rbxcdn.com/180DAY-ae0d0dc3b6a6eb77c493c16e72744e09/420/420/Image/Png/noFilter",
    ["Dead Scary Clownfish"] = "https://tr.rbxcdn.com/180DAY-1b15647926c90214b55232d85d995d9d/420/420/Image/Png/noFilter",
    ["Dead Spooky Koi Fish"] = "https://tr.rbxcdn.com/180DAY-be56d70743c3d84f24158da78af4d8cc/420/420/Image/Png/noFilter",
    ["Dead Zombie Shark"] = "https://tr.rbxcdn.com/180DAY-3171321da5dc01cb79a90621e56446e4/420/420/Image/Png/noFilter",
    ["Diamond Artifact"] = "https://tr.rbxcdn.com/180DAY-edcfa5ebcd4fd518cddbd388b2825fd9/420/420/Image/Png/noFilter",
    ["Diamond Ring"] = "https://tr.rbxcdn.com/180DAY-ecf9a8b1bd3551f10d13561ab3a1d304/420/420/Image/Png/noFilter",
    ["Dogfish"] = "https://tr.rbxcdn.com/180DAY-925ede40db2556d662c5f3441cdc3ee1/420/420/Image/Png/noFilter",
    ["Domino Damsel"] = "https://tr.rbxcdn.com/180DAY-3bd8d58f98de2d3be33d03b3ba91a78f/420/420/Image/Png/noFilter",
    ["Doober Fish"] = "https://tr.rbxcdn.com/180DAY-353c340003cc8dddb23439cab938b12a/420/420/Image/Png/noFilter",
    ["Dorhey Tang"] = "https://tr.rbxcdn.com/180DAY-be70f4f4fe0cefe0d9e7a8228316c043/420/420/Image/Png/noFilter",
    ["Dotted Stingray"] = "https://tr.rbxcdn.com/180DAY-0e52fce670e1b9c80815270d4e4fe811/420/420/Image/Png/noFilter",
    ["Drippy Tucanare"] = "https://tr.rbxcdn.com/180DAY-825b6b348eeed2fcf2a804790d283df2/420/420/Image/Png/noFilter",
    ["Eerie Shark"] = "https://tr.rbxcdn.com/180DAY-b24c218862625f0b1c7a8c84b161cd6d/420/420/Image/Png/noFilter",
    ["Electric Eel"] = "https://tr.rbxcdn.com/180DAY-56956675cea2e03e53eaf39eb1d1162b/420/420/Image/Png/noFilter",
    ["Elshark Gran Maja"] = "https://tr.rbxcdn.com/180DAY-86cb026448324f7b7bbf6f78e410ae7d/420/420/Image/Png/noFilter",
    ["Enchanted Angelfish"] = "https://tr.rbxcdn.com/180DAY-a5f862817e7658d4142573bccd411d5c/420/420/Image/Png/noFilter",
    ["Enchant Stone"] = "https://tr.rbxcdn.com/180DAY-bbbf9cb59b11ca334aa4c227a435ef44/420/420/Image/Png/noFilter",
    ["Expensive Chain"] = "https://tr.rbxcdn.com/180DAY-af1c983db534cc47164ad7dabe199115/420/420/Image/Png/noFilter",
    ["Fade Tang"] = "https://tr.rbxcdn.com/180DAY-9bcda15c13a648be01d30c2dd4bd4a96/420/420/Image/Png/noFilter",
    ["Fangtooth"] = "https://tr.rbxcdn.com/180DAY-7fabfe504d9c9c8231c38f5f24ffaacc/420/420/Image/Png/noFilter",
    ["Festive Goby"] = "https://tr.rbxcdn.com/180DAY-a71037c7eddb9ddcc6e4f99662c6e061/420/420/Image/Png/noFilter",
    ["Festive Pufferfish"] = "https://tr.rbxcdn.com/180DAY-3439439b957e082c5fff03c87e53099e/420/420/Image/Png/noFilter",
    ["Firecoal Damsel"] = "https://tr.rbxcdn.com/180DAY-baac3dff47fd7698dbacc050cfb0ee4e/420/420/Image/Png/noFilter",
    ["Fire Goby"] = "https://tr.rbxcdn.com/180DAY-de9795f373ec98e7292f2bee750c7e12/420/420/Image/Png/noFilter",
    ["Fish Fossil"] = "https://tr.rbxcdn.com/180DAY-d52e5b9f50dfcf37dfab369c6ef72477/420/420/Image/Png/noFilter",
    ["Flame Angelfish"] = "https://tr.rbxcdn.com/180DAY-5c88a26706945ad859986574e2d1e407/420/420/Image/Png/noFilter",
    ["Flatheaded Whale Shark"] = "https://tr.rbxcdn.com/180DAY-c6727b35793a7a7cb6a1a249c3edaa3e/420/420/Image/Png/noFilter",
    ["Flat Fish"] = "https://tr.rbxcdn.com/180DAY-454942e25a6e89956c8fc41f35da4a54/420/420/Image/Png/noFilter",
    ["Flying Fish"] = "https://tr.rbxcdn.com/180DAY-7e8190eb1d239a3501c5128abb07af1e/420/420/Image/Png/noFilter",
    ["Flying Manta"] = "https://tr.rbxcdn.com/180DAY-bb85ec2cad4c71cecd82b24eccf7e1ac/420/420/Image/Png/noFilter",
    ["Fossilized Shark"] = "https://tr.rbxcdn.com/180DAY-d82e91bbd9c727c481b067229ddf5d80/420/420/Image/Png/noFilter",
    ["Foxtrot Koanfish"] = "https://tr.rbxcdn.com/180DAY-1291ba7cd10a270c581d9b3c0b1d76f7/420/420/Image/Png/noFilter",
    ["Frankenstein Longsnapper"] = "https://tr.rbxcdn.com/180DAY-f22390ceedb9c917d5c98fe1e2ef102d/420/420/Image/Png/noFilter",
    ["Frog"] = "https://tr.rbxcdn.com/180DAY-9e3bab1a22053b37881140ef308f1107/420/420/Image/Png/noFilter",
    ["Frostborn Shark"] = "https://tr.rbxcdn.com/180DAY-95e31005ee70d0dd081590e066e2d8a8/420/420/Image/Png/noFilter",
    ["Gar Fish"] = "https://tr.rbxcdn.com/180DAY-7b698a7f4b63739fec9b516ee2ba028c/420/420/Image/Png/noFilter",
    ["Ghastly Crab"] = "https://tr.rbxcdn.com/180DAY-5856cbc533bd0f841ffa1c630dbf3562/420/420/Image/Png/noFilter",
    ["Ghastly Hermit Crab"] = "https://tr.rbxcdn.com/180DAY-b58a690210c284c762a3e5e2ec231f1b/420/420/Image/Png/noFilter",
    ["Ghost Shark"] = "https://tr.rbxcdn.com/180DAY-6821cd73df0603ad9d833fd93eca7558/420/420/Image/Png/noFilter",
    ["Ghost Spiralfish"] = "https://tr.rbxcdn.com/180DAY-5799a5bc08e0785102b881f5e4db681f/420/420/Image/Png/noFilter",
    ["Ghost Worm Fish"] = "https://tr.rbxcdn.com/180DAY-fd55b0cb0aceba27ab9e7ad2dc43a18e/420/420/Image/Png/noFilter",
    ["Giant Squid"] = "https://tr.rbxcdn.com/180DAY-ad8d392c5e6afe4cf421b5d1071b9a5e/420/420/Image/Png/noFilter",
    ["Gingerbread Clownfish"] = "https://tr.rbxcdn.com/180DAY-869e25475bce12c4730990d978104b01/420/420/Image/Png/noFilter",
    ["Gingerbread Shark"] = "https://tr.rbxcdn.com/180DAY-5361cac2ad5a55fbaa8f1809faee2625/420/420/Image/Png/noFilter",
    ["Gingerbread Tang"] = "https://tr.rbxcdn.com/180DAY-fd767630439e97e5b6229bc474c1a6c1/420/420/Image/Png/noFilter",
    ["Gingerbread Turtle"] = "https://tr.rbxcdn.com/180DAY-e7b1ed0e14cada5973ca36bb5bae33dc/420/420/Image/Png/noFilter",
    ["Glacierfin Snapper"] = "https://tr.rbxcdn.com/180DAY-52c5571cf85d30c12e8b821972d16f8d/420/420/Image/Png/noFilter",
    ["Gladiator Shark"] = "https://tr.rbxcdn.com/180DAY-4c8efbc434010eb8503b1eef5f327fe6/420/420/Image/Png/noFilter",
    ["Goliath Tiger"] = "https://tr.rbxcdn.com/180DAY-6fcff0b0335759c4f3be1c7c5952a2c2/420/420/Image/Png/noFilter",
    ["Great Christmas Whale"] = "https://tr.rbxcdn.com/180DAY-c53826109548afdbbef84999d9251ad2/420/420/Image/Png/noFilter",
    ["Great Whale"] = "https://tr.rbxcdn.com/180DAY-427f3f35097642ce11568366678b16af/420/420/Image/Png/noFilter",
    ["Greenbee Grouper"] = "https://tr.rbxcdn.com/180DAY-e9c5941b133ded9b4848437517d650aa/420/420/Image/Png/noFilter",
    ["Green Gillfish"] = "https://tr.rbxcdn.com/180DAY-0db7eb5d2061009460597bda58fc1708/420/420/Image/Png/noFilter",
    ["Hammerhead Mummy"] = "https://tr.rbxcdn.com/180DAY-8bd199b2359239a309f59d5b2ce26a5e/420/420/Image/Png/noFilter",
    ["Hammerhead Shark"] = "https://tr.rbxcdn.com/180DAY-5eecb1b55e4823d0e964a019b939f985/420/420/Image/Png/noFilter",
    ["Hawks Turtle"] = "https://tr.rbxcdn.com/180DAY-799c550e35256a99af99566c3e7fd5f6/420/420/Image/Png/noFilter",
    ["Hermit Crab"] = "https://tr.rbxcdn.com/180DAY-bc9045fa1cab0cf9bb5ba7c3d02d2c91/420/420/Image/Png/noFilter",
    ["Herring Fish"] = "https://tr.rbxcdn.com/180DAY-47e7d268aad9e5526829d473703c7b28/420/420/Image/Png/noFilter",
    ["Hourglass Diamond Artifact"] = "https://tr.rbxcdn.com/180DAY-5c96ba6597928b550f1ab860863aa2cf/420/420/Image/Png/noFilter",
    ["Hybodus Shark"] = "https://tr.rbxcdn.com/180DAY-2359f88446dff833cb251d07372b4597/420/420/Image/Png/noFilter",
    ["Iron Domefin"] = "https://tr.rbxcdn.com/180DAY-f3abcf4d174b34ace48d34d5c99b58ab/420/420/Image/Png/noFilter",
    ["Jellyfish"] = "https://tr.rbxcdn.com/180DAY-a426f886a5eaee7874dfb7cd35faafbd/420/420/Image/Png/noFilter",
    ["Jennifer Dottyback"] = "https://tr.rbxcdn.com/180DAY-3b6acea26f96884e8cf73708a8074f4f/420/420/Image/Png/noFilter",
    ["Jewel Tang"] = "https://tr.rbxcdn.com/180DAY-574f1fad2d88ed9b1492a63b234d040f/420/420/Image/Png/noFilter",
    ["Kau Cardinal"] = "https://tr.rbxcdn.com/180DAY-94864cdb3389e1c38642f4406d2b2752/420/420/Image/Png/noFilter",
    ["King Crab"] = "https://tr.rbxcdn.com/180DAY-759396ad59e6d31e9d6bf6a025288e4b/420/420/Image/Png/noFilter",
    ["King Frog"] = "https://tr.rbxcdn.com/180DAY-aac75ed33955d81cec7778f2ddabbfa5/420/420/Image/Png/noFilter",
    ["King Jelly"] = "https://tr.rbxcdn.com/180DAY-92fc8bfa788c39623c28f22b0706adc0/420/420/Image/Png/noFilter",
    ["King Mackerel"] = "https://tr.rbxcdn.com/180DAY-75cf04de5df4aa8ffa0d96446b19801a/420/420/Image/Png/noFilter",
    ["Korean Angelfish"] = "https://tr.rbxcdn.com/180DAY-0f9a240b4afaeaaf48f9bf77b8fe5b66/420/420/Image/Png/noFilter",
    ["Lake Sturgeon"] = "https://tr.rbxcdn.com/180DAY-2e7631b1fa369e216e1abc6f77c0f160/420/420/Image/Png/noFilter",
    ["Lavafin Tuna"] = "https://tr.rbxcdn.com/180DAY-d34eadc0ee383d4ef9ef8c4888c7aa79/420/420/Image/Png/noFilter",
    ["Lava Butterfly"] = "https://tr.rbxcdn.com/180DAY-13eaa009160da2b04d93f21b0a95b1dc/420/420/Image/Png/noFilter",
    ["Liar Nose Fish"] = "https://tr.rbxcdn.com/180DAY-e080cfd3449678ad072e802968f32883/420/420/Image/Png/noFilter",
    ["Lined Cardinal Fish"] = "https://tr.rbxcdn.com/180DAY-c9508d847cef3f83a16345352dfeeeda/420/420/Image/Png/noFilter",
    ["Lion Fish"] = "https://tr.rbxcdn.com/180DAY-40aa92f6e8a988a845020c0fb82eead4/420/420/Image/Png/noFilter",
    ["Lobster"] = "https://tr.rbxcdn.com/180DAY-87aa5010906ff160e09ac92d163b450a/420/420/Image/Png/noFilter",
    ["Lochness Monster"] = "https://tr.rbxcdn.com/180DAY-e5870f13dcd954fb9735530fdefeb176/420/420/Image/Png/noFilter",
    ["Loggerhead Turtle"] = "https://tr.rbxcdn.com/180DAY-1ceaee70b315f3f3ca569e36ac0116d0/420/420/Image/Png/noFilter",
    ["Longnose Butterfly"] = "https://tr.rbxcdn.com/180DAY-6a5877954427691e8a4ff7bcba089885/420/420/Image/Png/noFilter",
    ["Loving Shark"] = "https://tr.rbxcdn.com/180DAY-4d2f17cc22fa7a31f6414b72022163f8/420/420/Image/Png/noFilter",
    ["Luminous Fish"] = "https://tr.rbxcdn.com/180DAY-0355ceedc86250e6096900a663abe398/420/420/Image/Png/noFilter",
    ["Lunar Crescent Fish"] = "https://tr.rbxcdn.com/180DAY-6f336e4fe225a66af90dc3b5e3532598/420/420/Image/Png/noFilter",
    ["Magic Tang"] = "https://tr.rbxcdn.com/180DAY-48bad71b040ec3b759677e090614a621/420/420/Image/Png/noFilter",
    ["Magma Goby"] = "https://tr.rbxcdn.com/180DAY-862aaeb8ce1eb6e427877ff56375e998/420/420/Image/Png/noFilter",
    ["Magma Shark"] = "https://tr.rbxcdn.com/180DAY-890b267e5dacdd20b5564118847109a3/420/420/Image/Png/noFilter",
    ["Mammoth Appafish"] = "https://tr.rbxcdn.com/180DAY-1298f3c861db2a0681e495aaabca376c/420/420/Image/Png/noFilter",
    ["Manoai Statue Fish"] = "https://tr.rbxcdn.com/180DAY-34a6c81f80deb5e6b8fdbbbbb55e1f03/420/420/Image/Png/noFilter",
    ["Manta Ray"] = "https://tr.rbxcdn.com/180DAY-a137177b29fc9400e9a8987495dfc294/420/420/Image/Png/noFilter",
    ["Masked Angelfish"] = "https://tr.rbxcdn.com/180DAY-ef4502fd113fa8b8492a6808e61431cf/420/420/Image/Png/noFilter",
    ["Maze Angelfish"] = "https://tr.rbxcdn.com/180DAY-daec5df9210e0dc084852467347ee0cd/420/420/Image/Png/noFilter",
    ["Megalodon"] = "https://tr.rbxcdn.com/180DAY-4f77aa0bcdcfa908e42bad55c2544b79/420/420/Image/Png/noFilter",
    ["Mistletoe Damsel"] = "https://tr.rbxcdn.com/180DAY-d06f584acce5f930e3c616a0a3a0db81/420/420/Image/Png/noFilter",
    ["Monk Fish"] = "https://tr.rbxcdn.com/180DAY-0b2fb9abf61fd8572667efb1764bfcdb/420/420/Image/Png/noFilter",
    ["Monster Shark"] = "https://tr.rbxcdn.com/180DAY-64489f77e3319c5639d380d34ad871a5/420/420/Image/Png/noFilter",
    ["Moorish Idol"] = "https://tr.rbxcdn.com/180DAY-29b4a0a61460022149f7a1a64fd1347b/420/420/Image/Png/noFilter",
    ["Mosasaur Shark"] = "https://tr.rbxcdn.com/180DAY-bbdfb5e8578a81214175a40239d81d96/420/420/Image/Png/noFilter",
    ["Mossy Fishlet"] = "https://tr.rbxcdn.com/180DAY-f31fcefd641e8e0508653c909f7f91b0/420/420/Image/Png/noFilter",
    ["Mossy Vampire Fish"] = "https://tr.rbxcdn.com/180DAY-12e688deb208396259b9e0d38f47690a/420/420/Image/Png/noFilter",
    ["Narwhal"] = "https://tr.rbxcdn.com/180DAY-76fac69be503eab045676ecb3a1f9675/420/420/Image/Png/noFilter",
    ["Night Glider Fish"] = "https://tr.rbxcdn.com/180DAY-e2fd88292c8bfb56d1f4184afb4f4d2e/420/420/Image/Png/noFilter",
    ["Old Boot"] = "https://tr.rbxcdn.com/180DAY-f2c3d23b9c074a3445431e71d0eb3d3b/420/420/Image/Png/noFilter",
    ["Orange Basslet"] = "https://tr.rbxcdn.com/180DAY-0407fb86e1430511c728a1056772f564/420/420/Image/Png/noFilter",
    ["Orangy Goby"] = "https://tr.rbxcdn.com/180DAY-8e57c3f6433bb8d3eb55d6e247636867/420/420/Image/Png/noFilter",
    ["Orca"] = "https://tr.rbxcdn.com/180DAY-e3d4495262428ed404619d8e6f16d6ec/420/420/Image/Png/noFilter",
    ["Panther Eel"] = "https://tr.rbxcdn.com/180DAY-7909d18f78c0649ac89c3282ee920696/420/420/Image/Png/noFilter",
    ["Panther Grouper"] = "https://tr.rbxcdn.com/180DAY-2ff99a6ddd6c29547418ed42efe20dc9/420/420/Image/Png/noFilter",
    ["Parrot Blopfish"] = "https://tr.rbxcdn.com/180DAY-fcaba0484a41a3fca98513801fac5c61/420/420/Image/Png/noFilter",
    ["Parrot Fish"] = "https://tr.rbxcdn.com/180DAY-f67d5e984641db42a9b1342a00b96bd1/420/420/Image/Png/noFilter",
    ["Patriot Tang"] = "https://tr.rbxcdn.com/180DAY-56845cd7af8bef7601953ded981686de/420/420/Image/Png/noFilter",
    ["Pearl"] = "https://tr.rbxcdn.com/180DAY-2af1d0b64b5c1d2852e24f03aeeb3636/420/420/Image/Png/noFilter",
    ["Pilot Fish"] = "https://tr.rbxcdn.com/180DAY-e78cd99fa3578c02d2ae61b2aefb398d/420/420/Image/Png/noFilter",
    ["Pink Dolphin"] = "https://tr.rbxcdn.com/180DAY-532fc405a2c65beb5d72edf7036ee6ac/420/420/Image/Png/noFilter",
    ["Pink Smith Damsel"] = "https://tr.rbxcdn.com/180DAY-32d61c1721ffba1a4f4ec6218c376ca0/420/420/Image/Png/noFilter",
    ["Pirate Blue Lobster"] = "https://tr.rbxcdn.com/180DAY-406928e51909d3a416980724c43fa681/420/420/Image/Png/noFilter",
    ["Plasma Serpent"] = "https://tr.rbxcdn.com/180DAY-35165b79deef0e6438a21bacf94e288c/420/420/Image/Png/noFilter",
    ["Plasma Shark"] = "https://tr.rbxcdn.com/180DAY-df8340511e5dc93ca0d512ab816397d3/420/420/Image/Png/noFilter",
    ["Primal Axolotl"] = "https://tr.rbxcdn.com/180DAY-defcb3b808eb65a246ba499230b16f21/420/420/Image/Png/noFilter",
    ["Primal Lobster"] = "https://tr.rbxcdn.com/180DAY-c48d68cbeb109b8e6f2576d3b985d922/420/420/Image/Png/noFilter",
    ["Primordial Octopus"] = "https://tr.rbxcdn.com/180DAY-0862650c4b3a47803f935a9438d6303a/420/420/Image/Png/noFilter",
    ["Prismy Seahorse"] = "https://tr.rbxcdn.com/180DAY-20cd61f4ebcd5e49966e10e85f3397a1/420/420/Image/Png/noFilter",
    ["Pufferfish"] = "https://tr.rbxcdn.com/180DAY-1d9aa2f83082fc7787febf6c6887219d/420/420/Image/Png/noFilter",
    ["Pumpkin Angler Fish"] = "https://tr.rbxcdn.com/180DAY-68e7df799253c062bfb1f83d95a7bb61/420/420/Image/Png/noFilter",
    ["Pumpkin Butterfly Fish"] = "https://tr.rbxcdn.com/180DAY-b0bd68f4ca54bbd033e80b2d8686e401/420/420/Image/Png/noFilter",
    ["Pumpkin Carved Shark"] = "https://tr.rbxcdn.com/180DAY-d9a5e9b0f36b0cb8ee102c534910b8c3/420/420/Image/Png/noFilter",
    ["Pumpkin Hermit Crab"] = "https://tr.rbxcdn.com/180DAY-43354094070e8396aae8e4a16c296a29/420/420/Image/Png/noFilter",
    ["Pumpkin Jellyfish"] = "https://tr.rbxcdn.com/180DAY-9c05a7a7b2a631099e1f981cbfe15537/420/420/Image/Png/noFilter",
    ["Pumpkin Ray"] = "https://tr.rbxcdn.com/180DAY-20aab5d1ebe53ded83e1d7f436848077/420/420/Image/Png/noFilter",
    ["Pumpkin StoneTurtle"] = "https://tr.rbxcdn.com/180DAY-b6d4ec90b43ca28d57ca4ceb3293fca6/420/420/Image/Png/noFilter",
    ["Purp Blisfish"] = "https://tr.rbxcdn.com/180DAY-8ef93daeef07d0ce85aac38158f2a471/420/420/Image/Png/noFilter",
    ["Pygmy Goby"] = "https://tr.rbxcdn.com/180DAY-2c9613d1da9a086bc20987d0a720f00f/420/420/Image/Png/noFilter",
    ["Queen Crab"] = "https://tr.rbxcdn.com/180DAY-75f017dc45d893c85ae39873590042b1/420/420/Image/Png/noFilter",
    ["Racoon Butterfly Fish"] = "https://tr.rbxcdn.com/180DAY-426278cd6902fc0a7167a63c54e6c70d/420/420/Image/Png/noFilter",
    ["Red Goatfish"] = "https://tr.rbxcdn.com/180DAY-4bb1259a473be52a5f4ee960cc4a4c09/420/420/Image/Png/noFilter",
    ["Red Snapper"] = "https://tr.rbxcdn.com/180DAY-e2af71a3c503dd40a2cd696ff19cca8b/420/420/Image/Png/noFilter",
    ["Reef Chromis"] = "https://tr.rbxcdn.com/180DAY-b315ecf75c38583064ea733bf67baddb/420/420/Image/Png/noFilter",
    ["Robot Kraken"] = "https://tr.rbxcdn.com/180DAY-489ffa039a70e41ad60d70997ada55ed/420/420/Image/Png/noFilter",
    ["Rockfish"] = "https://tr.rbxcdn.com/180DAY-29214583bd05425377bfb11af6b19d34/420/420/Image/Png/noFilter",
    ["Rockform Cardianl"] = "https://tr.rbxcdn.com/180DAY-17a08c5b13f8b2072e6fd3fc7b68ba39/420/420/Image/Png/noFilter",
    ["Ruby"] = "https://tr.rbxcdn.com/180DAY-91dd82d150765096695084e981e85d6f/420/420/Image/Png/noFilter",
    ["Runic Axolotl"] = "https://tr.rbxcdn.com/180DAY-a8dd2c9311bbd6e87a6f4b68ad72cb3c/420/420/Image/Png/noFilter",
    ["Runic Lobster"] = "https://tr.rbxcdn.com/180DAY-8739101638bf5dbad9f8f524741224c9/420/420/Image/Png/noFilter",
    ["Runic Sea Crustacean"] = "https://tr.rbxcdn.com/180DAY-5732559dcad98e66b268dda79cd4a555/420/420/Image/Png/noFilter",
    ["Runic Squid"] = "https://tr.rbxcdn.com/180DAY-0388d0df5b5a7c6841b432c9249447dd/420/420/Image/Png/noFilter",
    ["Runic Wispeye"] = "https://tr.rbxcdn.com/180DAY-940835db405c27a24beb37d75833fec9/420/420/Image/Png/noFilter",
    ["Sacred Guardian Squid"] = "https://tr.rbxcdn.com/180DAY-5fb306e110387854469c07124bb8e2d8/420/420/Image/Png/noFilter",
    ["Sail Fish"] = "https://tr.rbxcdn.com/180DAY-2daaeaddb25e14f505da5834dc348f8a/420/420/Image/Png/noFilter",
    ["Sail Tang"] = "https://tr.rbxcdn.com/180DAY-891a31f2c455038711cbb29a9b1f3a42/420/420/Image/Png/noFilter",
    ["Salmon"] = "https://tr.rbxcdn.com/180DAY-09df6a443e853b6f233cb9b73e93accd/420/420/Image/Png/noFilter",
    ["Saw Fish"] = "https://tr.rbxcdn.com/180DAY-62776cfef37b3189c84f3f29c5530c7a/420/420/Image/Png/noFilter",
    ["Scare"] = "https://tr.rbxcdn.com/180DAY-681f78926850a4c4fa9c784bd61ea392/420/420/Image/Png/noFilter",
    ["Scary Clownfish"] = "https://tr.rbxcdn.com/180DAY-32bd7e20b605d131276ff3761c04300e/420/420/Image/Png/noFilter",
    ["Scissortail Dartfish"] = "https://tr.rbxcdn.com/180DAY-329000eac96196715bd941188b340536/420/420/Image/Png/noFilter",
    ["Sea Crustacean"] = "https://tr.rbxcdn.com/180DAY-030ff045c8ccceca1c0b19b24201e1a8/420/420/Image/Png/noFilter",
    ["Sea Shell"] = "https://tr.rbxcdn.com/180DAY-fd367ad818f0e73a8c8d990698e9a03e/420/420/Image/Png/noFilter",
    ["Sharp One"] = "https://tr.rbxcdn.com/180DAY-3862add6dcf806cbed83baa83de95e5c/420/420/Image/Png/noFilter",
    ["Sheepshead Fish"] = "https://tr.rbxcdn.com/180DAY-50f5dfa0a3b5f2fc3ac9c72b1a7a3ab3/420/420/Image/Png/noFilter",
    ["Shrimp Goby"] = "https://tr.rbxcdn.com/180DAY-0b6062130e17786de20fd30530065029/420/420/Image/Png/noFilter",
    ["Silver Tuna"] = "https://tr.rbxcdn.com/180DAY-4cc10f5473b0ae3c84e6381a629a5f64/420/420/Image/Png/noFilter",
    ["Skeleton Angler Fish"] = "https://tr.rbxcdn.com/180DAY-5b3243d6b09a644b131c7020c515e072/420/420/Image/Png/noFilter",
    ["Skeleton Fish"] = "https://tr.rbxcdn.com/180DAY-aada1bbfc99b18c35f0f70256a35a1c6/420/420/Image/Png/noFilter",
    ["Skeleton Narwhal"] = "https://tr.rbxcdn.com/180DAY-c7d7f5f265fb857bfe91cc9692747dac/420/420/Image/Png/noFilter",
    ["Skunk Tilefish"] = "https://tr.rbxcdn.com/180DAY-6648a92607bb3b350c1f2c17e818fb8f/420/420/Image/Png/noFilter",
    ["Slurpfish Chromis"] = "https://tr.rbxcdn.com/180DAY-de9a26825d02c82ca1fb1c705db1181a/420/420/Image/Png/noFilter",
    ["Sona Fin Fish"] = "https://tr.rbxcdn.com/180DAY-c8012125ddf53e061fbd9f355e21027a/420/420/Image/Png/noFilter",
    ["Spear Guardian"] = "https://tr.rbxcdn.com/180DAY-45249f9d3f40e7fd18802c78ca967dca/420/420/Image/Png/noFilter",
    ["Specked Butterfly"] = "https://tr.rbxcdn.com/180DAY-520afb574e3a3b27212891d3b8360ef4/420/420/Image/Png/noFilter",
    ["Spooky Koi Fish"] = "https://tr.rbxcdn.com/180DAY-b0c36bf620ca1855dc32269df2db3ceb/420/420/Image/Png/noFilter",
    ["Spooky Peafish"] = "https://tr.rbxcdn.com/180DAY-42d4a7fed429f37a475f118d9940ec73/420/420/Image/Png/noFilter",
    ["Spotted Lantern Fish"] = "https://tr.rbxcdn.com/180DAY-b82ebc0545d9cfed0bc05f4cbf0bed31/420/420/Image/Png/noFilter",
    ["Starfish"] = "https://tr.rbxcdn.com/180DAY-6b3bfdb0bc76b81161d7677c756382b7/420/420/Image/Png/noFilter",
    ["Starjam Tang"] = "https://tr.rbxcdn.com/180DAY-6c54b0cb433210c0c1f04d5a56c627ec/420/420/Image/Png/noFilter",
    ["Starlight Crab"] = "https://tr.rbxcdn.com/180DAY-5695fe06e624a865c58fc8dd8e593e31/420/420/Image/Png/noFilter",
    ["Starlight Manta Ray"] = "https://tr.rbxcdn.com/180DAY-0e45af5b857194a5eff1cfec5adaba6d/420/420/Image/Png/noFilter",
    ["Strawberry Dotty"] = "https://tr.rbxcdn.com/180DAY-746e7ff3c82be31f3052d4cea60ac7f9/420/420/Image/Png/noFilter",
    ["Strippled Seahorse"] = "https://tr.rbxcdn.com/180DAY-1706db31b90da486f3046e9f844c781e/420/420/Image/Png/noFilter",
    ["Super Enchant Stone"] = "https://tr.rbxcdn.com/180DAY-6214f7112b49a6b1cabf0b15bbb3c2f2/420/420/Image/Png/noFilter",
    ["Sushi Cardinal"] = "https://tr.rbxcdn.com/180DAY-7089dc115fb99b870f986c9953d6a0ed/420/420/Image/Png/noFilter",
    ["Swordfish"] = "https://tr.rbxcdn.com/180DAY-c42739e083166713fc660a008cddf094/420/420/Image/Png/noFilter",
    ["Synodontis"] = "https://tr.rbxcdn.com/180DAY-3f8e3373fcbfd4d2f75afe1d2c0adafc/420/420/Image/Png/noFilter",
    ["Talon Serpent"] = "https://tr.rbxcdn.com/180DAY-941fe7a348c160449eec612d16c2ec0c/420/420/Image/Png/noFilter",
    ["Temple Spokes Tuna"] = "https://tr.rbxcdn.com/180DAY-d6782074667b84e2729d2383f11bbe29/420/420/Image/Png/noFilter",
    ["Thinkler Fish"] = "https://tr.rbxcdn.com/180DAY-0ed7798f532f7c20c8e4ad87d3407b49/420/420/Image/Png/noFilter",
    ["Thin Armor Shark"] = "https://tr.rbxcdn.com/180DAY-11649b435ccc75c49b95e85f5e3d6011/420/420/Image/Png/noFilter",
    ["Thresher Shark"] = "https://tr.rbxcdn.com/180DAY-a15c4b59ace69f2e43e8deea391dde15/420/420/Image/Png/noFilter",
    ["Toothy Fish"] = "https://tr.rbxcdn.com/180DAY-5117d9761e022c249641dce513f677b2/420/420/Image/Png/noFilter",
    ["Toxic Jellyfish"] = "https://tr.rbxcdn.com/180DAY-5b265f14602f0de9e472ef24afce7b0c/420/420/Image/Png/noFilter",
    ["Traffic Cone Fish"] = "https://tr.rbxcdn.com/180DAY-884a79447d72e0cde3aad6c34ce32d3e/420/420/Image/Png/noFilter",
    ["Tricolore Butterfly"] = "https://tr.rbxcdn.com/180DAY-062cc6425cecb6e1ec332ca05a51f8a5/420/420/Image/Png/noFilter",
    ["Unicorn Tang"] = "https://tr.rbxcdn.com/180DAY-5deb7e6fd454ded00d4a29c7dafb97f0/420/420/Image/Png/noFilter",
    ["Vampire Squid"] = "https://tr.rbxcdn.com/180DAY-833e0587f6e34770e3ee53a2935facf3/420/420/Image/Png/noFilter",
    ["Vintage Blue Tang"] = "https://tr.rbxcdn.com/180DAY-e5ee60e135546724798100230b34d0fa/420/420/Image/Png/noFilter",
    ["Vintage Damsel"] = "https://tr.rbxcdn.com/180DAY-a874d76e51f26689203efde8a3c960f4/420/420/Image/Png/noFilter",
    ["Viperangler Fish"] = "https://tr.rbxcdn.com/180DAY-7577325f76b1a3a19f80d7944146b75f/420/420/Image/Png/noFilter",
    ["Viperfish"] = "https://tr.rbxcdn.com/180DAY-2569bbc21d90fbbff503ef8074da1716/420/420/Image/Png/noFilter",
    ["Volcanic Basslet"] = "https://tr.rbxcdn.com/180DAY-2e248d6b9579b0f85abb33215df59ada/420/420/Image/Png/noFilter",
    ["Volsail Tang"] = "https://tr.rbxcdn.com/180DAY-0680241eb4a177b5f004f0e77845bacb/420/420/Image/Png/noFilter",
    ["Wahoo"] = "https://tr.rbxcdn.com/180DAY-dab4735aff2316fa8c7072b128c91fda/420/420/Image/Png/noFilter",
    ["Watanabei Angelfish"] = "https://tr.rbxcdn.com/180DAY-2d53f544e5d03ea123c65c0dec63d744/420/420/Image/Png/noFilter",
    ["Water Snake"] = "https://tr.rbxcdn.com/180DAY-5a5060a492d98c9e5c8305ba5454ca6a/420/420/Image/Png/noFilter",
    ["Waveback Fish"] = "https://tr.rbxcdn.com/180DAY-4b6df495d0dfeada6b3f61e58ee408a4/420/420/Image/Png/noFilter",
    ["White Clownfish"] = "https://tr.rbxcdn.com/180DAY-c987ce7b6c003d42fc72a7e8a40a1975/420/420/Image/Png/noFilter",
    ["White Tang"] = "https://tr.rbxcdn.com/180DAY-0f6d3b31451f8c552a290861876ae0c0/420/420/Image/Png/noFilter",
    ["Wild Serpent"] = "https://tr.rbxcdn.com/180DAY-7a67cc1042a3d44268057c1c0bac2c13/420/420/Image/Png/noFilter",
    ["Wing Parrotfish"] = "https://tr.rbxcdn.com/180DAY-4eaa93d760feadd7960061d7c9382e63/420/420/Image/Png/noFilter",
    ["Witch Fish"] = "https://tr.rbxcdn.com/180DAY-229a26f5a3742fb755c2fb3b005a64e3/420/420/Image/Png/noFilter",
    ["Witch Koi Fish"] = "https://tr.rbxcdn.com/180DAY-0fdc07ff93e5a103c9db460a40045861/420/420/Image/Png/noFilter",
    ["Wizard Stingray"] = "https://tr.rbxcdn.com/180DAY-eaa6b6549d6e57000feca30d82806c25/420/420/Image/Png/noFilter",
    ["Worm Fish"] = "https://tr.rbxcdn.com/180DAY-7299ff7cfe763fc20a4ad726678c8059/420/420/Image/Png/noFilter",
    ["Wraithfin Abyssal"] = "https://tr.rbxcdn.com/180DAY-8b9ee785e3fceb13e1db5e16be282608/420/420/Image/Png/noFilter",
    ["Yellowfin Tuna"] = "https://tr.rbxcdn.com/180DAY-e35d0e0b952974d14d1811fbee00dd20/420/420/Image/Png/noFilter",
    ["Yellowstate Angelfish"] = "https://tr.rbxcdn.com/180DAY-e2197698577788cfd3e823f916435c76/420/420/Image/Png/noFilter",
    ["Yello Damselfish"] = "https://tr.rbxcdn.com/180DAY-6df8612810bc11c4d9b8a4502bf42325/420/420/Image/Png/noFilter",
    ["Zebra Snakehead"] = "https://tr.rbxcdn.com/180DAY-647b05081af0c19e7d4664e391325d74/420/420/Image/Png/noFilter",
    ["Zombie Megalodon"] = "https://tr.rbxcdn.com/180DAY-749e1b19f00c8c2e2ea7c53a69ff981b/420/420/Image/Png/noFilter",
    ["Zombie Shark"] = "https://tr.rbxcdn.com/180DAY-b14df5d94402e2626876f48525c838d3/420/420/Image/Png/noFilter",
    ["Zoster Butterfly"] = "https://tr.rbxcdn.com/180DAY-03b6562241eec55c6353f6d9b1edc03a/420/420/Image/Png/noFilter",
}

local TIER_MAP = {
    [6] = "Mythic",
    [7] = "SECRET"
}

local TIER_COLORS = {
    [6] = 16711680,
    [7] = 65535
}

local TIER_EMOJI = {
    [6] = "🔴",
    [7] = "🟦"
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
    
    print("[FishIT] 📊 Loading Mythic+ fish database...")
    
    for _, mod in ipairs(items:GetChildren()) do
        if mod:IsA("ModuleScript") then
            local ok, data = pcall(require, mod)
            if ok and data and data.Data then
                local name = data.Data.Name
                local tier = data.Data.Tier
                
                -- HANYA MYTHIC (6) & SECRET (7)
                if name and tier and tier >= 6 and tier <= 7 then
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
    
    print(string.format("[FishIT] ✅ Loaded %d Mythic+ fish", loadedCount))
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
print("[FishIT] 🎣 FISH IT LOGGER V11.0")
print("[FishIT] ✅ MYTHIC & SECRET ONLY")
print("[FishIT] ========================================")
print("[FishIT] 📊 Loading database...")

loadDatabase()
task.wait(0.5)

local coveragePercent = loadedCount > 0 and math.floor((thumbnailCount / loadedCount) * 100) or 0

print(string.format("[FishIT] ✓ Database: %d Mythic+ fish loaded", loadedCount))
print(string.format("[FishIT] ✓ Thumbnails: %d fish (%d%% coverage)", thumbnailCount, coveragePercent))
print("[FishIT] ✓ Filter: MYTHIC & SECRET ONLY")
print("[FishIT] ✓ Smart mutation detection enabled")
print("[FishIT] 🚀 Starting real-time monitor...")

startMonitor()

task.wait(1)
sendWebhook(
    "✅ Fish IT Logger Started",
    "**v11.0 - Mythic & Secret Only!**\n🚀 Event-driven, no loops\n✨ Smart mutation detection\n🔴 Mythic • 🟦 SECRET",
    {
        {name = "📊 Database", value = tostring(loadedCount) .. " Mythic+ fish", inline = true},
        {name = "🎯 Filter", value = "Tier 6-7 Only", inline = true},
        {name = "🖼️ Thumbnails", value = string.format("✅ %d fish (%d%%)", thumbnailCount, coveragePercent), inline = true}
    },
    16711680
)

print("[FishIT] ========================================")
print("[FishIT] ✅ READY! Monitoring Mythic+ catches...")
print("[FishIT] ========================================")
