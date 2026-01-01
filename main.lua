if not game.IsLoaded then
    game.Loaded:Wait()
end

local function sendCommand(command)
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(command)
    print("sent command: " .. command)
end

wait(2)
sendCommand("by Reserved. private/friends-only")
wait(2)
sendCommand("-r6")

wait(3)

print("=== READ THIS ===")
print("When CurrentAngle loads:")
print("1. Click 'Take me there'")
print("2. Wait 10 seconds for reanimation")
print("3. CurrentAngle will handle appearing dead")
print("4. Dance script will load")
print("5. After dance loads: -net, then -ch, then -gh")
print("6. Done!")

local settings = {
    ["Use default animations"] = true,
    ["Fake character transparency level"] = 1,
    ["Disable character scripts"] = false,
    ["Fake character should collide"] = true,
    ["Parent real character to fake character"] = false,
    ["Respawn character"] = true,
    ["Instant respawn"] = false,
    ["Hide HumanoidRootPart"] = false,
    ["PermaDeath fake character"] = true,
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
    
    local player = game.Players.LocalPlayer
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = CFrame.new(0, 5, 0)
        wait(1)
        print("teleported to center")
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

if danceSuccess then
    print("dance script loaded successfully")
    
    -- Send -net IMMEDIATELY when dance script loads (after 0.5 seconds)
    wait(0.5)
    sendCommand("-net")
    
    -- Clear hats immediately after -net
    sendCommand("-ch")
    
    -- Wait 0.8 seconds then get hats
    wait(0.8)
    sendCommand("-gh 11748356,19027209")
    
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
