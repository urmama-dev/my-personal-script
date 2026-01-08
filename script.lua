local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "Leo31374Notifier"
screenGui.ResetOnSpawn = false
screenGui.Parent = script.Parent

local function showNotification(text, isJoin)
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(0, 300, 0, 60)
	label.Position = UDim2.new(1, 0, 1, -80)
	label.BackgroundColor3 = isJoin and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(231, 76, 60)
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.Text = text
	label.Font = Enum.Font.GothamBold
	label.TextSize = 18
	label.TextWrapped = true
	label.BorderSizePixel = 0
	label.Parent = screenGui
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = label
	
	local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	
	local slideIn = TweenService:Create(label, tweenInfo, {
		Position = UDim2.new(1, -320, 1, -80)
	})
	slideIn:Play()
	
	task.wait(3.5)
	
	local slideOut = TweenService:Create(label, tweenInfo, {
		Position = UDim2.new(1, 0, 1, -80)
	})
	slideOut:Play()
	slideOut.Completed:Wait()
	
	label:Destroy()
end

local function checkForLeo()
	for _, player in pairs(Players:GetPlayers()) do
		if player.Name == "Leo31374" then
			return true
		end
	end
	return false
end

if checkForLeo() then
	showNotification("Leo31374 is in this game!", true)
end

Players.PlayerAdded:Connect(function(player)
	if player.Name == "Leo31374" then
		showNotification("Leo31374 is in this game!", true)
	end
end)

Players.PlayerRemoving:Connect(function(player)
	if player.Name == "Leo31374" then
		showNotification("Leo31374 has left", false)
	end
end)

-- ImA_Programmer404 waz here
