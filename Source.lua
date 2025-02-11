local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))() 
local Window = Library.CreateLib("Tupoi's DOORS Mode Loader, v0.6", "DarkTheme") 
local ModesTab = Window:NewTab("Modes") 
 
-- Modes Setup 
 
local HotelPlus = ModesTab:NewSection("Hotel+ Modes") 
HotelPlus:NewButton("Load Hardcore", "Loads Hardcore mode fixed by DripCapybara.", function() 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/DripCapybara/Doors-Mode-Remakes/refs/heads/main/HardcoreFixed.lua"))() 
end) 
 
HotelPlus:NewButton("Load Immersive", "Loads Immersive mode by LocalPlayer.", function() 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/localplayerr/Doors-stuff/refs/heads/main/Immersive%20mode/Main%20Script"))() 
end) 
 
HotelPlus:NewButton("Load Creepy", "Loads Creepy mode by Chrono.", function() 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/DripCapybara/Doors-Modes/refs/heads/main/CreepyMode/ObfuscatedMain.lua"))() 
end) 
 
HotelPlus:NewButton("Load Horror", "Loads Horror mode by Chrono.", function() 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAcceleration/Comet-Development/refs/heads/main/Doors/Game/Horror.lua"))() 
end) 
 
-- Hotel- 
 
local OldHotel = Window:NewTab("Hotel-") 
local HotelMinus = OldHotel:NewSection("Hotel- Modes") 
 
HotelMinus:NewButton("Load Old Hardcore", "Loads Hardcore mode remake by LocalPlayer", function() 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/localplayerr/Doors-stuff/refs/heads/main/Hardcore%20v4%20recreate/main%20code"))() 
end)
 
-- Misc. 
 
local MiscTab = Window:NewTab("Misc") 
local MiscSection = MiscTab:NewSection("Misc") 
 
MiscSection:NewButton("Load Flashlight", "Modded by Me, Tupoi", function() 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Tupoi-Scripts/wrong_Hotel-Mode/refs/heads/main/FlashlightUpdated.lua"))() 
end)

-- Entity Spawner

local ESTab = Window:NewTab("Custom Entities")
local EntitySection = ESTab:NewSection("Entities")

EntitySection:NewButton("Rush *AFTER CLICK, CHECK CONSOLE. F9", "just a rush", function() 
    print("wait for 0.7 / 0.7+ brou.") 
end)

-- Custom Room loader

local CRTab = Window:NewTab("Custom Rooms")
local RoomSection = CRTab:NewSection("Rooms")

RoomSection:NewButton("Mysterious Room", "by Me, Have fun!", function() 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TupoiRomcha/ModesLoader/blob/main/Custom%20Rooms/CustomRoom01.lua"))() 
end)

RoomSection:NewButton("Storage Room", "by TotallyNotChrono, Have fun!", function() 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TupoiRomcha/ModesLoader/blob/main/Custom%20Rooms/CR02_Chrono.lua"))() 
end)

-- Entity Spawner

local CITab = Window:NewTab("Custom Items")
local ItemsSection = CITab:NewSection("Items")

ItemsSection:NewButton("Stick *WHAT?*", "just a minecraft stick.", function() 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/K0t1n/Public/main/Debug%20Stick"))()
end)

ItemsSection:NewButton("Chocolate", "yummy.", function() 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/K0t1n/Public/main/Chocolate%20Bar.lua"))()
end)

ItemsSection:NewButton("Guiding Candle", "useless", function() 
    loadstring(game:HttpGet("https://pastebin.com/raw/88zSdYmA"))()
end)
