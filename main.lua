-- This script is now working and server-sided. Made for Just a Basepalte only.
-- this took me too long to port, fixing errors and lots of changes commiting...
-- anyways enjoy

if not game.IsLoaded then
    game.Loaded:Wait()
end

local function sendCommand(command)
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(command)
    wait(2)
    print("sent command: " .. command)
end

wait(2)
sendCommand("Reserved on top. Status: Private, friends-only")
wait(2)
sendCommand("-r6")
sendCommand("-gh 11748356,19027209")

wait(3)

print("=== READ THIS ===")
print("When CurrentAngle loads:")
print("1. Click 'Take me there'")
print("2. Wait 10 seconds for reanimation")
print("3. CurrentAngle will handle appearing dead")
print("4. Dance script will load (character stays movable)")
print("5. Then -net will be sent")
print("=== NO SCRIPT-BASED DEATH - CurrentAngle handles it ===")

local settings = {
    ["Use default animations"] = true,
    ["Fake character transparency level"] = 1,
    ["Disable character scripts"] = false,
    ["Fake character should collide"] = true,
    ["Parent real character to fake character"] = false,
    ["Respawn character"] = true,
    ["Instant respawn"] = false,
    ["Hide HumanoidRootPart"] = false,
    ["PermaDeath fake character"] = true,  -- THIS makes fake character appear dead
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
    
    -- NO SCRIPT-BASED DEATH - CurrentAngle's setting handles it
    print("CurrentAngle handling permanent death appearance...")
    
    -- Just teleport to center to prevent falling
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
