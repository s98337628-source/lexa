-- ================= LEXA HUB =================
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TextChatService = game:GetService("TextChatService")
local player = game.Players.LocalPlayer

local channel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")

-- ================= CUTSCENE + MUSIC (4 SEC) =================
local cam = workspace.CurrentCamera

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://6843558868"
sound.Volume = 3
sound.Looped = false
sound.Parent = workspace
sound:Play()

cam.CameraType = Enum.CameraType.Scriptable
local startTime = tick()
local duration = 4
local cutsceneConn

cutsceneConn = RunService.RenderStepped:Connect(function()
    local elapsed = tick() - startTime
    if elapsed >= duration then
        cutsceneConn:Disconnect()
        cam.CameraType = Enum.CameraType.Custom
        return
    end
    local angle = elapsed * 0.8
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local pos = char.HumanoidRootPart.Position
        cam.CFrame = CFrame.new(pos + Vector3.new(math.sin(angle)*10, 5, math.cos(angle)*10), pos)
    end
end)

-- ================= GUI =================
local gui = Instance.new("ScreenGui")
gui.Name = "LexaHub"
gui.ResetOnSpawn = false
gui.Parent = CoreGui

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 450, 0, 400)
main.Position = UDim2.new(0.5, -225, 0.5, -200)
main.BackgroundColor3 = Color3.fromRGB(15, 10, 20)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 15)
corner.Parent = main

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 50, 150)
stroke.Thickness = 2
stroke.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -100, 0, 40)
title.Position = UDim2.new(0, 20, 0, 5)
title.BackgroundTransparency = 1
title.Text = "LEXA HUB"
title.TextColor3 = Color3.fromRGB(255, 50, 150)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = main

local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 30, 0, 30)
minBtn.Position = UDim2.new(1, -70, 0, 8)
minBtn.BackgroundColor3 = Color3.fromRGB(255, 180, 0)
minBtn.Text = "—"
minBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
minBtn.TextScaled = true
minBtn.Font = Enum.Font.GothamBold
minBtn.Parent = main

local minC = Instance.new("UICorner")
minC.CornerRadius = UDim.new(0, 6)
minC.Parent = minBtn

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 8)
closeBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = main

local closeC = Instance.new("UICorner")
closeC.CornerRadius = UDim.new(0, 6)
closeC.Parent = closeBtn

-- PASSWORD SCREEN
local passFrame = Instance.new("Frame")
passFrame.Size = UDim2.new(1, -40, 0, 120)
passFrame.Position = UDim2.new(0, 20, 0.5, -60)
passFrame.BackgroundColor3 = Color3.fromRGB(25, 15, 30)
passFrame.BorderSizePixel = 0
passFrame.Parent = main

local passCorner = Instance.new("UICorner")
passCorner.CornerRadius = UDim.new(0, 10)
passCorner.Parent = passFrame

local passLabel = Instance.new("TextLabel")
passLabel.Size = UDim2.new(1, -20, 0, 30)
passLabel.Position = UDim2.new(0, 10, 0, 10)
passLabel.BackgroundTransparency = 1
passLabel.Text = "Enter Password"
passLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
passLabel.TextScaled = true
passLabel.Font = Enum.Font.GothamBold
passLabel.Parent = passFrame

local passInput = Instance.new("TextBox")
passInput.Size = UDim2.new(1, -40, 0, 40)
passInput.Position = UDim2.new(0, 20, 0, 45)
passInput.BackgroundColor3 = Color3.fromRGB(40, 25, 45)
passInput.BorderSizePixel = 0
passInput.PlaceholderText = "Password..."
passInput.Text = ""
passInput.TextColor3 = Color3.fromRGB(255, 255, 255)
passInput.PlaceholderColor3 = Color3.fromRGB(150, 100, 150)
passInput.Font = Enum.Font.Gotham
passInput.TextScaled = true
passInput.Parent = passFrame

local passCorner2 = Instance.new("UICorner")
passCorner2.CornerRadius = UDim.new(0, 8)
passCorner2.Parent = passInput

-- FEATURES (Hidden)
local featureFrame = Instance.new("Frame")
featureFrame.Size = UDim2.new(1, -40, 1, -80)
featureFrame.Position = UDim2.new(0, 20, 0, 55)
featureFrame.BackgroundColor3 = Color3.fromRGB(10, 5, 15)
featureFrame.BorderSizePixel = 0
featureFrame.Visible = false
featureFrame.Parent = main

local fCorner = Instance.new("UICorner")
fCorner.CornerRadius = UDim.new(0, 10)
fCorner.Parent = featureFrame

local textInput = Instance.new("TextBox")
textInput.Size = UDim2.new(1, -20, 0, 35)
textInput.Position = UDim2.new(0, 10, 0, 10)
textInput.BackgroundColor3 = Color3.fromRGB(35, 20, 40)
textInput.BorderSizePixel = 0
textInput.PlaceholderText = "Yahan apna text likho..."
textInput.Text = ""
textInput.TextColor3 = Color3.fromRGB(255, 255, 255)
textInput.PlaceholderColor3 = Color3.fromRGB(150, 100, 150)
textInput.Font = Enum.Font.Gotham
textInput.TextScaled = true
textInput.Parent = featureFrame

local tCorner = Instance.new("UICorner")
tCorner.CornerRadius = UDim.new(0, 8)
tCorner.Parent = textInput

local spamBtn = Instance.new("TextButton")
spamBtn.Size = UDim2.new(1, -20, 0, 40)
spamBtn.Position = UDim2.new(0, 10, 0, 55)
spamBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 150)
spamBtn.Text = "START SPAM"
spamBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
spamBtn.TextScaled = true
spamBtn.Font = Enum.Font.GothamBold
spamBtn.Parent = featureFrame

local sCorner = Instance.new("UICorner")
sCorner.CornerRadius = UDim.new(0, 8)
sCorner.Parent = spamBtn

local stopBtn = Instance.new("TextButton")
stopBtn.Size = UDim2.new(1, -20, 0, 40)
stopBtn.Position = UDim2.new(0, 10, 0, 105)
stopBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
stopBtn.Text = "STOP SPAM"
stopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
stopBtn.TextScaled = true
stopBtn.Font = Enum.Font.GothamBold
stopBtn.Parent = featureFrame

local stCorner = Instance.new("UICorner")
stCorner.CornerRadius = UDim.new(0, 8)
stCorner.Parent = stopBtn

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -20, 0, 25)
statusLabel.Position = UDim2.new(0, 10, 0, 155)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Status: OFF"
statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
statusLabel.TextScaled = true
statusLabel.Font = Enum.Font.Gotham
statusLabel.Parent = featureFrame

-- PASSWORD CHECK
passInput.FocusLost:Connect(function(enter)
    if enter then
        if passInput.Text == "LEXA PAPA" then
            passFrame.Visible = false
            featureFrame.Visible = true
        else
            passLabel.Text = "Wrong Password!"
            passLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
            passInput.Text = ""
        end
    end
end)

-- SPAM LOGIC
local spamOn = false
local spamSpeed = 0.5

local function sendMessage(msg)
    pcall(function()
        channel:SendAsync(msg)
    end)
end

local function startSpam()
    if spamOn then return end
    local userText = textInput.Text
    if userText == "" then
        userText = "NOOB"
    end
    
    spamOn = true
    statusLabel.Text = "Status: ON 🔥"
    statusLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
    
    task.spawn(function()
        while spamOn do
            sendMessage("__________________" .. userText .. " H8RS DR GY KYA______________________________________")
            task.wait(spamSpeed)
            sendMessage("_______________________" .. userText .. " LEXA PAPA BOL________________________________")
            task.wait(spamSpeed)
            sendMessage("________________" .. userText .. " LEAVE KRDE NOOB_____________________________")
            task.wait(spamSpeed)
        end
    end)
end

local function stopSpam()
    spamOn = false
    statusLabel.Text = "Status: OFF"
    statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
end

spamBtn.MouseButton1Click:Connect(startSpam)
stopBtn.MouseButton1Click:Connect(stopSpam)

-- MINIMIZE
local minimized = false
minBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        main.Size = UDim2.new(0, 450, 0, 45)
        passFrame.Visible = false
        featureFrame.Visible = false
        minBtn.Text = "+"
    else
        main.Size = UDim2.new(0, 450, 0, 400)
        if passFrame.Visible == false and featureFrame.Visible == false then
            passFrame.Visible = true
        end
        minBtn.Text = "—"
    end
end)

-- CLOSE
closeBtn.MouseButton1Click:Connect(function()
    stopSpam()
    sound:Stop()
    gui:Destroy()
end)
