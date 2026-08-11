-- ==========================================
-- SCRIPT PREMIUM: STUDIO LITE RBXM IMPORTER
-- Theme: Blood Maroon Animated (🔱 Edition)
-- Project By: Gon (PERFECT FULLSCREEN LOADING)
-- ==========================================

print("===================================")
print(" 🔱 Script Import Project By Gon 🔱 ")
print("===================================")

pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "🔱 Initializing...",
        Text = "Memuat Script Project By Gon",
        Duration = 3,
        Button1 = "OK"
    })
end)

if game:GetService("CoreGui"):FindFirstChild("BloodStudioImporter") then
    game:GetService("CoreGui").BloodStudioImporter:Destroy()
end

local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BloodStudioImporter"
-- [PERBAIKAN PENTING]: Ini memaksa UI mengabaikan batas atas layar (notch)
ScreenGui.IgnoreGuiInset = true 
ScreenGui.Parent = CoreGui

-- ==========================================
-- [1] FULL SCREEN LOADING SYSTEM (SEKARANG BENAR-BENAR FULL)
-- ==========================================
local FullScreenLoad = Instance.new("Frame")
FullScreenLoad.Size = UDim2.new(1, 0, 1, 0) -- 100% Layar (Karena IgnoreGuiInset sudah aktif)
FullScreenLoad.Position = UDim2.new(0, 0, 0, 0)
FullScreenLoad.BackgroundColor3 = Color3.fromRGB(10, 8, 8)
FullScreenLoad.BorderSizePixel = 0
FullScreenLoad.Active = true 
FullScreenLoad.Parent = ScreenGui

-- Kotak pembungkus agar teks tetap rapi di tengah
local CenterContainer = Instance.new("Frame")
CenterContainer.Size = UDim2.new(0, 400, 0, 200)
CenterContainer.Position = UDim2.new(0.5, -200, 0.5, -100)
CenterContainer.BackgroundTransparency = 1
CenterContainer.Parent = FullScreenLoad

local function CreateLoadText(text, posY, font, size, color)
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, 0, 0, 20)
    lbl.Position = UDim2.new(0, 0, 0, posY)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = color
    lbl.Font = font
    lbl.TextSize = size
    lbl.TextXAlignment = Enum.TextXAlignment.Center
    lbl.Parent = CenterContainer
    return lbl
end

CreateLoadText("========================================", 15, Enum.Font.Gotham, 14, Color3.fromRGB(150, 50, 50))
CreateLoadText('" IMPORTER RBXM FILE STUDIO LITE "', 40, Enum.Font.GothamBlack, 16, Color3.fromRGB(255, 200, 200))
CreateLoadText('" BY GON "', 65, Enum.Font.GothamBold, 15, Color3.fromRGB(255, 50, 50)) 
CreateLoadText("========================================", 90, Enum.Font.Gotham, 14, Color3.fromRGB(150, 50, 50))

local StatusLabel = CreateLoadText("Mohon Tunggu", 130, Enum.Font.GothamSemibold, 13, Color3.fromRGB(200, 200, 200))

-- [PERBAIKAN PROGRESS BAR] - Sekarang melengkung
local BarBg = Instance.new("Frame")
BarBg.Size = UDim2.new(0.8, 0, 0, 15)
BarBg.Position = UDim2.new(0.1, 0, 0, 160)
BarBg.BackgroundColor3 = Color3.fromRGB(25, 15, 15)
BarBg.Parent = CenterContainer

local BarBgCorner = Instance.new("UICorner")
BarBgCorner.CornerRadius = UDim.new(1, 0) -- Lengkungan Penuh (Pil)
BarBgCorner.Parent = BarBg

local BarBgStroke = Instance.new("UIStroke")
BarBgStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
BarBgStroke.Color = Color3.fromRGB(100, 30, 30)
BarBgStroke.Thickness = 1
BarBgStroke.Parent = BarBg

local BarFill = Instance.new("Frame")
BarFill.Size = UDim2.new(0, 0, 1, 0)
BarFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BarFill.BorderSizePixel = 0
BarFill.Parent = BarBg

local BarFillCorner = Instance.new("UICorner")
BarFillCorner.CornerRadius = UDim.new(1, 0) -- Mengikuti kelengkungan Bg
BarFillCorner.Parent = BarFill

local BarGradient = Instance.new("UIGradient")
BarGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 0, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 30, 30))
})
BarGradient.Parent = BarFill

-- ==========================================
-- [2] TOMBOL START (KOTAK + 🔱)
-- ==========================================
local OpenBtn = Instance.new("TextButton")
OpenBtn.Size = UDim2.new(0, 45, 0, 45) 
OpenBtn.Position = UDim2.new(0.05, 0, 0.5, -22)
OpenBtn.BackgroundColor3 = Color3.fromRGB(15, 12, 12)
OpenBtn.Text = "🔱"
OpenBtn.TextColor3 = Color3.fromRGB(255, 50, 50)
OpenBtn.TextSize = 25
OpenBtn.Font = Enum.Font.GothamBold
OpenBtn.Active = true
OpenBtn.Draggable = true
OpenBtn.Visible = false
OpenBtn.Parent = ScreenGui

local OpenBtnCorner = Instance.new("UICorner")
OpenBtnCorner.CornerRadius = UDim.new(0, 10) 
OpenBtnCorner.Parent = OpenBtn

local OpenBtnStroke = Instance.new("UIStroke")
OpenBtnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border 
OpenBtnStroke.Color = Color3.fromRGB(255, 255, 255) 
OpenBtnStroke.Thickness = 2.5
OpenBtnStroke.Parent = OpenBtn

local OpenGradient = Instance.new("UIGradient")
OpenGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(90, 0, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 20, 20)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(90, 0, 0))
})
OpenGradient.Parent = OpenBtnStroke

-- ==========================================
-- [3] PANEL UTAMA & ISI
-- ==========================================
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 320, 0, 410) 
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -205)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 15, 15)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false 
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
MainStroke.Color = Color3.fromRGB(255, 255, 255)
MainStroke.Thickness = 2
MainStroke.Parent = MainFrame

local MainGradient = Instance.new("UIGradient")
MainGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(90, 0, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 20, 20)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(90, 0, 0))
})
MainGradient.Parent = MainStroke

local ScanBtn = Instance.new("TextButton")
ScanBtn.Size = UDim2.new(0.9, 0, 0, 35)
ScanBtn.Position = UDim2.new(0.05, 0, 0, 50)
ScanBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 
ScanBtn.Text = "" 
ScanBtn.Parent = MainFrame

local ScanCorner = Instance.new("UICorner")
ScanCorner.CornerRadius = UDim.new(0, 5)
ScanCorner.Parent = ScanBtn

local ScanGradient = Instance.new("UIGradient")
ScanGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(90, 0, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(200, 20, 20)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(90, 0, 0))
})
ScanGradient.Parent = ScanBtn

local ScanLabel = Instance.new("TextLabel")
ScanLabel.Size = UDim2.new(1, 0, 1, 0)
ScanLabel.BackgroundTransparency = 1
ScanLabel.Text = "SCAN FILE"
ScanLabel.TextColor3 = Color3.fromRGB(255, 255, 255) 
ScanLabel.Font = Enum.Font.GothamBold
ScanLabel.TextSize = 14
ScanLabel.ZIndex = 2 
ScanLabel.Parent = ScanBtn

local SearchBox = Instance.new("TextBox")
SearchBox.Size = UDim2.new(0.9, 0, 0, 30)
SearchBox.Position = UDim2.new(0.05, 0, 0, 95)
SearchBox.BackgroundColor3 = Color3.fromRGB(25, 18, 18)
SearchBox.TextColor3 = Color3.fromRGB(255, 200, 200)
SearchBox.PlaceholderText = "🔍 Cari nama file..."
SearchBox.PlaceholderColor3 = Color3.fromRGB(150, 50, 50)
SearchBox.Font = Enum.Font.Gotham
SearchBox.TextSize = 12
SearchBox.Text = ""
SearchBox.Parent = MainFrame

local SearchCorner = Instance.new("UICorner")
SearchCorner.CornerRadius = UDim.new(0, 5)
SearchCorner.Parent = SearchBox

local SearchStroke = Instance.new("UIStroke")
SearchStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
SearchStroke.Color = Color3.fromRGB(100, 30, 30)
SearchStroke.Thickness = 1.5
SearchStroke.Parent = SearchBox

local HeaderFrame = Instance.new("Frame")
HeaderFrame.Size = UDim2.new(1, 0, 0, 40)
HeaderFrame.BackgroundTransparency = 1 
HeaderFrame.Parent = MainFrame

local HeaderLine = Instance.new("Frame")
HeaderLine.Size = UDim2.new(1, 0, 0, 1)
HeaderLine.Position = UDim2.new(0, 0, 1, 0)
HeaderLine.BackgroundColor3 = Color3.fromRGB(40, 20, 20)
HeaderLine.BorderSizePixel = 0
HeaderLine.Parent = HeaderFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -50, 1, 0)
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "🔱 STUDIO LITE IMPORTER"
TitleLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
TitleLabel.Font = Enum.Font.GothamBlack
TitleLabel.TextSize = 14
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = HeaderFrame

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 5)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "X" 
CloseBtn.TextColor3 = Color3.fromRGB(255, 50, 50)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 16
CloseBtn.Parent = HeaderFrame

local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Size = UDim2.new(0.9, 0, 0, 260)
ScrollFrame.Position = UDim2.new(0.05, 0, 0, 135)
ScrollFrame.BackgroundColor3 = Color3.fromRGB(22, 18, 18)
ScrollFrame.ScrollBarThickness = 3
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(150, 50, 50)
ScrollFrame.Parent = MainFrame

local ScrollCorner = Instance.new("UICorner")
ScrollCorner.CornerRadius = UDim.new(0, 5)
ScrollCorner.Parent = ScrollFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 6)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.Parent = ScrollFrame

-- ==========================================
-- [4] ANIMASI LOOP & LOADING LOGIC
-- ==========================================
task.spawn(function()
    local rot = 0
    while task.wait() do
        if not ScreenGui.Parent then break end
        rot = (rot + 2) % 360
        OpenGradient.Rotation = rot
        MainGradient.Rotation = rot
        ScanGradient.Rotation = rot 
    end
end)

task.spawn(function()
    local dots = {"", ".", "..", "..."}
    local dotIndex = 1
    
    local txtAnim = task.spawn(function()
        while task.wait(0.4) do
            if not FullScreenLoad.Parent then break end
            StatusLabel.Text = "Mohon Tunggu" .. dots[dotIndex]
            dotIndex = dotIndex + 1
            if dotIndex > 4 then dotIndex = 1 end
        end
    end)
    
    local tweenInfo = TweenInfo.new(5.0, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
    local tween = TweenService:Create(BarFill, tweenInfo, {Size = UDim2.new(1, 0, 1, 0)})
    tween:Play()
    tween.Completed:Wait()
    
    task.cancel(txtAnim)
    StatusLabel.Text = "Selesai!"
    StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
    task.wait(0.5)
    
    -- [PERBAIKAN FADE OUT] - Menghilangkan Bug Kotak Hantu
    local fadeTweenInfo = TweenInfo.new(1.0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local fadeGoals = {BackgroundTransparency = 1}
    
    -- Fade teks dan bar di dalam container
    for _, obj in pairs(CenterContainer:GetDescendants()) do
        if obj:IsA("TextLabel") then
            TweenService:Create(obj, fadeTweenInfo, {TextTransparency = 1}):Play()
        elseif obj:IsA("Frame") then
            TweenService:Create(obj, fadeTweenInfo, {BackgroundTransparency = 1}):Play()
        elseif obj:IsA("UIStroke") then
            TweenService:Create(obj, fadeTweenInfo, {Transparency = 1}):Play()
        end
    end
    
    -- Fade background utama
    local fadeMain = TweenService:Create(FullScreenLoad, fadeTweenInfo, fadeGoals)
    fadeMain:Play()
    fadeMain.Completed:Wait()
    
    FullScreenLoad:Destroy() 
    
    OpenBtn.Size = UDim2.new(0, 0, 0, 0)
    OpenBtn.Visible = true
    TweenService:Create(OpenBtn, TweenInfo.new(0.4, Enum.EasingStyle.Back), {Size = UDim2.new(0, 45, 0, 45)}):Play()
end)

-- ==========================================
-- [5] LOGIKA TOMBOL PANEL
-- ==========================================
OpenBtn.MouseButton1Click:Connect(function()
    OpenBtn.Visible = false
    MainFrame.Visible = true
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 320, 0, 410),
        Position = UDim2.new(0.5, -160, 0.5, -205)
    }):Play()
end)

CloseBtn.MouseButton1Click:Connect(function()
    local tween = TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { 
        Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0) 
    })
    tween:Play()
    tween.Completed:Wait()
    MainFrame.Visible = false
    OpenBtn.Visible = true
end)

-- ==========================================
-- [6] 🌟 LOGIKA IMPORT (NATIVE ROBLOX ENGINE) 🌟
-- ==========================================
local listSemuaFile = {}

local function CreateFileItem(fileName)
    local ItemFrame = Instance.new("Frame")
    ItemFrame.Size = UDim2.new(0.96, 0, 0, 40)
    ItemFrame.BackgroundColor3 = Color3.fromRGB(35, 25, 25)
    ItemFrame.Parent = ScrollFrame
    
    local ItemCorner = Instance.new("UICorner")
    ItemCorner.CornerRadius = UDim.new(0, 5)
    ItemCorner.Parent = ItemFrame
    
    local FileNameLabel = Instance.new("TextLabel")
    FileNameLabel.Size = UDim2.new(0.65, 0, 1, 0)
    FileNameLabel.Position = UDim2.new(0, 10, 0, 0)
    FileNameLabel.BackgroundTransparency = 1
    FileNameLabel.Text = fileName
    FileNameLabel.TextColor3 = Color3.fromRGB(255, 200, 200)
    FileNameLabel.TextXAlignment = Enum.TextXAlignment.Left
    FileNameLabel.Font = Enum.Font.GothamSemibold
    FileNameLabel.TextSize = 12
    FileNameLabel.TextTruncate = Enum.TextTruncate.AtEnd
    FileNameLabel.Parent = ItemFrame
    
    local InsertBtn = Instance.new("TextButton")
    InsertBtn.Size = UDim2.new(0.28, 0, 0.7, 0)
    InsertBtn.Position = UDim2.new(0.68, 0, 0.15, 0)
    InsertBtn.BackgroundColor3 = Color3.fromRGB(150, 30, 30)
    InsertBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    InsertBtn.Text = "IMPORT"
    InsertBtn.Font = Enum.Font.GothamBold
    InsertBtn.TextSize = 11
    InsertBtn.Parent = ItemFrame
    
    local InsertCorner = Instance.new("UICorner")
    InsertCorner.CornerRadius = UDim.new(0, 4)
    InsertCorner.Parent = InsertBtn
    
    InsertBtn.MouseButton1Click:Connect(function()
        InsertBtn.Text = "LOADING..."
        InsertBtn.BackgroundColor3 = Color3.fromRGB(200, 100, 0)
        
        local success, err = pcall(function()
            local customLink = getcustomasset(fileName)
            local objects = game:GetObjects(customLink)
            
            local player = game.Players.LocalPlayer
            local char = player.Character or player.CharacterAdded:Wait()
            local root = char:FindFirstChild("HumanoidRootPart")
            
            for _, obj in pairs(objects) do
                obj.Parent = workspace 
                
                if root then
                    pcall(function()
                        if obj:IsA("Model") then
                            obj:MoveTo(root.Position + Vector3.new(0, 0, -10))
                        elseif obj:IsA("BasePart") then
                            obj.CFrame = root.CFrame * CFrame.new(0, 0, -10)
                        end
                    end)
                end
                task.wait(0.05) 
            end
        end)
        
        if success then
            InsertBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 50)
            InsertBtn.Text = "SUCCESS"
        else
            warn("❌ [PROJECT BY GON] Gagal Import Aset: " .. tostring(fileName))
            warn("Penyebab Error: " .. tostring(err))
            InsertBtn.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
            InsertBtn.Text = "ERROR"
        end
        
        wait(2)
        InsertBtn.BackgroundColor3 = Color3.fromRGB(150, 30, 30)
        InsertBtn.Text = "IMPORT"
    end)
end

local function RefreshDaftarFile(kataKunci)
    for _, child in pairs(ScrollFrame:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end
    local hitung = 0
    for _, namaFile in ipairs(listSemuaFile) do
        if kataKunci == "" or string.find(string.lower(namaFile), string.lower(kataKunci)) then
            CreateFileItem(namaFile)
            hitung = hitung + 1
        end
    end
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, hitung * 46)
end

SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
    RefreshDaftarFile(SearchBox.Text)
end)

ScanBtn.MouseButton1Click:Connect(function()
    ScanLabel.Text = "SCANNING..." 
    local success, files = pcall(function() return listfiles("") end)
    
    if success and files then
        listSemuaFile = {} 
        for _, filePath in pairs(files) do
            if string.match(filePath, "%.rbxm$") or string.match(filePath, "%.rbxmx$") then
                local fileName = string.match(filePath, "([^/\\]+)$") or filePath
                table.insert(listSemuaFile, fileName)
            end
        end
        RefreshDaftarFile(SearchBox.Text)
        ScanLabel.Text = #listSemuaFile .. " FILES FOUND"
    else
        ScanLabel.Text = "SCAN FAILED"
    end
    
    wait(1.5)
    ScanLabel.Text = "SCAN FILE"
end)
