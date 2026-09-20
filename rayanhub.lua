-- // Rayan Hub - Ultimate Sci-Fi System (5026 Edition) // --
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

-- تنظيف أي واجهة قديمة لنفس السكربت لتجنب التكرار
if CoreGui:FindFirstChild("RayanHubSystem") then
    CoreGui.RayanHubSystem:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RayanHubSystem"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- ==========================================
-- المرحلة الأولى: نظام التحميل الأسطوري (5026)
-- ==========================================
local LoadFrame = Instance.new("Frame")
LoadFrame.Size = UDim2.new(0, 450, 0, 220)
LoadFrame.Position = UDim2.new(0.5, -225, 0.5, -110)
LoadFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 18)
LoadFrame.BorderSizePixel = 0
LoadFrame.Parent = ScreenGui

local LoadCorner = Instance.new("UICorner")
LoadCorner.CornerRadius = UDim.new(0, 16)
LoadCorner.Parent = LoadFrame

local LoadStroke = Instance.new("UIStroke")
LoadStroke.Color = Color3.fromRGB(0, 255, 200)
LoadStroke.Thickness = 2.5
LoadStroke.Parent = LoadFrame

local LoadTitle = Instance.new("TextLabel")
LoadTitle.Size = UDim2.new(1, 0, 0, 60)
LoadTitle.BackgroundTransparency = 1
LoadTitle.Text = "⚡ RAYAN HUB (V5026) ⚡"
LoadTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadTitle.TextSize = 22
LoadTitle.Font = Enum.Font.GothamBold
LoadTitle.Parent = LoadFrame

local LoadSub = Instance.new("TextLabel")
LoadSub.Size = UDim2.new(1, 0, 0, 30)
LoadSub.Position = UDim2.new(0, 0, 0, 60)
LoadSub.BackgroundTransparency = 1
LoadSub.Text = "جاري تهيئة النظام الكوني..."
LoadSub.TextColor3 = Color3.fromRGB(160, 160, 200)
LoadSub.TextSize = 13
LoadSub.Font = Enum.Font.Gotham
LoadSub.Parent = LoadFrame

-- شريط التقدم (Loading Bar)
local BarBackground = Instance.new("Frame")
BarBackground.Size = UDim2.new(0.85, 0, 0, 12)
BarBackground.Position = UDim2.new(0.075, 0, 0, 115)
BarBackground.BackgroundColor3 = Color3.fromRGB(25, 25, 45)
BarBackground.BorderSizePixel = 0
BarBackground.Parent = LoadFrame

local BarCorner = Instance.new("UICorner")
BarCorner.CornerRadius = UDim.new(0, 6)
BarCorner.Parent = BarBackground

local BarFill = Instance.new("Frame")
BarFill.Size = UDim2.new(0, 0, 1, 0)
BarFill.BackgroundColor3 = Color3.fromRGB(0, 255, 200)
BarFill.BorderSizePixel = 0
BarFill.Parent = BarBackground

local FillCorner = Instance.new("UICorner")
FillCorner.CornerRadius = UDim.new(0, 6)
FillCorner.Parent = BarFill

local PercentText = Instance.new("TextLabel")
PercentText.Size = UDim2.new(1, 0, 0, 30)
PercentText.Position = UDim2.new(0, 0, 0, 145)
PercentText.BackgroundTransparency = 1
PercentText.Text = "0%"
PercentText.TextColor3 = Color3.fromRGB(0, 255, 200)
PercentText.TextSize = 14
PercentText.Font = Enum.Font.GothamBold
PercentText.Parent = LoadFrame

-- أنيميشن التحميل الفخم
task.spawn(function()
    local steps = {"مزامنة البروتوكولات العصبية...", "تجاوز جدران الحماية...", "تحميل واجهة Rayan Hub...", "اكتمال التحميل بنجاح!"}
    for i = 1, 100 do
        BarFill.Size = UDim2.new(i/100, 0, 1, 0)
        PercentText.Text = i .. "%"
        if i == 25 then LoadSub.Text = steps[1]
        elseif i == 50 then LoadSub.Text = steps[2]
        elseif i == 75 then LoadSub.Text = steps[3]
        elseif i == 95 then LoadSub.Text = steps[4] end
        task.wait(0.02)
    end
    
    task.wait(0.5)
    LoadFrame:Destroy() -- إزالة نافذة التحميل وإظهار نافذة المفتاح
    
    -- ==========================================
    -- المرحلة الثانية: واجهة إدخال المفتاح (Key System)
    -- ==========================================
    local KeyFrame = Instance.new("Frame")
    KeyFrame.Size = UDim2.new(0, 420, 0, 260)
    KeyFrame.Position = UDim2.new(0.5, -210, 0.5, -130)
    KeyFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 20)
    KeyFrame.BorderSizePixel = 0
    KeyFrame.Parent = ScreenGui

    local KeyCorner = Instance.new("UICorner")
    KeyCorner.CornerRadius = UDim.new(0, 14)
    KeyCorner.Parent = KeyFrame

    local KeyStroke = Instance.new("UIStroke")
    KeyStroke.Color = Color3.fromRGB(150, 0, 255)
    KeyStroke.Thickness = 2.5
    KeyStroke.Parent = KeyFrame

    local KeyTitle = Instance.new("TextLabel")
    KeyTitle.Size = UDim2.new(1, 0, 0, 50)
    KeyTitle.BackgroundTransparency = 1
    KeyTitle.Text = "🔑 Rayan Hub - نظام التحقق"
    KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyTitle.TextSize = 18
    KeyTitle.Font = Enum.Font.GothamBold
    KeyTitle.Parent = KeyFrame

    local TextBox = Instance.new("TextBox")
    TextBox.Size = UDim2.new(0.85, 0, 0, 45)
    TextBox.Position = UDim2.new(0.075, 0, 0, 65)
    TextBox.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
    TextBox.PlaceholderText = "ادخل المفتاح هنا..."
    TextBox.Text = ""
    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 150)
    TextBox.TextSize = 14
    TextBox.Font = Enum.Font.Gotham
    TextBox.Parent = KeyFrame

    local BoxCorner = Instance.new("UICorner")
    BoxCorner.CornerRadius = UDim.new(0, 8)
    BoxCorner.Parent = TextBox

    local SubmitBtn = Instance.new("TextButton")
    SubmitBtn.Size = UDim2.new(0.4, 0, 0, 40)
    SubmitBtn.Position = UDim2.new(0.075, 0, 0, 125)
    SubmitBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
    SubmitBtn.Text = "تفعيل المفتاح"
    SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    SubmitBtn.TextSize = 14
    SubmitBtn.Font = Enum.Font.GothamBold
    SubmitBtn.Parent = KeyFrame

    local BtnCorner1 = Instance.new("UICorner")
    BtnCorner1.CornerRadius = UDim.new(0, 8)
    BtnCorner1.Parent = SubmitBtn

    local GetKeyBtn = Instance.new("TextButton")
    GetKeyBtn.Size = UDim2.new(0.4, 0, 0, 40)
    GetKeyBtn.Position = UDim2.new(0.525, 0, 0, 125)
    GetKeyBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    GetKeyBtn.Text = "Get Key (Discord)"
    GetKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    GetKeyBtn.TextSize = 14
    GetKeyBtn.Font = Enum.Font.GothamBold
    GetKeyBtn.Parent = KeyFrame

    local BtnCorner2 = Instance.new("UICorner")
    BtnCorner2.CornerRadius = UDim.new(0, 8)
    BtnCorner2.Parent = GetKeyBtn

    local StatusLabel = Instance.new("TextLabel")
    StatusLabel.Size = UDim2.new(1, 0, 0, 30)
    StatusLabel.Position = UDim2.new(0, 0, 0, 180)
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Text = "الحالة: يرجى جلب المفتاح من الديسكورد..."
    StatusLabel.TextColor3 = Color3.fromRGB(150, 150, 180)
    StatusLabel.TextSize = 12
    StatusLabel.Font = Enum.Font.Gotham
    StatusLabel.Parent = KeyFrame

    -- وظيفة زر نسخ رابط الديسكورد
    GetKeyBtn.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard("https://discord.gg/RyqtD8WdB")
            StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 128)
            StatusLabel.Text = "تم نسخ رابط الديسكورد بنجاح!"
        else
            StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
            StatusLabel.Text = "الرابط: https://discord.gg/RyqtD8WdB"
        end
    end)

    -- التحقق من المفتاح وتشغيل السكربت الأساسي مباشرة بدون أخطاء أمان
    SubmitBtn.MouseButton1Click:Connect(function()
        local userKey = TextBox.Text:gsub("^%s*(.-)%s*$", "%1")
        
        if userKey == "Rayanking" then
            StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 128)
            StatusLabel.Text = "المفتاح صحيح! جارٍ فتح السكربت..."
            
            task.wait(0.8)
            ScreenGui:Destroy()
            
            -- تشغيل السكربت الأساسي مباشرة بالطريقة الصحيحة
            loadstring(game:HttpGet("https://raw.githubusercontent.com/lennonxscripts/lennonhubv3/refs/heads/main/stealanegg.lua"))()
        else
            StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
            StatusLabel.Text = "المفتاح غير صحيح! تأكد من لصقه بشكل صحيح."
        end
    end)
end)
