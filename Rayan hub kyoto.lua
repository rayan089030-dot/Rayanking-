local Players = game:GetService("Players")
local plr = Players.LocalPlayer
local playerGui = plr:WaitForChild("PlayerGui")

-- إزالة أي واجهة قديمة لمنع التكرار
if playerGui:FindFirstChild("AutoKyotoGUI") then
    playerGui.AutoKyotoGUI:Destroy()
end

local CORRECT_KEY = "Rayanking"

-- الواجهة الرئيسية
local gui = Instance.new("ScreenGui")
gui.Name = "AutoKyotoGUI"
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- نافذة إدخال المفتاح
local keyFrame = Instance.new("Frame")
keyFrame.Name = "KeySystemFrame"
keyFrame.Parent = gui
keyFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
keyFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
keyFrame.Size = UDim2.new(0, 300, 0, 200)
keyFrame.Active = true
keyFrame.Draggable = true

local titleLabel = Instance.new("TextLabel")
titleLabel.Parent = keyFrame
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "System Key Verification"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true

local textBox = Instance.new("TextBox")
textBox.Parent = keyFrame
textBox.Position = UDim2.new(0.1, 0, 0.3, 0)
textBox.Size = UDim2.new(0.8, 0, 0, 40)
textBox.PlaceholderText = "Paste your key here..."
textBox.Text = ""
textBox.TextScaled = true
textBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)

local submitBtn = Instance.new("TextButton")
submitBtn.Parent = keyFrame
submitBtn.Position = UDim2.new(0.1, 0, 0.6, 0)
submitBtn.Size = UDim2.new(0.38, 0, 0, 35)
submitBtn.Text = "Check Key"
submitBtn.TextScaled = true
submitBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
submitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

local getKeyBtn = Instance.new("TextButton")
getKeyBtn.Parent = keyFrame
getKeyBtn.Position = UDim2.new(0.52, 0, 0.6, 0)
getKeyBtn.Size = UDim2.new(0.38, 0, 0, 35)
getKeyBtn.Text = "Get Key"
getKeyBtn.TextScaled = true
getKeyBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
getKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

local statusLabel = Instance.new("TextLabel")
statusLabel.Parent = keyFrame
statusLabel.Position = UDim2.new(0, 0, 0.82, 0)
statusLabel.Size = UDim2.new(1, 0, 0, 25)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = ""
statusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
statusLabel.TextScaled = true

-- زر الأداة الرئيسي (مخفي لحين إدخال المفتاح)
local button = Instance.new("TextButton")
button.Name = "AutoButton"
button.Parent = gui
button.Position = UDim2.new(0, 10, 0.1, 0)
button.Size = UDim2.new(0, 200, 0, 50)
button.Text = "Auto Kyoto"
button.TextScaled = true
button.BackgroundColor3 = Color3.fromRGB(0, 128, 255)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Visible = false

-- زر Get Key
getKeyBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://discord.gg/Cr2BvEtZv")
        statusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        statusLabel.Text = "Discord link copied!"
    else
        statusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        statusLabel.Text = "Executor not supported."
    end
end)

-- التحقق من المفتاح مع تنظيف المسافات المخفية
submitBtn.MouseButton1Click:Connect(function()
    local userKey = (textBox.Text or ""):match("^%s*(.-)%s*$")
    if userKey == CORRECT_KEY then
        statusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        statusLabel.Text = "Key Accepted!"
        task.wait(1)
        keyFrame:Destroy()
        button.Visible = true
    else
        statusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        statusLabel.Text = "Invalid Key!"
    end
end)

local function fireServer(args)
    local character = plr.Character
    if character and character:FindFirstChild("Communicate") then
        character.Communicate:FireServer(unpack(args))
    end
end

local function swipeCamera(swipeSpeed)
    local camera = workspace.CurrentCamera
    if camera then
        local originalPosition = camera.CFrame.Position
        local targetPosition = originalPosition + camera.CFrame.RightVector * swipeSpeed
        camera.CFrame = CFrame.new(targetPosition, camera.CFrame.Position + camera.CFrame.LookVector)
    end
end

-- الحدث الرئيسي عند الضغط على زر السكريبت
button.MouseButton1Click:Connect(function()
    local character = plr.Character
    -- التحقق من أن الشخصية حية وتملك HumanoidRootPart لمنع أي توقف
    if not character or not character:FindFirstChild("Humanoid") or character.Humanoid.Health <= 0 or not character:FindFirstChild("HumanoidRootPart") then
        print("Character is dead or not loaded properly.")
        return
    end

    print("Auto Kyoto sequence started...")
    
    -- تم استبدال VirtualInputManager المتوقف بعد الموت بطريقة مباشرة وآمنة
    swipeCamera(13)
    task.wait(0.001)
    
    local tool1 = plr.Backpack:FindFirstChild("Flowing Water") or character:FindFirstChild("Flowing Water")
    if tool1 then
        fireServer({
            [1] = {
                ["Tool"] = tool1,
                ["Goal"] = "Console Move"
            }
        })
    end
    
    task.wait(2.27)
    
    swipeCamera(10)
    
    local tool2 = plr.Backpack:FindFirstChild("Lethal Whirlwind Stream") or character:FindFirstChild("Lethal Whirlwind Stream")
    if tool2 then
        fireServer({
            [1] = {
                ["Tool"] = tool2,
                ["Goal"] = "Console Move"
            }
        })
    end

    task.wait(1)
    if tool2 then
        fireServer({
            [1] = {
                ["Goal"] = "Auto Use End",
                ["Tool"] = tool2
            }
        })
    end
end)
