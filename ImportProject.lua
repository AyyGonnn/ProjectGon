-- ==========================================================
-- CORE SECURITY & SERVICES
-- ==========================================================
local function CheckSecurity()
    local env = getfenv(0)
    if not env or (env.getgenv and not getgenv()) then
        pcall(function()
            game:GetService('Players'):FindFirstChildOfClass('Player'):Kick('Security Violation')
        end)
        while true do end
    end
end
pcall(CheckSecurity)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")

-- ==========================================================
-- DATABASE PREMIUM (GITHUB) & LIMIT HARIAN
-- ==========================================================
local VIP_USERS = {}
local GITHUB_RAW_LINK = "https://raw.githubusercontent.com/AyyGonnn/ProjectGon/refs/heads/main/VipUsers.json"

pcall(function()
    local response = game:HttpGet(GITHUB_RAW_LINK)
    if response then
        VIP_USERS = HttpService:JSONDecode(response)
    end
end)

local OWNER_ID = ""
if OWNER_ID ~= "" then
    VIP_USERS[OWNER_ID] = true
end

local IS_PREMIUM = VIP_USERS[tostring(LocalPlayer.UserId)] or false

local MAX_DAILY_LIMIT = 3
local limitFileName = "AfterlifeLimit_" .. LocalPlayer.UserId .. ".json"
local todayDate = os.date("%Y-%m-%d")
local limitData = { date = todayDate, count = 0 }

pcall(function()
    if readfile then
        local saved = HttpService:JSONDecode(readfile(limitFileName))
        if saved.date == todayDate then limitData.count = saved.count or 0 end
    end
end)

local function SaveLimitData()
    pcall(function() if writefile then writefile(limitFileName, HttpService:JSONEncode(limitData)) end end)
end

-- ==========================================================
-- UI INIT & NOTIFICATION SYSTEM
-- ==========================================================
local ProjectName = "AfterlifeProject"
if CoreGui:FindFirstChild(ProjectName) then CoreGui[ProjectName]:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = ProjectName
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 99999
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
ScreenGui.Parent = (gethui and gethui()) or CoreGui

local NotifContainer = Instance.new("Frame")
NotifContainer.Name = "NotifContainer"
NotifContainer.Size = UDim2.new(0, 240, 1, -40)
NotifContainer.Position = UDim2.new(1, -15, 0, 20)
NotifContainer.AnchorPoint = Vector2.new(1, 0)
NotifContainer.BackgroundTransparency = 1
NotifContainer.ZIndex = 1000
NotifContainer.Parent = ScreenGui

local NotifLayout = Instance.new("UIListLayout")
NotifLayout.SortOrder = Enum.SortOrder.LayoutOrder
NotifLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
NotifLayout.Padding = UDim.new(0, 10)
NotifLayout.Parent = NotifContainer

local function ShowNotification(title, desc, duration, isGold)
    duration = duration or 5
    local notif = Instance.new("Frame")
    notif.Size = UDim2.new(1, 150, 0, 52)
    notif.BackgroundTransparency = 1
    notif.ZIndex = 1000
    notif.Parent = NotifContainer

    local card = Instance.new("Frame")
    card.Size = UDim2.new(1, 0, 1, 0)
    card.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    card.BackgroundTransparency = 0.05
    card.ZIndex = 1001
    card.Parent = notif
    Instance.new("UICorner", card).CornerRadius = UDim.new(0, 6)

    local shadow = Instance.new("ImageLabel", card)
    shadow.Name = "Shadow"
    shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    shadow.Position = UDim2.new(0.5, 0, 0.5, 2)
    shadow.Size = UDim2.new(1, 15, 1, 15)
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxassetid://6015895133"
    shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    shadow.ImageTransparency = 0.5
    shadow.ZIndex = 1000

    local stroke = Instance.new("UIStroke", card)
    stroke.Thickness = 1
    stroke.Color = isGold and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(220, 30, 30)
    stroke.Transparency = 0.2

    local icon = Instance.new("TextLabel", card)
    icon.Size = UDim2.new(0, 24, 0, 24)
    icon.Position = UDim2.new(0, 12, 0.5, -12)
    icon.BackgroundTransparency = 1
    icon.Text = isGold and "👑" or "🔔"
    icon.TextSize = 15
    icon.Font = Enum.Font.Gotham
    icon.ZIndex = 1002

    local titleLbl = Instance.new("TextLabel", card)
    titleLbl.Size = UDim2.new(1, -50, 0, 16)
    titleLbl.Position = UDim2.new(0, 42, 0, 10)
    titleLbl.BackgroundTransparency = 1
    titleLbl.Text = title
    titleLbl.TextColor3 = isGold and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(255, 70, 70)
    titleLbl.Font = Enum.Font.GothamBold
    titleLbl.TextSize = 12
    titleLbl.TextXAlignment = Enum.TextXAlignment.Left
    titleLbl.ZIndex = 1002

    local descLbl = Instance.new("TextLabel", card)
    descLbl.Size = UDim2.new(1, -50, 0, 16)
    descLbl.Position = UDim2.new(0, 42, 0, 26)
    descLbl.BackgroundTransparency = 1
    descLbl.Text = desc
    descLbl.TextColor3 = Color3.fromRGB(210, 210, 210)
    descLbl.Font = Enum.Font.GothamMedium
    descLbl.TextSize = 10
    descLbl.TextXAlignment = Enum.TextXAlignment.Left
    descLbl.ZIndex = 1002

    local timeBar = Instance.new("Frame", card)
    timeBar.Size = UDim2.new(1, 0, 0, 2)
    timeBar.Position = UDim2.new(0, 0, 1, -2)
    timeBar.BackgroundColor3 = stroke.Color
    timeBar.BorderSizePixel = 0
    timeBar.ZIndex = 1003
    Instance.new("UICorner", timeBar).CornerRadius = UDim.new(0, 2)

    TweenService:Create(notif, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0, 52)}):Play()
    TweenService:Create(timeBar, TweenInfo.new(duration, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 0, 2)}):Play()

    task.delay(duration, function()
        if notif then
            TweenService:Create(card, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
            TweenService:Create(shadow, TweenInfo.new(0.3), {ImageTransparency = 1}):Play()
            TweenService:Create(stroke, TweenInfo.new(0.3), {Transparency = 1}):Play()
            TweenService:Create(titleLbl, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
            TweenService:Create(descLbl, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
            TweenService:Create(icon, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
            TweenService:Create(timeBar, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
            local tweenOut = TweenService:Create(notif, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(1, 150, 0, 52)})
            tweenOut:Play()
            tweenOut.Completed:Wait()
            notif:Destroy()
        end
    end)
end

task.spawn(function()
    task.wait(0.5)
    ShowNotification("IMPORTER RBXM", "BY GON", 5, false)
    task.wait(2.5)
    if IS_PREMIUM then
        ShowNotification("KAMU ADALAH", "VIP USER", 6, true)
    else
        ShowNotification("KAMU ADALAH", "FREE USER", 6, false)
    end
end)

-- ==========================================================
-- IMPORTER ENGINE FUNCTIONS (FIXED v6)
-- Fix 1: Hapus LocalScript creator -> penyebab error capability
-- Fix 2: Tinggi TextBox ikut jumlah baris kode (tidak setengah lagi)
-- Fix 3: Strip HTML dari source Studio Lite
-- ==========================================================
local function stripRichText(str)
    if type(str) ~= "string" then return "" end
    str = str:gsub("<[^<>]+>", "")
        :gsub("&lt;", "<"):gsub("&gt;", ">"):gsub("&amp;", "&")
        :gsub("&quot;", '"'):gsub("&apos;", "'")
        :gsub("&#10;", "\n"):gsub("&#13;", "\r"):gsub("&#9;", "\t")
        :gsub("\0", "")
    return str
end

local function isHTML(str)
    return type(str) == "string" and str:find("<[%a/][^>]*>") ~= nil
end

local function extractSource(obj)
    local src = ""

    pcall(function()
        local tb = obj:FindFirstChild("SL_CodeTextBox")
        if tb and tb:IsA("TextBox") and #tb.Text > 0 then src = tb.Text end
    end)
    if src == "" then pcall(function()
        local sv = obj:FindFirstChild("Source")
        if sv and sv:IsA("StringValue") and #sv.Value > 0 then src = sv.Value end
    end) end
    if src == "" then pcall(function()
        local s = obj.Source
        if type(s) == "string" and #s > 0 then src = s end
    end) end
    if src == "" then pcall(function()
        if getscriptsource then
            local s = getscriptsource(obj)
            if s and #s > 0 then src = s end
        end
    end) end
    if src == "" then pcall(function()
        if decompile then
            local s = decompile(obj)
            if s and #s > 0 then src = s end
        end
    end) end

    if isHTML(src) then src = stripRichText(src) end
    src = src:gsub("\0", "")
    if src == "" then src = "-- [ Source kosong ]\nprint('imported')" end
    return src
end

local function countLines(str)
    local n = 1
    for _ in str:gmatch("\n") do n = n + 1 end
    return n
end

local function applyTextBoxFix(tb, cleanSrc)
    local lineCount  = countLines(cleanSrc)
    local minHeight  = math.max(lineCount * 19 + 40, 200)

    tb.AutomaticSize         = Enum.AutomaticSize.None
    tb.Size                  = UDim2.new(1, -52, 0, minHeight)
    tb.Position              = UDim2.new(0, 52, 0, 0)
    tb.BackgroundColor3      = Color3.fromRGB(15, 15, 15)
    tb.BackgroundTransparency = 0
    tb.TextColor3            = Color3.fromRGB(210, 210, 210)
    tb.TextSize              = 14
    tb.TextXAlignment        = Enum.TextXAlignment.Left
    tb.TextYAlignment        = Enum.TextYAlignment.Top
    tb.MultiLine             = true
    tb.ClearTextOnFocus      = false
    tb.BorderSizePixel       = 0
    tb.ZIndex                = 4

    -- Pastikan SaveChangesTo ada (wajib untuk Studio Lite)
    local saveRef = tb:FindFirstChild("SaveChangesTo")
    if not saveRef then
        saveRef        = Instance.new("ObjectValue")
        saveRef.Name   = "SaveChangesTo"
        saveRef.Value  = tb
        saveRef.Parent = tb
    else
        saveRef.Value = tb
    end

    -- TIDAK membuat SL_ColorizeAndEditLocal LocalScript
    -- karena menyebabkan error "lacking capability RunClientScript"
    -- Studio Lite asli yang akan inject colorizer-nya sendiri
end

local function injectSource(scriptObj, cleanSrc)
    pcall(function() scriptObj:SetAttribute("Source", cleanSrc) end)

    local sv = scriptObj:FindFirstChild("Source")
    if sv and sv:IsA("StringValue") then
        sv.Value = cleanSrc
    else
        if sv then sv:Destroy() end
        local newSv    = Instance.new("StringValue")
        newSv.Name     = "Source"
        newSv.Value    = cleanSrc
        newSv.Parent   = scriptObj
    end

    local tb = scriptObj:FindFirstChild("SL_CodeTextBox")

    if tb and tb:IsA("TextBox") then
        -- TextBox sudah ada: update text & fix ukuran
        tb.RichText = false
        tb.Text     = cleanSrc
        applyTextBoxFix(tb, cleanSrc)

        task.delay(0.15, function()
            pcall(function()
                tb.RichText = true
                local t = tb.Text
                tb.Text = ""
                tb.Text = t
            end)
        end)
    else
        -- Buat TextBox baru sesuai spec Studio Lite
        local newTb = Instance.new("TextBox")
        newTb.Name               = "SL_CodeTextBox"
        newTb.RichText           = false
        newTb.Text               = cleanSrc
        newTb.MultiLine          = true
        newTb.ClearTextOnFocus   = false
        newTb.TextEditable        = true
        newTb.AutoLocalize       = false
        newTb.BorderSizePixel    = 0
        newTb.ZIndex             = 4
        newTb.AutomaticSize      = Enum.AutomaticSize.None
        newTb.BackgroundColor3       = Color3.fromRGB(15, 15, 15)
        newTb.BackgroundTransparency = 0
        newTb.TextColor3             = Color3.fromRGB(210, 210, 210)
        newTb.TextSize               = 14
        newTb.TextXAlignment         = Enum.TextXAlignment.Left
        newTb.TextYAlignment         = Enum.TextYAlignment.Top

        pcall(function()
            newTb.FontFace = Font.new(
                "rbxasset://fonts/families/Inconsolata.json",
                Enum.FontWeight.Regular,
                Enum.FontStyle.Normal
            )
        end)
        if newTb.Font == Enum.Font.Legacy then
            newTb.Font = Enum.Font.Code
        end

        -- SaveChangesTo wajib ada, LocalScript TIDAK dibuat
        local saveRef       = Instance.new("ObjectValue")
        saveRef.Name        = "SaveChangesTo"
        saveRef.Value       = newTb
        saveRef.Parent      = newTb

        newTb.Parent = scriptObj
        applyTextBoxFix(newTb, cleanSrc)

        task.delay(0.2, function()
            pcall(function() newTb.RichText = true end)
        end)
    end

    -- Fix ukuran semua descendant SL_CodeTextBox juga
    task.delay(0.35, function()
        pcall(function()
            for _, desc in ipairs(scriptObj:GetDescendants()) do
                if desc.Name == "SL_CodeTextBox" and desc:IsA("TextBox") then
                    local src2 = desc.Text ~= "" and desc.Text or cleanSrc
                    if isHTML(src2) then src2 = stripRichText(src2) end
                    applyTextBoxFix(desc, src2)
                end
            end
        end)
    end)
end

local function safeList(p)
    if not listfiles then return nil end
    local ok, r = pcall(listfiles, p)
    return ok and r or nil
end

local function fileName(p) return p:match("([^/\\]+)$") or p end

local PATHS = {"workspace", "Delta/workspace", "Android/Delta/workspace", "../workspace", ""}

local function scanAll()
    local out, seen = {}, {}
    for _, p in ipairs(PATHS) do
        local list = safeList(p)
        if list then
            for _, fp in ipairs(list) do
                local n = fileName(fp)
                if n:lower():match("%.rbxm$") and not seen[n] then
                    seen[n] = true
                    table.insert(out, {name = n, path = fp})
                end
            end
        end
    end
    return out
end

local function doImport(filePath, fname)
    if not getcustomasset then return false, "Executor tidak mendukung getcustomasset." end
    local ok, err = pcall(function()
        local url = getcustomasset(filePath) or getcustomasset(fname)
        if not url then error("getcustomasset gagal: " .. tostring(filePath)) end

        local objects = game:GetObjects(url)
        local folder  = Instance.new("Folder")
        folder.Name   = "Imported_" .. fname:gsub("%.rbxm$", "")

        -- =====================================================
        -- PHYSICS PROPERTY ENGINE v5
        -- executor tidak load Anchored/CanCollide dari rbxm.
        -- Studio Lite simpan nilai asli di SL_Anchored & SL_CanCollide.
        -- Kita baca attribute itu dan apply ke property.
        -- Untuk file non-Studio-Lite: default Anchored=true, CanCollide ikut Roblox.
        -- =====================================================

        local function applyProps(part)
            if not part:IsA("BasePart") then return end
            pcall(function()
                -- === ANCHORED ===
                -- Baca SL_Anchored (Studio Lite attribute)
                local slAnchored = part:GetAttribute("SL_Anchored")
                if slAnchored ~= nil then
                    -- Pakai nilai asli dari Studio Lite
                    part.Anchored = slAnchored
                else
                    -- Tidak ada SL_Anchored = file bukan dari Studio Lite
                    -- Default: anchor semua agar tidak jatuh
                    part.Anchored = true
                end

                -- === CANCOLLIDE ===
                -- Baca SL_CanCollide (Studio Lite attribute)
                local slCanCollide = part:GetAttribute("SL_CanCollide")
                if slCanCollide ~= nil then
                    -- Pakai nilai asli dari Studio Lite
                    part.CanCollide = slCanCollide
                end
                -- Jika tidak ada SL_CanCollide: biarkan default Roblox (true)
            end)
        end

        local function applyDeep(root)
            applyProps(root)
            for _, desc in ipairs(root:GetDescendants()) do
                applyProps(desc)
            end
        end

        -- Process semua objects dari file
        for _, obj in ipairs(objects) do
            if obj.ClassName == "CoreGui" or obj:IsA("ServiceProvider") then
                pcall(function() obj:Destroy() end)
            else
                -- Apply props sebelum di-parent (physics belum jalan)
                applyDeep(obj)

                obj.Parent = folder

                -- Apply lagi setelah di-parent
                applyDeep(obj)

                for _, desc in ipairs(obj:GetDescendants()) do
                    if desc:IsA("LuaSourceContainer") then
                        injectSource(desc, extractSource(desc))
                    end
                end
                if obj:IsA("LuaSourceContainer") then
                    injectSource(obj, extractSource(obj))
                end
            end
        end

        -- Apply ke seluruh folder sebelum masuk workspace
        applyDeep(folder)

        -- DescendantAdded: handle part yang load async
        local descConn = folder.DescendantAdded:Connect(function(desc)
            if desc:IsA("BasePart") then
                applyProps(desc)
                task.defer(function() applyProps(desc) end)
                task.delay(0.1, function() applyProps(desc) end)
                task.delay(0.5, function() applyProps(desc) end)
            end
        end)

        -- Masuk workspace
        folder.Parent = workspace

        -- Apply lagi setelah masuk workspace
        applyDeep(folder)

        -- Monitor loop: 60fps selama 5 detik
        -- Setiap part yang property-nya berubah, langsung re-apply dari SL_ attribute
        task.spawn(function()
            local elapsed = 0
            while elapsed < 5 do
                task.wait(1/60)
                elapsed = elapsed + (1/60)
                if not folder or not folder.Parent then break end
                pcall(function()
                    for _, desc in ipairs(folder:GetDescendants()) do
                        if desc:IsA("BasePart") then
                            local slA = desc:GetAttribute("SL_Anchored")
                            local slC = desc:GetAttribute("SL_CanCollide")

                            -- Fix Anchored
                            if slA ~= nil then
                                if desc.Anchored ~= slA then
                                    desc.Anchored = slA
                                end
                            elseif not desc.Anchored then
                                -- Non-SL file: pastikan tidak jatuh
                                desc.Anchored = true
                            end

                            -- Fix CanCollide
                            if slC ~= nil and desc.CanCollide ~= slC then
                                desc.CanCollide = slC
                            end
                        end
                    end
                end)
            end

            -- Setelah 5 detik: monitor lebih jarang (setiap 2 detik, 30 kali)
            for i = 1, 30 do
                task.wait(2)
                if not folder or not folder.Parent then break end
                pcall(function() applyDeep(folder) end)
            end

            pcall(function() descConn:Disconnect() end)
        end)

        task.delay(0.5, function() pcall(function()
            local gui   = LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("StudioGui")
            local panel = gui and gui:FindFirstChild("ExplorerPanel")
            local sel   = panel and panel:FindFirstChild("SetSelection")
            if sel then sel:Invoke({folder}) end
        end) end)
    end)
    return ok, tostring(err)
end

-- ==========================================================
-- SAVE / LOAD ENGINE (Studio Lite Compatible)
-- ==========================================================

local SLEvent = nil
pcall(function()
    local rs = game:GetService("ReplicatedStorage")
    local slf = rs:FindFirstChild("StudioLiteFolder")
    if slf then
        SLEvent = slf:FindFirstChild("ServerFunctions")
    end
end)

local function color3ToSL(c)
    return {Scale=255, R=math.round(c.R*255), G=math.round(c.G*255), B=math.round(c.B*255)}
end

local function cframeToSL(cf)
    local x,y,z,r00,r01,r02,r10,r11,r12,r20,r21,r22 = cf:GetComponents()
    return {X=x,Y=y,Z=z,R00=r00,R01=r01,R02=r02,R10=r10,R11=r11,R12=r12,R20=r20,R21=r21,R22=r22}
end

local function vec3ToSL(v)
    return {X=v.X, Y=v.Y, Z=v.Z}
end

local function partToSL(part)
    return {
        ClassName     = part.ClassName,
        Name          = part.Name,
        CFrame        = cframeToSL(part.CFrame),
        Size          = vec3ToSL(part.Size),
        Anchored      = part.Anchored,
        SL_Anchored   = part:GetAttribute("SL_Anchored"),
        CanCollide    = part.CanCollide,
        SL_CanCollide = part:GetAttribute("SL_CanCollide"),
        Color         = color3ToSL(part.Color),
        Transparency  = part.Transparency,
        Locked        = part.Locked,
        Archivable    = part.Archivable,
    }
end

-- Forward declare dulu agar bisa saling memanggil
local objectToSL

objectToSL = function(obj)
    local t = {ClassName = obj.ClassName, Name = obj.Name}

    if obj:IsA("BasePart") then
        t = partToSL(obj)
    elseif obj:IsA("Model") then
        if obj.PrimaryPart then
            t.WorldPivot = cframeToSL(obj:GetPivot())
        end
    elseif obj:IsA("LuaSourceContainer") then
        local src = ""
        pcall(function()
            local tb = obj:FindFirstChild("SL_CodeTextBox")
            if tb and tb:IsA("TextBox") then src = tb.Text end
        end)
        t.Source = src
    end

    -- Rekursif children (kecuali BasePart sudah handle sendiri)
    if not obj:IsA("BasePart") then
        for _, child in ipairs(obj:GetChildren()) do
            if child:IsA("BasePart") or child:IsA("Model")
            or child:IsA("Folder") or child:IsA("LuaSourceContainer") then
                t[child.Name] = objectToSL(child)
            end
        end
    end

    return t
end

local function buildSLPayload(saveName, targetFolder)
    local wsData = {
        Name = "Workspace",
        ClassName = "Folder",
        Baseplate = {
            ClassName="Part", Name="Baseplate",
            Anchored=true, SL_Anchored=true,
            Locked=true, SL_CanCollide=true,
            EnableFluidForces=false,
            Color={Scale=255,R=91,G=91,B=91},
            CFrame={R11=1,R01=0,R00=1,R21=0,Y=-8,X=0,R02=0,Z=0,R22=1,R10=0,R20=0,R12=0},
            Size={Y=16,X=2048,Z=2048},
        },
        SpawnLocation = {
            ClassName="SpawnLocation", Name="SpawnLocation",
            Anchored=true, SL_Anchored=true, SL_CanCollide=true,
            CanCollide=false, Duration=0, EnableFluidForces=false,
            CFrame={R11=1,R01=0,R00=1,R21=0,Y=0.5,X=0,R02=0,Z=0,R22=1,R10=0,R20=0,R12=0},
            Size={Y=1,X=12,Z=12},
        },
    }

    -- Masukkan semua isi targetFolder ke wsData
    for _, child in ipairs(targetFolder:GetChildren()) do
        wsData[child.Name] = objectToSL(child)
    end

    return {
        Name      = saveName,
        ClassName = "Folder",
        Workspace = wsData,
        Lighting  = {
            Name="Lighting", ClassName="Folder",
            Brightness=3.1352660655975, ClockTime=14.5,
            TimeOfDay="14:30:00", GlobalShadows=true,
            EnvironmentDiffuseScale=1, EnvironmentSpecularScale=1,
            ExposureCompensation=0, FogEnd=100000, FogStart=0,
            ShadowSoftness=0.20000000298023, Archivable=true,
            SL_Technology="Enum.Technology.Future",
            Ambient={Scale=255,R=70,G=70,B=70},
            OutdoorAmbient={Scale=255,R=70,G=70,B=70},
            ColorShift_Bottom={Scale=255,R=0,G=0,B=0},
            ColorShift_Top={Scale=255,R=0,G=0,B=0},
            FogColor={Scale=255,R=192,G=192,B=192},
        },
        Teams = {Name="Teams", ClassName="Folder"},
        StarterPlayer = {
            Name="StarterPlayer", ClassName="Folder",
            CharacterWalkSpeed=16, CharacterMaxSlopeAngle=89,
            CharacterJumpHeight=7.2000918388367,
            CameraMaxZoomDistance=128, CameraMinZoomDistance=0.5,
            HealthDisplayDistance=100, NameDisplayDistance=100,
            AutoJumpEnabled=true, LoadCharacterAppearance=true,
            CharacterUseJumpPower=false,
            CameraMode={EnumType="CameraMode", Name="Classic"},
        },
    }
end

local function doSave(saveName, targetFolder)
    if not SLEvent then
        return false, "Studio Lite tidak ditemukan di game ini."
    end
    if not targetFolder or not targetFolder.Parent then
        return false, "Folder tidak valid."
    end
    local ok, err = pcall(function()
        local payload = buildSLPayload(saveName, targetFolder)
        SLEvent:InvokeServer("Save", payload, "2", "", false)
    end)
    return ok, tostring(err)
end


local function ApplyGoldShine(element)
    element.TextColor3 = Color3.fromRGB(255, 255, 255)
    local grad = Instance.new("UIGradient", element)
    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   Color3.fromRGB(255, 180, 0)),
        ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 200, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 180)),
        ColorSequenceKeypoint.new(0.6, Color3.fromRGB(255, 200, 0)),
        ColorSequenceKeypoint.new(1,   Color3.fromRGB(255, 180, 0))
    })
    grad.Rotation = 45
    task.spawn(function()
        while task.wait() do
            if not element.Parent then break end
            for i = -1, 1, 0.03 do
                grad.Offset = Vector2.new(i, 0)
                task.wait(0.02)
            end
            task.wait(1.5)
        end
    end)
end

-- ==========================================================
-- UI PANEL & DASHBOARD
-- ==========================================================
local ToggleButton = Instance.new("ImageButton")
ToggleButton.Size = UDim2.new(0, 35, 0, 35)
ToggleButton.Position = UDim2.new(0.02, 0, 0.5, -17)
ToggleButton.BackgroundColor3 = Color3.fromRGB(15, 10, 10)
ToggleButton.Image = "rbxthumb://type=Asset&id=88888855574965&w=150&h=150"
ToggleButton.ScaleType = Enum.ScaleType.Fit
ToggleButton.Active = true
ToggleButton.Draggable = true
ToggleButton.ZIndex = 50
ToggleButton.Parent = ScreenGui
Instance.new("UICorner", ToggleButton).CornerRadius = UDim.new(0, 10)

local ToggleStroke = Instance.new("UIStroke", ToggleButton)
ToggleStroke.Thickness = 2.5
ToggleStroke.Color = Color3.fromRGB(255, 255, 255)

local ToggleGradient = Instance.new("UIGradient", ToggleStroke)
ToggleGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0,   Color3.fromRGB(150, 10, 10)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(1,   Color3.fromRGB(150, 10, 10))
})

task.spawn(function()
    local rot = 0
    while task.wait() do
        if not ScreenGui.Parent then break end
        rot = (rot + 3) % 360
        ToggleGradient.Rotation = rot
    end
end)

local MainPanel = Instance.new("Frame")
MainPanel.Size = UDim2.new(0, 530, 0, 330)
MainPanel.Position = UDim2.new(0.5, -265, 0.5, -165)
MainPanel.BackgroundColor3 = Color3.fromRGB(12, 9, 9)
MainPanel.BorderSizePixel = 0
MainPanel.Visible = false
MainPanel.Active = true
MainPanel.Draggable = true
MainPanel.ZIndex = 50
MainPanel.Parent = ScreenGui
Instance.new("UICorner", MainPanel).CornerRadius = UDim.new(0, 10)

local MainStroke = Instance.new("UIStroke", MainPanel)
MainStroke.Thickness = 2
MainStroke.Color = Color3.fromRGB(180, 25, 25)

local CloseBtn = Instance.new("TextButton", MainPanel)
CloseBtn.Size = UDim2.new(0, 25, 0, 25)
CloseBtn.Position = UDim2.new(1, -35, 0, 15)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 16
CloseBtn.ZIndex = 60
CloseBtn.MouseEnter:Connect(function() TweenService:Create(CloseBtn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(255, 60, 60)}):Play() end)
CloseBtn.MouseLeave:Connect(function() TweenService:Create(CloseBtn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(150, 150, 150)}):Play() end)

local SideBar = Instance.new("Frame")
SideBar.Size = UDim2.new(0, 160, 1, 0)
SideBar.BackgroundColor3 = Color3.fromRGB(18, 12, 12)
SideBar.BorderSizePixel = 0
SideBar.ZIndex = 50
SideBar.Parent = MainPanel
Instance.new("UICorner", SideBar).CornerRadius = UDim.new(0, 10)

local SideBarFiller = Instance.new("Frame")
SideBarFiller.Size = UDim2.new(0, 15, 1, 0)
SideBarFiller.Position = UDim2.new(1, -15, 0, 0)
SideBarFiller.BackgroundColor3 = Color3.fromRGB(18, 12, 12)
SideBarFiller.BorderSizePixel = 0
SideBarFiller.ZIndex = 50
SideBarFiller.Parent = SideBar

local SideBarLine = Instance.new("Frame")
SideBarLine.Size = UDim2.new(0, 1, 1, 0)
SideBarLine.Position = UDim2.new(1, -1, 0, 0)
SideBarLine.BackgroundColor3 = Color3.fromRGB(50, 20, 20)
SideBarLine.BorderSizePixel = 0
SideBarLine.ZIndex = 51
SideBarLine.Parent = SideBar

local Title1 = Instance.new("TextLabel", SideBar)
Title1.Size = UDim2.new(1, 0, 0, 20)
Title1.Position = UDim2.new(0, 0, 0, 20)
Title1.BackgroundTransparency = 1
Title1.Text = "AFTERLIFE"
Title1.TextColor3 = Color3.fromRGB(255, 50, 50)
Title1.Font = Enum.Font.GothamBlack
Title1.TextSize = 16
Title1.TextXAlignment = Enum.TextXAlignment.Center
Title1.ZIndex = 52

local Title2 = Instance.new("TextLabel", SideBar)
Title2.Size = UDim2.new(1, 0, 0, 15)
Title2.Position = UDim2.new(0, 0, 0, 40)
Title2.BackgroundTransparency = 1
Title2.Text = "P R O J E C T"
Title2.TextColor3 = Color3.fromRGB(180, 180, 180)
Title2.Font = Enum.Font.GothamBold
Title2.TextSize = 9
Title2.TextXAlignment = Enum.TextXAlignment.Center
Title2.ZIndex = 52

local Divider = Instance.new("Frame", SideBar)
Divider.Size = UDim2.new(0.7, 0, 0, 1)
Divider.Position = UDim2.new(0.15, 0, 0, 65)
Divider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Divider.BorderSizePixel = 0
Divider.ZIndex = 52
local DivGrad = Instance.new("UIGradient", Divider)
DivGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0,   Color3.fromRGB(18, 12, 12)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 40, 40)),
    ColorSequenceKeypoint.new(1,   Color3.fromRGB(18, 12, 12))
})

local CurrentTab = "Assets"

local function CreateNavButton(txt, y, isActive)
    local btn = Instance.new("TextButton", SideBar)
    btn.Size = UDim2.new(0, 130, 0, 32)
    btn.Position = UDim2.new(0, 15, 0, y)
    btn.BackgroundColor3 = isActive and Color3.fromRGB(220, 25, 25) or Color3.fromRGB(25, 18, 18)
    btn.Text = "  " .. txt
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 11
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.ZIndex = 52
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    return btn
end

local BtnAssets = CreateNavButton("📁 ASSETS", 90, true)
local BtnVip    = CreateNavButton("💎 VIP MENU", 130, false)
local BtnSave   = CreateNavButton("💾 SAVE/LOAD", 175, false)
local BtnRescan = CreateNavButton("🔄 RESCAN", 220, false)

local ProfileFrame = Instance.new("Frame")
ProfileFrame.Size = UDim2.new(1, -20, 0, 45)
ProfileFrame.Position = UDim2.new(0, 10, 1, -55)
ProfileFrame.BackgroundTransparency = 1
ProfileFrame.ZIndex = 52
ProfileFrame.Parent = SideBar

local AvatarImg = Instance.new("ImageLabel", ProfileFrame)
AvatarImg.Size = UDim2.new(0, 36, 0, 36)
AvatarImg.Position = UDim2.new(0, 0, 0, 4)
AvatarImg.BackgroundColor3 = Color3.fromRGB(30, 20, 20)
AvatarImg.ZIndex = 52
Instance.new("UICorner", AvatarImg).CornerRadius = UDim.new(1, 0)
task.spawn(function()
    pcall(function()
        local content = game:GetService("Players"):GetUserThumbnailAsync(
            LocalPlayer.UserId,
            Enum.ThumbnailType.HeadShot,
            Enum.ThumbnailSize.Size420x420
        )
        AvatarImg.Image = content
    end)
end)

local ProfName = Instance.new("TextLabel", ProfileFrame)
ProfName.Size = UDim2.new(1, -45, 0, 15)
ProfName.Position = UDim2.new(0, 45, 0, 5)
ProfName.BackgroundTransparency = 1
ProfName.Text = LocalPlayer.DisplayName
ProfName.Font = Enum.Font.GothamBold
ProfName.TextSize = 12
ProfName.TextXAlignment = Enum.TextXAlignment.Left
ProfName.TextTruncate = Enum.TextTruncate.AtEnd
ProfName.ZIndex = 52
if IS_PREMIUM then ApplyGoldShine(ProfName) else ProfName.TextColor3 = Color3.fromRGB(255, 255, 255) end

local ProfUser = Instance.new("TextLabel", ProfileFrame)
ProfUser.Size = UDim2.new(1, -45, 0, 12)
ProfUser.Position = UDim2.new(0, 45, 0, 20)
ProfUser.BackgroundTransparency = 1
ProfUser.Text = "@" .. LocalPlayer.Name
ProfUser.TextColor3 = Color3.fromRGB(150, 150, 150)
ProfUser.Font = Enum.Font.Gotham
ProfUser.TextSize = 10
ProfUser.TextXAlignment = Enum.TextXAlignment.Left
ProfUser.TextTruncate = Enum.TextTruncate.AtEnd
ProfUser.ZIndex = 52

local ProfID = Instance.new("TextLabel", ProfileFrame)
ProfID.Size = UDim2.new(1, -45, 0, 10)
ProfID.Position = UDim2.new(0, 45, 0, 33)
ProfID.BackgroundTransparency = 1
ProfID.Text = "ID: " .. LocalPlayer.UserId
ProfID.TextColor3 = Color3.fromRGB(255, 60, 60)
ProfID.Font = Enum.Font.GothamBold
ProfID.TextSize = 9
ProfID.TextXAlignment = Enum.TextXAlignment.Left
ProfID.ZIndex = 52

-- Save/Load Frame
local SaveFrame = Instance.new("Frame", MainPanel)
SaveFrame.Size = UDim2.new(1, -160, 1, 0)
SaveFrame.Position = UDim2.new(0, 160, 0, 0)
SaveFrame.BackgroundTransparency = 1
SaveFrame.Visible = false
SaveFrame.ZIndex = 50

local SaveTitle = Instance.new("TextLabel", SaveFrame)
SaveTitle.Size = UDim2.new(1, -20, 0, 25)
SaveTitle.Position = UDim2.new(0, 20, 0, 15)
SaveTitle.BackgroundTransparency = 1
SaveTitle.Text = "💾 Save / Load"
SaveTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
SaveTitle.Font = Enum.Font.GothamBlack
SaveTitle.TextSize = 18
SaveTitle.TextXAlignment = Enum.TextXAlignment.Left
SaveTitle.ZIndex = 51

local SaveSub = Instance.new("TextLabel", SaveFrame)
SaveSub.Size = UDim2.new(1, -20, 0, 15)
SaveSub.Position = UDim2.new(0, 20, 0, 38)
SaveSub.BackgroundTransparency = 1
SaveSub.Text = "Save & load project ke Studio Lite"
SaveSub.TextColor3 = Color3.fromRGB(150, 150, 150)
SaveSub.Font = Enum.Font.Gotham
SaveSub.TextSize = 11
SaveSub.TextXAlignment = Enum.TextXAlignment.Left
SaveSub.ZIndex = 51

-- Input nama save
local SaveNameBox = Instance.new("TextBox", SaveFrame)
SaveNameBox.Size = UDim2.new(1, -40, 0, 32)
SaveNameBox.Position = UDim2.new(0, 20, 0, 68)
SaveNameBox.BackgroundColor3 = Color3.fromRGB(22, 16, 16)
SaveNameBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SaveNameBox.PlaceholderText = "Nama save (contoh: MyProject)"
SaveNameBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
SaveNameBox.Text = ""
SaveNameBox.Font = Enum.Font.Gotham
SaveNameBox.TextSize = 12
SaveNameBox.ClearTextOnFocus = false
SaveNameBox.ZIndex = 52
SaveNameBox.BorderSizePixel = 0
Instance.new("UICorner", SaveNameBox).CornerRadius = UDim.new(0, 6)
Instance.new("UIStroke", SaveNameBox).Color = Color3.fromRGB(80, 30, 30)

-- Label pilih folder
local FolderLabel = Instance.new("TextLabel", SaveFrame)
FolderLabel.Size = UDim2.new(1, -40, 0, 15)
FolderLabel.Position = UDim2.new(0, 20, 0, 108)
FolderLabel.BackgroundTransparency = 1
FolderLabel.Text = "Pilih folder Imported_ yang mau disave:"
FolderLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
FolderLabel.Font = Enum.Font.Gotham
FolderLabel.TextSize = 10
FolderLabel.TextXAlignment = Enum.TextXAlignment.Left
FolderLabel.ZIndex = 51

-- Scroll list folder imported
local FolderScroll = Instance.new("ScrollingFrame", SaveFrame)
FolderScroll.Size = UDim2.new(1, -40, 0, 80)
FolderScroll.Position = UDim2.new(0, 20, 0, 125)
FolderScroll.BackgroundColor3 = Color3.fromRGB(16, 12, 12)
FolderScroll.BorderSizePixel = 0
FolderScroll.ScrollBarThickness = 3
FolderScroll.ScrollBarImageColor3 = Color3.fromRGB(200, 40, 40)
FolderScroll.ZIndex = 52
Instance.new("UICorner", FolderScroll).CornerRadius = UDim.new(0, 6)

local FolderList = Instance.new("UIListLayout", FolderScroll)
FolderList.Padding = UDim.new(0, 4)
FolderList.SortOrder = Enum.SortOrder.LayoutOrder
FolderList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    FolderScroll.CanvasSize = UDim2.new(0, 0, 0, FolderList.AbsoluteContentSize.Y + 6)
end)

local selectedFolder = nil
local selectedFolderBtn = nil

local function refreshFolderList()
    for _, c in pairs(FolderScroll:GetChildren()) do
        if c:IsA("TextButton") then c:Destroy() end
    end
    selectedFolder = nil
    selectedFolderBtn = nil
    for _, obj in pairs(workspace:GetChildren()) do
        if obj:IsA("Folder") and obj.Name:sub(1, 9) == "Imported_" then
            local btn = Instance.new("TextButton", FolderScroll)
            btn.Size = UDim2.new(1, -6, 0, 24)
            btn.BackgroundColor3 = Color3.fromRGB(28, 20, 20)
            btn.BorderSizePixel = 0
            btn.Text = "  📁 " .. obj.Name
            btn.TextColor3 = Color3.fromRGB(210, 210, 210)
            btn.Font = Enum.Font.Gotham
            btn.TextSize = 11
            btn.TextXAlignment = Enum.TextXAlignment.Left
            btn.ZIndex = 53
            Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
            btn.MouseButton1Click:Connect(function()
                if selectedFolderBtn then
                    selectedFolderBtn.BackgroundColor3 = Color3.fromRGB(28, 20, 20)
                    selectedFolderBtn.TextColor3 = Color3.fromRGB(210, 210, 210)
                end
                selectedFolder = obj
                selectedFolderBtn = btn
                btn.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
                btn.TextColor3 = Color3.fromRGB(255, 255, 255)
                -- Auto-isi nama save dari nama folder
                if SaveNameBox.Text == "" then
                    SaveNameBox.Text = obj.Name:gsub("Imported_", "")
                end
            end)
        end
    end
end

-- Tombol Save
local DoSaveBtn = Instance.new("TextButton", SaveFrame)
DoSaveBtn.Size = UDim2.new(1, -40, 0, 30)
DoSaveBtn.Position = UDim2.new(0, 20, 0, 215)
DoSaveBtn.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
DoSaveBtn.BorderSizePixel = 0
DoSaveBtn.Text = "💾  SAVE KE STUDIO LITE"
DoSaveBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DoSaveBtn.Font = Enum.Font.GothamBold
DoSaveBtn.TextSize = 12
DoSaveBtn.ZIndex = 52
Instance.new("UICorner", DoSaveBtn).CornerRadius = UDim.new(0, 6)

DoSaveBtn.MouseButton1Click:Connect(function()
    CheckSecurity()
    local saveName = SaveNameBox.Text
    if saveName == "" then
        ShowNotification("ERROR", "Isi nama save dulu!", 4, false)
        return
    end
    if not selectedFolder then
        ShowNotification("ERROR", "Pilih folder Imported_ dulu!", 4, false)
        return
    end
    DoSaveBtn.Text = "⏳ Saving..."
    DoSaveBtn.BackgroundColor3 = Color3.fromRGB(100, 80, 0)
    task.spawn(function()
        local ok, msg = doSave(saveName, selectedFolder)
        if ok then
            DoSaveBtn.BackgroundColor3 = Color3.fromRGB(35, 170, 70)
            DoSaveBtn.Text = "✓ SAVED!"
            ShowNotification("SAVE", "Project berhasil disave: " .. saveName, 5, IS_PREMIUM)
        else
            DoSaveBtn.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
            DoSaveBtn.Text = "✗ GAGAL"
            ShowNotification("ERROR", "Gagal save: " .. tostring(msg):sub(1,40), 6, false)
            warn("[Save]", msg)
        end
        task.wait(2)
        DoSaveBtn.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
        DoSaveBtn.Text = "💾  SAVE KE STUDIO LITE"
    end)
end)

-- Status info
local SaveInfo = Instance.new("TextLabel", SaveFrame)
SaveInfo.Size = UDim2.new(1, -40, 0, 30)
SaveInfo.Position = UDim2.new(0, 20, 0, 255)
SaveInfo.BackgroundTransparency = 1
SaveInfo.Text = "ℹ️ Save otomatis ke sistem Studio Lite.
Bisa diload ulang dari menu Studio Lite."
SaveInfo.TextColor3 = Color3.fromRGB(120, 120, 120)
SaveInfo.Font = Enum.Font.Gotham
SaveInfo.TextSize = 10
SaveInfo.TextXAlignment = Enum.TextXAlignment.Left
SaveInfo.TextWrapped = true
SaveInfo.ZIndex = 51

local ContentFrame = Instance.new("Frame", MainPanel)
ContentFrame.Size = UDim2.new(1, -160, 1, 0)
ContentFrame.Position = UDim2.new(0, 160, 0, 0)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Visible = true
ContentFrame.ZIndex = 50

local DashTitle = Instance.new("TextLabel", ContentFrame)
DashTitle.Size = UDim2.new(1, -20, 0, 25)
DashTitle.Position = UDim2.new(0, 20, 0, 15)
DashTitle.BackgroundTransparency = 1
DashTitle.Text = "Dashboard"
DashTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
DashTitle.Font = Enum.Font.GothamBlack
DashTitle.TextSize = 18
DashTitle.TextXAlignment = Enum.TextXAlignment.Left
DashTitle.ZIndex = 51

local DashSub = Instance.new("TextLabel", ContentFrame)
DashSub.Size = UDim2.new(1, -20, 0, 15)
DashSub.Position = UDim2.new(0, 20, 0, 38)
DashSub.BackgroundTransparency = 1
DashSub.Text = "Manage your local assets."
DashSub.TextColor3 = Color3.fromRGB(150, 150, 150)
DashSub.Font = Enum.Font.Gotham
DashSub.TextSize = 11
DashSub.TextXAlignment = Enum.TextXAlignment.Left
DashSub.ZIndex = 51

local StatsCard = Instance.new("Frame", ContentFrame)
StatsCard.Size = UDim2.new(0, 150, 0, 55)
StatsCard.Position = UDim2.new(0, 20, 0, 65)
StatsCard.BackgroundColor3 = Color3.fromRGB(22, 16, 16)
StatsCard.ZIndex = 51
Instance.new("UICorner", StatsCard).CornerRadius = UDim.new(0, 6)
Instance.new("UIStroke", StatsCard).Color = Color3.fromRGB(50, 25, 25)

local StatsValue = Instance.new("TextLabel", StatsCard)
StatsValue.Size = UDim2.new(1, -15, 0, 25)
StatsValue.Position = UDim2.new(0, 15, 0, 8)
StatsValue.BackgroundTransparency = 1
StatsValue.Text = "0"
StatsValue.TextColor3 = Color3.fromRGB(255, 60, 60)
StatsValue.Font = Enum.Font.GothamBlack
StatsValue.TextSize = 18
StatsValue.TextXAlignment = Enum.TextXAlignment.Left
StatsValue.ZIndex = 52

local StatsTitle = Instance.new("TextLabel", StatsCard)
StatsTitle.Size = UDim2.new(1, -15, 0, 15)
StatsTitle.Position = UDim2.new(0, 15, 0, 32)
StatsTitle.BackgroundTransparency = 1
StatsTitle.Text = "Total .rbxm Files"
StatsTitle.TextColor3 = Color3.fromRGB(160, 160, 160)
StatsTitle.Font = Enum.Font.Gotham
StatsTitle.TextSize = 10
StatsTitle.TextXAlignment = Enum.TextXAlignment.Left
StatsTitle.ZIndex = 52

local LimitCard = Instance.new("Frame", ContentFrame)
LimitCard.Size = UDim2.new(0, 150, 0, 55)
LimitCard.Position = UDim2.new(0, 185, 0, 65)
LimitCard.BackgroundColor3 = Color3.fromRGB(22, 16, 16)
LimitCard.ZIndex = 51
Instance.new("UICorner", LimitCard).CornerRadius = UDim.new(0, 6)
Instance.new("UIStroke", LimitCard).Color = Color3.fromRGB(50, 25, 25)

local LimitValueText = Instance.new("TextLabel", LimitCard)
LimitValueText.BackgroundTransparency = 1
LimitValueText.Font = Enum.Font.GothamBlack
LimitValueText.TextXAlignment = Enum.TextXAlignment.Left
LimitValueText.ZIndex = 52

local LimitTitle = Instance.new("TextLabel", LimitCard)
LimitTitle.BackgroundTransparency = 1
LimitTitle.Font = Enum.Font.Gotham
LimitTitle.TextXAlignment = Enum.TextXAlignment.Left
LimitTitle.ZIndex = 52

if IS_PREMIUM then
    LimitValueText.Text = "VIP USERS"
    LimitValueText.TextSize = 15
    LimitValueText.Size = UDim2.new(1, -15, 0, 20)
    LimitValueText.Position = UDim2.new(0, 15, 0, 5)
    ApplyGoldShine(LimitValueText)
    LimitTitle.Text = "Kamu bisa import terus menerus tanpa batas."
    LimitTitle.TextColor3 = Color3.fromRGB(160, 160, 160)
    LimitTitle.TextSize = 9
    LimitTitle.TextWrapped = true
    LimitTitle.Size = UDim2.new(1, -15, 0, 25)
    LimitTitle.Position = UDim2.new(0, 15, 0, 24)
else
    LimitValueText.Text = limitData.count .. "/" .. MAX_DAILY_LIMIT
    LimitValueText.TextColor3 = Color3.fromRGB(255, 180, 50)
    LimitValueText.TextSize = 18
    LimitValueText.Size = UDim2.new(1, -15, 0, 25)
    LimitValueText.Position = UDim2.new(0, 15, 0, 8)
    LimitTitle.Text = "Daily Imports"
    LimitTitle.TextColor3 = Color3.fromRGB(160, 160, 160)
    LimitTitle.TextSize = 10
    LimitTitle.Size = UDim2.new(1, -15, 0, 15)
    LimitTitle.Position = UDim2.new(0, 15, 0, 32)
end

local ListLabel = Instance.new("TextLabel", ContentFrame)
ListLabel.Size = UDim2.new(1, -20, 0, 20)
ListLabel.Position = UDim2.new(0, 20, 0, 135)
ListLabel.BackgroundTransparency = 1
ListLabel.Text = "Recent Assets"
ListLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ListLabel.Font = Enum.Font.GothamBold
ListLabel.TextSize = 12
ListLabel.TextXAlignment = Enum.TextXAlignment.Left
ListLabel.ZIndex = 51

local AssetList = Instance.new("ScrollingFrame", ContentFrame)
AssetList.Size = UDim2.new(1, -40, 1, -170)
AssetList.Position = UDim2.new(0, 20, 0, 160)
AssetList.BackgroundTransparency = 1
AssetList.ScrollBarThickness = 4
AssetList.ScrollBarImageColor3 = Color3.fromRGB(200, 40, 40)
AssetList.BorderSizePixel = 0
AssetList.ZIndex = 51

local ListLayout = Instance.new("UIListLayout", AssetList)
ListLayout.Padding = UDim.new(0, 8)
ListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    AssetList.CanvasSize = UDim2.new(0, 0, 0, ListLayout.AbsoluteContentSize.Y + 10)
end)

local VipFrame = Instance.new("Frame", MainPanel)
VipFrame.Size = UDim2.new(1, -160, 1, 0)
VipFrame.Position = UDim2.new(0, 160, 0, 0)
VipFrame.BackgroundTransparency = 1
VipFrame.Visible = false
VipFrame.ZIndex = 50

local VipTitle = Instance.new("TextLabel", VipFrame)
VipTitle.Size = UDim2.new(1, -20, 0, 25)
VipTitle.Position = UDim2.new(0, 20, 0, 15)
VipTitle.BackgroundTransparency = 1
VipTitle.Text = "Premium VIP"
VipTitle.Font = Enum.Font.GothamBlack
VipTitle.TextSize = 18
VipTitle.TextXAlignment = Enum.TextXAlignment.Left
VipTitle.ZIndex = 51
ApplyGoldShine(VipTitle)

local VipSub = Instance.new("TextLabel", VipFrame)
VipSub.Size = UDim2.new(1, -20, 0, 15)
VipSub.Position = UDim2.new(0, 20, 0, 38)
VipSub.BackgroundTransparency = 1
VipSub.Text = "Unlock unlimited daily imports!"
VipSub.TextColor3 = Color3.fromRGB(150, 150, 150)
VipSub.Font = Enum.Font.Gotham
VipSub.TextSize = 11
VipSub.TextXAlignment = Enum.TextXAlignment.Left
VipSub.ZIndex = 51

local VipBox = Instance.new("Frame", VipFrame)
VipBox.Size = UDim2.new(1, -40, 0, 160)
VipBox.Position = UDim2.new(0, 20, 0, 75)
VipBox.BackgroundColor3 = Color3.fromRGB(22, 16, 16)
VipBox.ZIndex = 51
Instance.new("UICorner", VipBox).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", VipBox).Color = Color3.fromRGB(180, 25, 25)

local PriceTag = Instance.new("TextLabel", VipBox)
PriceTag.Size = UDim2.new(1, -20, 0, 30)
PriceTag.Position = UDim2.new(0, 15, 0, 10)
PriceTag.BackgroundTransparency = 1
PriceTag.Text = "Harga: Rp 20.000 / Permanen"
PriceTag.TextColor3 = Color3.fromRGB(255, 255, 255)
PriceTag.Font = Enum.Font.GothamBlack
PriceTag.TextSize = 16
PriceTag.TextXAlignment = Enum.TextXAlignment.Left
PriceTag.ZIndex = 52

local Benefit1 = Instance.new("TextLabel", VipBox)
Benefit1.Size = UDim2.new(1, -20, 0, 20)
Benefit1.Position = UDim2.new(0, 15, 0, 45)
Benefit1.BackgroundTransparency = 1
Benefit1.Text = "✔️ Tidak perlu menunggu 24 jam"
Benefit1.TextColor3 = Color3.fromRGB(200, 200, 200)
Benefit1.Font = Enum.Font.GothamSemibold
Benefit1.TextSize = 12
Benefit1.TextXAlignment = Enum.TextXAlignment.Left
Benefit1.ZIndex = 52

local Benefit2 = Instance.new("TextLabel", VipBox)
Benefit2.Size = UDim2.new(1, -20, 0, 20)
Benefit2.Position = UDim2.new(0, 15, 0, 65)
Benefit2.BackgroundTransparency = 1
Benefit2.Text = "✔️ Full akses bebas import file unlimited"
Benefit2.TextColor3 = Color3.fromRGB(200, 200, 200)
Benefit2.Font = Enum.Font.GothamSemibold
Benefit2.TextSize = 12
Benefit2.TextXAlignment = Enum.TextXAlignment.Left
Benefit2.ZIndex = 52

local Benefit3 = Instance.new("TextLabel", VipBox)
Benefit3.Size = UDim2.new(1, -20, 0, 20)
Benefit3.Position = UDim2.new(0, 15, 0, 85)
Benefit3.BackgroundTransparency = 1
Benefit3.Text = "✔️ Role VIP khusus di sistem script"
Benefit3.TextColor3 = Color3.fromRGB(200, 200, 200)
Benefit3.Font = Enum.Font.GothamSemibold
Benefit3.TextSize = 12
Benefit3.TextXAlignment = Enum.TextXAlignment.Left
Benefit3.ZIndex = 52

local BuyBtn = Instance.new("TextButton", VipBox)
BuyBtn.Size = UDim2.new(1, -30, 0, 32)
BuyBtn.Position = UDim2.new(0, 15, 1, -42)
BuyBtn.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
BuyBtn.Text = "BUY VIA WHATSAPP"
BuyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
BuyBtn.Font = Enum.Font.GothamBold
BuyBtn.TextSize = 13
BuyBtn.ZIndex = 52
Instance.new("UICorner", BuyBtn).CornerRadius = UDim.new(0, 6)
BuyBtn.MouseEnter:Connect(function() TweenService:Create(BuyBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(220, 40, 40)}):Play() end)
BuyBtn.MouseLeave:Connect(function() TweenService:Create(BuyBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(180, 30, 30)}):Play() end)
BuyBtn.MouseButton1Click:Connect(function()
    CheckSecurity()
    local waNumber  = "6280000000000"
    local waMessage = "Halo+bang,+saya+mau+beli+VIP+Afterlife+Project.+ID+Roblox+saya:+" .. tostring(LocalPlayer.UserId)
    local waLink    = "https://wa.me/" .. waNumber .. "?text=" .. waMessage
    if setclipboard then
        setclipboard(waLink)
        BuyBtn.Text = "LINK WA TERSALIN!"
        BuyBtn.BackgroundColor3 = Color3.fromRGB(35, 170, 70)
        task.wait(2.5)
        BuyBtn.Text = "BUY VIA WHATSAPP"
        BuyBtn.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
    else
        BuyBtn.Text = "EXECUTOR TIDAK SUPPORT"
    end
end)

-- ==========================================================
-- EVENT LISTENERS & BEHAVIOR
-- ==========================================================
local isAnimating = false

local function SwitchTab(tabName)
    CurrentTab = tabName
    ContentFrame.Visible = false
    VipFrame.Visible     = false
    SaveFrame.Visible    = false
    BtnAssets.BackgroundColor3 = Color3.fromRGB(25, 18, 18)
    BtnVip.BackgroundColor3    = Color3.fromRGB(25, 18, 18)
    BtnSave.BackgroundColor3   = Color3.fromRGB(25, 18, 18)

    if tabName == "Assets" then
        BtnAssets.BackgroundColor3 = Color3.fromRGB(220, 25, 25)
        ContentFrame.Visible = true
    elseif tabName == "Vip" then
        BtnVip.BackgroundColor3 = Color3.fromRGB(220, 25, 25)
        VipFrame.Visible = true
    elseif tabName == "Save" then
        BtnSave.BackgroundColor3 = Color3.fromRGB(220, 25, 25)
        SaveFrame.Visible = true
        refreshFolderList()
    end
end

BtnAssets.MouseButton1Click:Connect(function() SwitchTab("Assets") end)
BtnVip.MouseButton1Click:Connect(function() SwitchTab("Vip") end)
BtnSave.MouseButton1Click:Connect(function() SwitchTab("Save") end)

local function UpdateHover(btn, tabName)
    btn.MouseEnter:Connect(function()
        if CurrentTab ~= tabName then TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 25, 25)}):Play() end
    end)
    btn.MouseLeave:Connect(function()
        if CurrentTab ~= tabName then TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(25, 18, 18)}):Play() end
    end)
end
UpdateHover(BtnAssets, "Assets")
UpdateHover(BtnVip, "Vip")
UpdateHover(BtnSave, "Save")
UpdateHover(BtnRescan, "Rescan")

ToggleButton.MouseButton1Click:Connect(function()
    if isAnimating then return end
    isAnimating = true
    CheckSecurity()
    MainPanel.Size = UDim2.new(0, 480, 0, 280)
    MainPanel.Position = UDim2.new(0.5, -240, 0.5, -140)
    MainPanel.Visible = true
    ToggleButton.Visible = false
    local tween = TweenService:Create(MainPanel, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 530, 0, 330),
        Position = UDim2.new(0.5, -265, 0.5, -165)
    })
    tween:Play()
    tween.Completed:Wait()
    isAnimating = false
end)

CloseBtn.MouseButton1Click:Connect(function()
    if isAnimating then return end
    isAnimating = true
    CheckSecurity()
    local tween = TweenService:Create(MainPanel, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 480, 0, 280),
        Position = UDim2.new(0.5, -240, 0.5, -140)
    })
    tween:Play()
    tween.Completed:Wait()
    MainPanel.Visible    = false
    ToggleButton.Visible = true
    isAnimating = false
end)

local function CreateAssetItem(fileName, filePath)
    local item = Instance.new("Frame", AssetList)
    item.Size = UDim2.new(1, -10, 0, 42)
    item.BackgroundColor3 = Color3.fromRGB(20, 16, 16)
    item.ZIndex = 52
    Instance.new("UICorner", item).CornerRadius = UDim.new(0, 6)
    item.MouseEnter:Connect(function() TweenService:Create(item, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(28, 22, 22)}):Play() end)
    item.MouseLeave:Connect(function() TweenService:Create(item, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(20, 16, 16)}):Play() end)

    local icon = Instance.new("TextLabel", item)
    icon.Size = UDim2.new(0, 28, 0, 28)
    icon.Position = UDim2.new(0, 8, 0, 7)
    icon.BackgroundColor3 = Color3.fromRGB(35, 25, 25)
    icon.Text = "📄"
    icon.Font = Enum.Font.Gotham
    icon.TextSize = 14
    icon.ZIndex = 53
    Instance.new("UICorner", icon).CornerRadius = UDim.new(0, 5)

    local nameLabel = Instance.new("TextLabel", item)
    nameLabel.Size = UDim2.new(1, -120, 1, 0)
    nameLabel.Position = UDim2.new(0, 45, 0, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = fileName
    nameLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
    nameLabel.Font = Enum.Font.GothamSemibold
    nameLabel.TextSize = 11
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.TextTruncate = Enum.TextTruncate.AtEnd
    nameLabel.ZIndex = 53

    local importBtn = Instance.new("TextButton", item)
    importBtn.Size = UDim2.new(0, 65, 0, 24)
    importBtn.Position = UDim2.new(1, -75, 0, 9)
    importBtn.BackgroundColor3 = Color3.fromRGB(150, 30, 30)
    importBtn.Text = "IMPORT"
    importBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    importBtn.Font = Enum.Font.GothamBold
    importBtn.TextSize = 10
    importBtn.ZIndex = 53
    Instance.new("UICorner", importBtn).CornerRadius = UDim.new(0, 5)

    importBtn.MouseEnter:Connect(function()
        if importBtn.Text == "IMPORT" then TweenService:Create(importBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(180, 40, 40)}):Play() end
    end)
    importBtn.MouseLeave:Connect(function()
        if importBtn.Text == "IMPORT" then TweenService:Create(importBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(150, 30, 30)}):Play() end
    end)

    local busy = false
    importBtn.MouseButton1Click:Connect(function()
        CheckSecurity()
        if busy then return end
        if not IS_PREMIUM and limitData.count >= MAX_DAILY_LIMIT then
            importBtn.Text = "MAX LIMIT"
            importBtn.BackgroundColor3 = Color3.fromRGB(100, 30, 30)
            ShowNotification("IMPORT LIMIT", "Kamu telah mencapai batas harian.", 6, false)
            task.wait(2)
            importBtn.BackgroundColor3 = Color3.fromRGB(150, 30, 30)
            importBtn.Text = "IMPORT"
            return
        end
        busy = true
        importBtn.Text = "⏳"
        importBtn.BackgroundColor3 = Color3.fromRGB(200, 100, 0)
        task.spawn(function()
            local ok, msg = doImport(filePath, fileName)
            if ok then
                if not IS_PREMIUM then
                    limitData.count = limitData.count + 1
                    SaveLimitData()
                    LimitValueText.Text = limitData.count .. "/" .. MAX_DAILY_LIMIT
                end
                ShowNotification("IMPORT", "SUCCESS IMPORT FILE", 5, IS_PREMIUM)
                importBtn.BackgroundColor3 = Color3.fromRGB(35, 170, 70)
                importBtn.Text = "SUCCESS"
            else
                ShowNotification("ERROR", "Gagal mengimport file.", 5, false)
                importBtn.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
                importBtn.Text = "ERROR"
            end
            task.wait(2)
            importBtn.BackgroundColor3 = Color3.fromRGB(150, 30, 30)
            importBtn.Text = "IMPORT"
            busy = false
        end)
    end)
end

local function LoadFiles()
    CheckSecurity()
    for _, child in pairs(AssetList:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end
    local files = scanAll()
    local count = 0
    if files then
        for _, fd in ipairs(files) do
            CreateAssetItem(fd.name, fd.path)
            count = count + 1
        end
    end
    StatsValue.Text = tostring(count)
end

BtnRescan.MouseButton1Click:Connect(function()
    CheckSecurity()
    BtnRescan.Text = "  ⏳ Scanning..."
    task.wait(0.5)
    LoadFiles()
    BtnRescan.Text = "  🔄 RESCAN"
end)

LoadFiles()
