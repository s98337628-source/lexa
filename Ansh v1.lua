-- ANSH V1 HUB
-- Roblox Studio - LocalScript

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local running = false
local selectedStyle = 1

local presets = {
    "@@@@@@@@@@@@@1_@@@@@@@@@@@@[TARGET] TMKX TPA TPA@@@@@@#@###@@@@@@@@@@@@@@@@@@@@@@@@@@@@",

    "/_/_/_/_/_/_/_/_/£/_//__///_/£/£/£//£/£/£/£/£/£££/£/_/_/_/_//_/_/_/_/_//_/_/_//__/[TARGET] TBKX SIL DU? /_/😁_/_/_/_/_/_/_/_//_/_/_//_/_/_//_/_/_//_/_/_//_/_/_//_//_/_/_//_/_/_//_/💕🥀_/_//_/_/_/_/_/_/_//_//_/_/_//_/",

    "_ _ _ _ _ _ _ _===_ _ _ _ _ _ _ _ __ _ _ _ _ _ _ _===[TARGET] RO MT YR 😢 _ _ _ _ _ _ _ _===_ _ _ _ _ _ _ _ __ _ _ _ _ _ _ _===_ _ _ _ _",

    "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@[TARGET] CHUSEGA? @@@@@@@@@@@@@@@@@@@@@@@@@@"
}

local gui = Instance.new("ScreenGui")
gui.Name = "ANSH_V1_HUB"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(420, 430)
frame.Position = UDim2.new(0.5, -210, 0.5, -215)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
frame.Parent = gui

Instance.new("UICorner", frame).CornerRadius =
    UDim.new(0, 12)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 45)
title.BackgroundTransparency = 1
title.Text = "ANSH V1 HUB"
title.TextColor3 = Color3.fromRGB(255, 70, 100)
title.Font = Enum.Font.GothamBold
title.TextSize = 25
title.Parent = frame

local target = Instance.new("TextBox")
target.Size = UDim2.new(1, -30, 0, 38)
target.Position = UDim2.fromOffset(15, 55)
target.PlaceholderText = "Enter target username"
target.Text = ""
target.ClearTextOnFocus = false
target.TextColor3 = Color3.new(1, 1, 1)
target.BackgroundColor3 = Color3.fromRGB(38, 38, 48)
target.Parent = frame

Instance.new("UICorner", target).CornerRadius =
    UDim.new(0, 8)

local preview = Instance.new("TextBox")
preview.Size = UDim2.new(1, -30, 0, 100)
preview.Position = UDim2.fromOffset(15, 105)
preview.Text = presets[1]
preview.TextWrapped = true
preview.MultiLine = true
preview.ClearTextOnFocus = false
preview.TextXAlignment = Enum.TextXAlignment.Left
preview.TextYAlignment = Enum.TextYAlignment.Top
preview.TextColor3 = Color3.new(1, 1, 1)
preview.BackgroundColor3 = Color3.fromRGB(38, 38, 48)
preview.Parent = frame

Instance.new("UICorner", preview).CornerRadius =
    UDim.new(0, 8)

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -30, 0, 30)
status.Position = UDim2.fromOffset(15, 260)
status.BackgroundTransparency = 1
status.Text = "STATUS: READY"
status.TextColor3 = Color3.fromRGB(100, 255, 150)
status.Font = Enum.Font.GothamBold
status.Parent = frame

local function makeButton(text, x, y, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.fromOffset(85, 35)
    button.Position = UDim2.fromOffset(x, y)
    button.Text = text
    button.TextColor3 = Color3.new(1, 1, 1)
    button.BackgroundColor3 = Color3.fromRGB(65, 45, 75)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 13
    button.Parent = frame

    Instance.new("UICorner", button).CornerRadius =
        UDim.new(0, 7)

    button.MouseButton1Click:Connect(callback)
    return button
end

-- Four text styles
for i = 1, 4 do
    local index = i

    makeButton("STYLE " .. index, 15 + (i - 1) * 98, 215, function()
        selectedStyle = index
        preview.Text = presets[index]
        status.Text = "STYLE " .. index .. " SELECTED"
    end)
end

-- Preview with target replacement
makeButton("PREVIEW", 65, 305, function()
    preview.Text = presets[selectedStyle]:gsub(
        "%[TARGET%]",
        function()
            return target.Text
        end
    )

    status.Text = "PREVIEW READY"
end)

-- Reset
makeButton("RESET", 255, 305, function()
    running = false
    selectedStyle = 1
    target.Text = ""
    preview.Text = presets[1]
    status.Text = "STATUS: READY"
end)

-- Start testing
makeButton("SPAM ON", 65, 365, function()
    running = true
    status.Text = "TEST MODE: ON"
    status.TextColor3 = Color3.fromRGB(100, 255, 150)
end)

-- Stop testing
makeButton("SPAM OFF", 255, 365, function()
    running = false
    status.Text = "TEST MODE: OFF"
    status.TextColor3 = Color3.fromRGB(255, 100, 100)
end)

print("ANSH V1 HUB loaded")
