-- WHATS UP GUYS
-- NotKrystalDance has been fixed and works CORRECTLY!
-- Enjoy the dancing experience.
-- This works for Just a Baseplate only. You have been warned.

if not game.IsLoaded then
    game.Loaded:Wait()
end

local function sendCommand(command)
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(command)
    wait(2)
    print("sent command: " .. command)
end

wait(2)
sendCommand("Made by Reserved. Status: Private and accessible for friends only.")
wait(2)
sendCommand("-r6")

wait(3)

print("=== READ THIS ===")
print("When CurrentAngle loads:")
print("1. Click 'Take me there'")
print("2. Wait 10 seconds for reanimation")
print("3. Done")

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

wait(2)

if danceSuccess then
    print("dance script loaded successfully")
    print("executing final commands...")
    
    sendCommand("-ch")
    sendCommand("-gh 11748356,19027209")
    sendCommand("-net")
    
    print("finished")
    sendCommand("script executed, enjoy. reserved on top")
else
    print("failed: " .. tostring(danceError))
    sendCommand("script failed to load...")
end

game.StarterGui:SetCore("SendNotification", {
    Title = "Finished",
    Text = "pray this works bro",
    Duration = 5
})
