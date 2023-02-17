local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
local aimbot = true
 
function getClosestPart()
    local closestPlayer
    local closestDistance = math.huge
    for i,v in pairs(game.Players:GetPlayers()) do
        if v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
            local dist = (v.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).magnitude
            if dist < closestDistance then
                closestDistance = dist
                closestPlayer = v
            end
        end
    end
    if closestPlayer then
        local bodyParts = {"Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg"}
        return closestPlayer.Character[bodyParts[math.random(1, #bodyParts)]]
    end
end
 
function aimAt(part)
    local position = camera:WorldToScreenPoint(part.Position)
    mousemoverel(position.x - mouse.X, position.y - mouse.Y)
end
 
function onKeyPress(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.Y then
        aimbot = not aimbot
    end
end
 
game:GetService("UserInputService").InputBegan:Connect(onKeyPress)
 
while true do
    if aimbot then
        local aimPart = getClosestPart()
        if aimPart then
            aimAt(aimPart)
        end
    end
    wait()
end
