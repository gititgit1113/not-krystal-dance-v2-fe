if not game.IsLoaded then
    game.Loaded:Wait()
end

local function sendCommand(command)
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(command)
    wait(2)
    print("sent command: " .. command)
end

wait(2)
sendCommand("Script is being fixed. You can still use it though. -Reserved")
wait(2)
sendCommand("-r6")
sendCommand("-gh 11748356,19027209")
sendCommand("-net")

wait(3)

print("=== READ THIS ===")
print("When CurrentAngle loads:")
print("1. Click 'Take me there'")
print("2. It will kill your character and start countdown")
print("3. Wait for reanimation to finish (10 seconds)")
print("4. Character will be teleported to center after reanimation")
print("=== STAY STILL ===")

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
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 5, 0)
        wait(1)
    end
else
    print("failed to reanimate character: " .. tostring(error))
    sendCommand("reanimation failed")
end

wait(4)

print("dancing time")
local danceSuccess, danceError = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TheRareOcelot/roblox-fe-scripts/refs/heads/main/krystal%20dance", true))()
end)

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
