-- on testing..

if not game.IsLoaded then
    game.Loaded:Wait()
end

local function sendCommand(command)
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(command)
    wait(2)
    print("sent command: " .. command)
end

wait(2)
sendCommand("made by Reserved! status: private")
wait(2)
sendCommand("-r6")
sendCommand("-gh 11748356,19027209")

wait(3)

print("=== READ THIS ===")
print("When CurrentAngle loads:")
print("1. Click 'Take me there'")
print("2. Wait 10 seconds for reanimation")
print("3. Character health set to 0 (appears dead)")
print("4. But character remains movable for dance")
print("5. Dance script will load")
print("6. Then -net will be sent")
print("=== IMPORTANT: DANCE REQUIRES REANIMATION ===")

local settings = {
    ["Use default animations"] = true,
    ["Fake character transparency level"] = 1,
    ["Disable character scripts"] = false,
    ["Fake character should collide"] = true,
    ["Parent real character to fake character"] = false,
    ["Respawn character"] = true,
    ["Instant respawn"] = false,
    ["Hide HumanoidRootPart"] = false,
    ["PermaDeath fake character"] = false,
    ["R15 Reanimate"] = false,
    ["Click Fling"] = false,
    ["Anti-Fling"] = true,
    ["Hide RootPart Distance"] = CFrame.new(255, 255, 0),
    ["Names to exclude from transparency"] = {}
}

print("currentangle v4")
local success, error = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/v4.lua"))()
end)

wait(12)

if success then
    print("reanimation finished")
    
    -- APPEAR DEAD BUT STILL MOVABLE
    print("setting character to appear dead but movable...")
    local player = game.Players.LocalPlayer
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            -- Set health to 0 to appear dead
            humanoid.Health = 0
            
            -- IMPORTANT: Keep joints intact so dance script can move character
            -- DO NOT use character:BreakJoints()
            
            -- Make sure character can still be controlled
            humanoid:ChangeState(Enum.HumanoidStateType.Physics)
            
            -- Optional: Remove dead ragdoll effects
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    -- Keep parts movable for dance animations
                    part.Anchored = false
                    part.CanCollide = true
                end
            end
            
            print("character appears dead (health=0) but remains movable")
        end
    end
    
    -- Teleport to center to prevent falling
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = CFrame.new(0, 5, 0)
        wait(1)
    end
else
    print("failed to reanimate character: " .. tostring(error))
    sendCommand("reanimation failed")
end

wait(4)

print("loading krystal dance v2")
local danceSuccess, danceError = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/gititgit1113/not-krystal-dance-v2-fe/refs/heads/main/KrystalDance.lua", true))()
end)

wait(2)

sendCommand("-net")

if danceSuccess then
    print("finished")
    sendCommand("script execution finished")
else
    print("failed: " .. tostring(danceError))
    sendCommand("script failed to load")
end

game.StarterGui:SetCore("SendNotification", {
    Title = "Finished",
    Text = "pray this works bro",
    Duration = 5
})
