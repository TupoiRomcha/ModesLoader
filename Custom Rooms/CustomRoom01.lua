--[[
Chronooo - Comet Devblvopement :3

CONFIGURATION:
_G.CUSTOMROOMMODEL = NUMBER ID
_G.CUSTOMROOMDOOR = NUMBER ID
_G.CUSTOMCRATELOADSTRING = LOADSTRING URL (STRING)
_G.CUSTOMCRATEDIALOGUE = STRING OF TEXT "Hello!"
--]]

print("Loading, if you checking console. SIGMA!1!")
wait(1)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Room = loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAcceleration/Comet-Development/refs/heads/main/Doors/Utility/CustomRoomGenerator.lua"))()
local Caption = ReplicatedStorage.Bricks.Caption
local TriggerCrateOnce = false

if not _G.CUSTOMROOMMODEL then
    _G.CUSTOMROOMMODEL = "95732019995396"
end

if not _G.CUSTOMDOORMODEL then
    _G.CUSTOMDOORMODEL = "138652282902565"
end

function ReturnLatestRoom()
    return workspace.CurrentRooms:FindFirstChild(game.ReplicatedStorage.GameData.LatestRoom.Value)
end

function FixRoomPoint(Point)
    if Point:IsA("BasePart") then
        Point.Size = Vector3.new(5, 8, 0.5)
        Point.Orientation += Vector3.new(0, 180, 0)
        Point.CFrame *= CFrame.new(0, 0, -1)
        Point.Name = "PointRoomFix"
        return Point
    end
end

function GenerateRoom(Point)
    local room = Room.new(_G.CUSTOMROOMMODEL, _G.CUSTOMDOORMODEL, Point, "CustomRoom")
    
    room:AddOpenCallback(function()
        local CustomRoom = room.roomModel
        local Prompts = CustomRoom.Prompts
        if not Prompts then print("cant find prompts") return end

        task.spawn(function()
            firesignal(Caption.OnClientEvent, true, "What is this room?")
            task.wait(3)
            firesignal(Caption.OnClientEvent, true, "...")
        end)

        local function GetPrompt(name)
            local promptObj = Prompts:FindFirstChild(name)
            if not promptObj then
                warn(name.." not found")
                return nil
            end
            return promptObj.Value
        end

        local CrateRealPrompt = GetPrompt("CratePrompt")
        local BedRealPrompt = GetPrompt("BedPrompt")
        local PaintingRealPrompt = GetPrompt("Painting")
        local VentRealPrompt = GetPrompt("VentPrompt")

        if VentRealPrompt then
            VentRealPrompt.Triggered:Connect(function()
                print"vent"
                firesignal(Caption.OnClientEvent, true, "This vent is full of dust, and it wont budge open.")
            end)
        end

        if PaintingRealPrompt then
            PaintingRealPrompt.Triggered:Connect(function()
                print"painting"
                firesignal(Caption.OnClientEvent, true, "This looks... odd.")
            end)
        end

        if BedRealPrompt then
            BedRealPrompt.Triggered:Connect(function()
                print"bed"
                firesignal(Caption.OnClientEvent, true, "No way! I am not hiding in there. Besides, why do I need to?")
            end)
        end

        if CrateRealPrompt then
            CrateRealPrompt.Triggered:Connect(function()
                if TriggerCrateOnce then return end
                TriggerCrateOnce = true
                print"crate"
                firesignal(Caption.OnClientEvent, true, _G.CUSTOMCRATEDIALOGUE)
                loadstring(game:HttpGet(_G.CUSTOMCRATELOADSTRING))()
            end)
        end
    end)
    
    room:Generate()
end

function CheckRoom(Room)
    if Room:FindFirstChild("RandomDoor") then
        local Doors = Room:FindFirstChild("RandomDoor"):GetChildren()
        
        if #Doors > 0 then
            local ChosenPoint = Doors[#Doors > 1 and math.random(1, #Doors) or 1]
            local NewPoint = FixRoomPoint(ChosenPoint)
            if NewPoint then
                GenerateRoom(NewPoint)
            end
        end
    end
end

game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()
    task.wait(0.1)
    local latestRoom = ReturnLatestRoom()
    if latestRoom then
        CheckRoom(latestRoom)
    end
end)

print("Loaded!")
