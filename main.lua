-- Reserved on top
-- enjoy


if not game.IsLoaded then
    game.Loaded:Wait()
end

local function sendCommand(command)
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(command)
    wait(2)
    print("sent command: " .. command)
end

wait(2)
sendCommand("private script made by Reserved. script on testing so dont say its a bad script")
wait(2)
sendCommand("-r6")
sendCommand("-gh 11748356,19027209")
sendCommand("-net")
sendCommand("-pd")

wait(3)

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

if success then
    print("reanimation finished")
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
