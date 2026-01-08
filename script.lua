-- Place this in StarterGui as a LocalScript

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "Leo31374Notifier"
screenGui.ResetOnSpawn = false
screenGui.Parent = script.Parent

-- Function to create and animate notification
local function showNotification(text, isJoin)
	-- Create TextLabel
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(0, 300, 0, 60)
	label.Position = UDim2.new(1, 0, 1, -80) -- Start off-screen to the right
	label.BackgroundColor3 = isJoin and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(231, 76, 60)
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.Text = text
	label.Font = Enum.Font.GothamBold
	label.TextSize = 18
	label.TextWrapped = true
	label.BorderSizePixel = 0
	label.Parent = screenGui
	
	-- Add rounded corners
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = label
	
	-- Tween info (smooth animation)
	local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	
	-- Slide in
	local slideIn = TweenService:Create(label, tweenInfo, {
		Position = UDim2.new(1, -320, 1, -80)
	})
	slideIn:Play()
	
	-- Wait 3 seconds
	task.wait(3.5)
	
	-- Slide out
	local slideOut = TweenService:Create(label, tweenInfo, {
		Position = UDim2.new(1, 0, 1, -80)
	})
	slideOut:Play()
	slideOut.Completed:Wait()
	
	-- Cleanup
	label:Destroy()
end

-- Function to check if Leo31374 is in game
local function checkForLeo()
	for _, player in pairs(Players:GetPlayers()) do
		if player.Name == "Leo31374" then
			return true
		end
	end
	return false
end

-- Check on script start
if checkForLeo() then
	showNotification("Leo31374 is in this game!", true)
end

-- Monitor player joins
Players.PlayerAdded:Connect(function(player)
	if player.Name == "Leo31374" then
		showNotification("Leo31374 is in this game!", true)
	end
end)

-- Monitor player leaves
Players.PlayerRemoving:Connect(function(player)
	if player.Name == "Leo31374" then
		showNotification("Leo31374 has left", false)
	end
end)
