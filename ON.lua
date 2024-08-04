local IsDisabled = true
local IsTeamCheckEnabled = false 

game:GetService('RunService').RenderStepped:Connect(function()
    if IsDisabled then
        local localPlayer = game:GetService('Players').LocalPlayer
        if not localPlayer then return end
        
        local localPlayerTeam = localPlayer.Team
        
        for _, player in ipairs(game:GetService('Players'):GetPlayers()) do
            if player ~= localPlayer and (not IsTeamCheckEnabled or player.Team ~= localPlayerTeam) then
                local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    humanoidRootPart.Size = Vector3.new(50, 50, 50)
                    humanoidRootPart.Transparency = 0.42
                    humanoidRootPart.BrickColor = BrickColor.new("Really red")
                    humanoidRootPart.Material = Enum.Material.Neon
                    humanoidRootPart.CanCollide = false
                end
            end
        end
    end
end)
