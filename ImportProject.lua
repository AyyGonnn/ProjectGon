
local _1=game;local _2=Instance.new;local _3=Color3.fromRGB;local _4=UDim2.new;local _5=UDim.new;
local _6=ColorSequence.new;local _7=ColorSequenceKeypoint.new;local _8=TweenInfo.new;local _9=Enum;
local _10=pcall;local _11=task.spawn;local _12=task.wait;local _14=string.char;
local _15=string.match;local _16=string.find;local _17=table.insert;local _18=string.lower;
local _19=tostring;local _20=warn;local _21=getcustomasset;local _22=listfiles;

local function _AX()
    local _e=getfenv(0)
    if not _e or (_e.getgenv and not getgenv()) then
        _10(function() _1:GetService(('\80\108\97\121\101\114\115')):FindFirstChildOfClass(('\80\108\97\121\101\114')):Kick(('\x53\x65\x63\x75\x72\x69\x74\x79\x20\x56\x69\x6f\x6c\x61\x74\x69\x6f\x6e')) end)
        while true do end
    end
end
_10(_AX)

local function _BX(t) local s="" for _,v in ipairs(t) do s=s.._14(v) end return s end

local _CG=_1:GetService(_BX({67,111,114,101,71,117,105}))
local _TS=_1:GetService(_BX({84,119,101,101,110,83,101,114,118,105,99,101}))
local _GN=_BX({65,102,116,101,114,76,105,102,101,80,114,111,106,101,99,116})

if _CG:FindFirstChild(_GN) then _CG[_GN]:Destroy() end

local _SG=_2(_BX({83,99,114,101,101,110,71,117,105})) _SG.Name=_GN _SG.IgnoreGuiInset=true _SG.Parent=_CG

-- [1] TOMBOL UTAMA (DIKEMBALIKAN KE AWAL YANG KEREN & NYALA)
local _TB=_2(_BX({84,101,120,116,66,117,116,116,111,110})) 
_TB.Size=_4(0,35,0,35) 
_TB.Position=_4(0.02,0,0.5,-17) 
_TB.BackgroundColor3=_3(15,10,10) 
_TB.Text=_BX({240,159,148,177}) -- Trisula 🔱
_TB.TextColor3=_3(255,40,40) 
_TB.Font=_9.Font.GothamBlack 
_TB.TextSize=18 
_TB.Active=true 
_TB.Draggable=true 
_TB.Parent=_SG

local _TC=_2(_BX({85,73,67,111,114,110,101,114})) _TC.CornerRadius=_5(0,8) _TC.Parent=_TB
local _TSk=_2(_BX({85,73,83,116,114,111,107,101})) _TSk.Color=_3(200,30,30) _TSk.Thickness=1.5 _TSk.Parent=_TB

_11(function()
    while _12(1) do
        _AX()
        if not _SG.Parent then break end
        local t1=_TS:Create(_TSk,_8(1),{Color=_3(255,80,80)}) t1:Play() t1.Completed:Wait()
        local t2=_TS:Create(_TSk,_8(1),{Color=_3(150,20,20)}) t2:Play() t2.Completed:Wait()
    end
end)

local _MP=_2(_BX({70,114,97,109,101})) _MP.Size=_4(0,480,0,280) _MP.Position=_4(0.5,-240,0.5,-140) _MP.BackgroundColor3=_3(10,8,8) _MP.BorderSizePixel=0 _MP.Visible=false _MP.Active=true _MP.Draggable=true _MP.Parent=_SG
local _MC=_2(_BX({85,73,67,111,114,110,101,114})) _MC.CornerRadius=_5(0,10) _MC.Parent=_MP
local _MS=_2(_BX({85,73,83,116,114,111,107,101})) _MS.Color=_3(150,20,20) _MS.Thickness=1.5 _MS.Parent=_MP

local _SB=_2(_BX({70,114,97,109,101})) _SB.Size=_4(0,150,1,0) _SB.BackgroundColor3=_3(16,12,12) _SB.BorderSizePixel=0 _SB.Parent=_MP
local _SBC=_2(_BX({85,73,67,111,114,110,101,114})) _SBC.CornerRadius=_5(0,10) _SBC.Parent=_SB
local _SCv=_2(_BX({70,114,97,109,101})) _SCv.Size=_4(0,10,1,0) _SCv.Position=_4(1,-10,0,0) _SCv.BackgroundColor3=_3(16,12,12) _SCv.BorderSizePixel=0 _SCv.Parent=_SB
local _SLn=_2(_BX({70,114,97,109,101})) _SLn.Size=_4(0,1,1,0) _SLn.Position=_4(1,-1,0,0) _SLn.BackgroundColor3=_3(40,20,20) _SLn.BorderSizePixel=0 _SLn.Parent=_SB

local _T1=_2(_BX({84,101,120,116,76,97,98,101,108})) _T1.Size=_4(1,0,0,20) _T1.Position=_4(0,0,0,15) _T1.BackgroundTransparency=1 _T1.Text=_BX({65,70,84,69,82,76,73,70,69}) _T1.TextColor3=_3(255,40,40) _T1.Font=_9.Font.GothamBlack _T1.TextSize=16 _T1.TextXAlignment=_9.TextXAlignment.Center _T1.ZIndex=2 _T1.Parent=_SB
local _T2=_2(_BX({84,101,120,116,76,97,98,101,108})) _T2.Size=_4(1,0,0,15) _T2.Position=_4(0,0,0,35) _T2.BackgroundTransparency=1 _T2.Text=_BX({80,32,82,32,79,32,74,32,69,32,67,32,84}) _T2.TextColor3=_3(180,180,180) _T2.Font=_9.Font.GothamBold _T2.TextSize=9 _T2.TextXAlignment=_9.TextXAlignment.Center _T2.ZIndex=2 _T2.Parent=_SB

local _DL=_2(_BX({70,114,97,109,101})) _DL.Size=_4(0.7,0,0,2) _DL.Position=_4(0.15,0,0,55) _DL.BackgroundColor3=_3(255,255,255) _DL.BorderSizePixel=0 _DL.ZIndex=2 _DL.Parent=_SB
local _DG=_2(_BX({85,73,71,114,97,100,105,101,110,116})) _DG.Color=_6({_7(0,_3(16,12,12)),_7(0.5,_3(255,40,40)),_7(1,_3(16,12,12))}) _DG.Parent=_DL

local function _NB(txt, y, act)
    _AX()
    local b=_2(_BX({84,101,120,116,66,117,116,116,111,110})) b.Size=_4(0,120,0,30) b.Position=_4(0,15,0,y) b.BackgroundColor3=act and _3(255,20,20) or _3(25,18,18) b.Text="  "..txt b.TextColor3=_3(255,255,255) b.Font=_9.Font.GothamBold b.TextSize=11 b.TextXAlignment=_9.TextXAlignment.Left b.ZIndex=2 b.Parent=_SB
    local c=_2(_BX({85,73,67,111,114,110,101,114})) c.CornerRadius=_5(0,5) c.Parent=b return b
end

-- [2] KATEGORI DIUBAH MENJADI KAPITAL SEMUA (ASSETS & RESCAN)
local _BA=_NB(_BX({102,111,108,100,101,114,32,65,115,115,101,116,115}),80,true) -- Biar otomatis jadi kapital
_BA.Text = "  📁 ASSETS"
local _BR=_NB(_BX({114,101,115,99,97,110}),120,false)
_BR.Text = "  🔄 RESCAN"

local _CT=_2(_BX({70,114,97,109,101})) _CT.Size=_4(1,-150,1,0) _CT.Position=_4(0,150,0,0) _CT.BackgroundTransparency=1 _CT.Parent=_MP
local _CH=_2(_BX({84,101,120,116,76,97,98,101,108})) _CH.Size=_4(1,-20,0,25) _CH.Position=_4(0,15,0,10) _CH.BackgroundTransparency=1 _CH.Text=_BX({68,97,115,104,98,111,97,114,100}) _CH.TextColor3=_3(255,255,255) _CH.Font=_9.Font.GothamBlack _CH.TextSize=16 _CH.TextXAlignment=_9.TextXAlignment.Left _CH.Parent=_CT
local _CS=_2(_BX({84,101,120,116,76,97,98,101,108})) _CS.Size=_4(1,-20,0,15) _CS.Position=_4(0,15,0,30) _CS.BackgroundTransparency=1 _CS.Text=_BX({77,97,110,97,103,101,32,121,111,117,114,32,108,111,99,97,108,32,97,115,115,101,116,115,46}) _CS.TextColor3=_3(150,150,150) _CS.Font=_9.Font.Gotham _CS.TextSize=10 _CS.TextXAlignment=_9.TextXAlignment.Left _CS.Parent=_CT

local _CB=_2(_BX({84,101,120,116,66,117,116,116,111,110})) _CB.Size=_4(0,25,0,25) _CB.Position=_4(1,-30,0,10) _CB.BackgroundTransparency=1 _CB.Text=_BX({88}) _CB.TextColor3=_3(150,150,150) _CB.Font=_9.Font.GothamBold _CB.TextSize=13 _CB.Parent=_CT

local _C1=_2(_BX({70,114,97,109,101})) _C1.Size=_4(0,150,0,50) _C1.Position=_4(0,15,0,55) _C1.BackgroundColor3=_3(20,15,15) _C1.Parent=_CT
local _C1C=_2(_BX({85,73,67,111,114,110,101,114})) _C1C.CornerRadius=_5(0,6) _C1C.Parent=_C1
local _C1S=_2(_BX({85,73,83,116,114,111,107,101})) _C1S.Color=_3(40,20,20) _C1S.Parent=_C1
local _C1V=_2(_BX({84,101,120,116,76,97,98,101,108})) _C1V.Size=_4(1,-10,0,20) _C1V.Position=_4(0,10,0,8) _C1V.BackgroundTransparency=1 _C1V.Text="0" _C1V.TextColor3=_3(255,50,50) _C1V.Font=_9.Font.GothamBlack _C1V.TextSize=16 _C1V.TextXAlignment=_9.TextXAlignment.Left _C1V.Parent=_C1
local _C1T=_2(_BX({84,101,120,116,76,97,98,101,108})) _C1T.Size=_4(1,-10,0,15) _C1T.Position=_4(0,10,0,28) _C1T.BackgroundTransparency=1 _C1T.Text=_BX({84,111,116,97,108,32,46,114,98,120,109,32,70,105,108,101,115}) _C1T.TextColor3=_3(150,150,150) _C1T.Font=_9.Font.Gotham _C1T.TextSize=10 _C1T.TextXAlignment=_9.TextXAlignment.Left _C1T.Parent=_C1

local _LL=_2(_BX({84,101,120,116,76,97,98,101,108})) _LL.Size=_4(1,-20,0,20) _LL.Position=_4(0,15,0,115) _LL.BackgroundTransparency=1 _LL.Text=_BX({82,101,99,101,110,116,32,65,115,115,101,116,115}) _LL.TextColor3=_3(255,255,255) _LL.Font=_9.Font.GothamBold _LL.TextSize=12 _LL.TextXAlignment=_9.TextXAlignment.Left _LL.Parent=_CT

local _SF=_2(_BX({83,99,114,111,108,108,105,110,103,70,114,97,109,101})) _SF.Size=_4(1,-30,1,-145) _SF.Position=_4(0,15,0,135) _SF.BackgroundTransparency=1 _SF.ScrollBarThickness=3 _SF.ScrollBarImageColor3=_3(255,50,50) _SF.Parent=_CT
local _UIL=_2(_BX({85,73,76,105,115,116,76,97,121,111,117,116})) _UIL.Padding=_5(0,6) _UIL.Parent=_SF

_TB.MouseButton1Click:Connect(function()
    _AX()
    _MP.Visible=true _MP.Size=_4(0,400,0,230) _MP.Position=_4(0.5,-200,0.5,-115)
    _TS:Create(_MP,_8(0.4,_9.EasingStyle.Back,_9.EasingDirection.Out),{Size=_4(0,480,0,280),Position=_4(0.5,-240,0.5,-140)}):Play()
    _TB.Visible=false
end)

_CB.MouseButton1Click:Connect(function()
    _AX()
    local tw=_TS:Create(_MP,_8(0.25,_9.EasingStyle.Quad,_9.EasingDirection.In),{Size=_4(0,400,0,230),Position=_4(0.5,-200,0.5,-115)})
    tw:Play() tw.Completed:Wait() _MP.Visible=false _TB.Visible=true
end)

local function _CI(fN)
    _AX()
    local itm=_2(_BX({70,114,97,109,101})) itm.Size=_4(1,-5,0,40) itm.BackgroundColor3=_3(20,16,16) itm.Parent=_SF
    local ic=_2(_BX({85,73,67,111,114,110,101,114})) ic.CornerRadius=_5(0,5) ic.Parent=itm
    local ico=_2(_BX({84,101,120,116,76,97,98,101,108})) ico.Size=_4(0,25,0,25) ico.Position=_4(0,8,0,7) ico.BackgroundColor3=_3(30,20,20) ico.Text="📄" ico.Font=_9.Font.Gotham ico.TextSize=12 ico.Parent=itm
    local icoc=_2(_BX({85,73,67,111,114,110,101,114})) icoc.CornerRadius=_5(0,4) icoc.Parent=ico
    local nbl=_2(_BX({84,101,120,116,76,97,98,101,108})) nbl.Size=_4(0.55,0,1,0) nbl.Position=_4(0,40,0,0) nbl.BackgroundTransparency=1 nbl.Text=fN nbl.TextColor3=_3(230,230,230) nbl.Font=_9.Font.GothamSemibold nbl.TextSize=10 nbl.TextXAlignment=_9.TextXAlignment.Left nbl.TextTruncate=_9.TextTruncate.AtEnd nbl.Parent=itm
    local imp=_2(_BX({84,101,120,116,66,117,116,116,111,110})) imp.Size=_4(0,65,0,22) imp.Position=_4(1,-75,0,9) imp.BackgroundColor3=_3(150,30,30) imp.Text="IMPORT" imp.TextColor3=_3(255,255,255) imp.Font=_9.Font.GothamBold imp.TextSize=9 imp.Parent=itm
    local impc=_2(_BX({85,73,67,111,114,110,101,114})) impc.CornerRadius=_5(0,4) impc.Parent=imp

    imp.MouseButton1Click:Connect(function()
        _AX()
        imp.Text="..." imp.BackgroundColor3=_3(200,100,0)
        local s,e=_10(function()
            local cl=_21(fN) local ob=_1:GetObjects(cl) local p=_1.Players.LocalPlayer local c=p.Character or p.CharacterAdded:Wait() local rt=c:FindFirstChild("HumanoidRootPart")
            for _,o in pairs(ob) do o.Parent=workspace if rt then _10(function() if o:IsA("Model") then o:MoveTo(rt.Position+Vector3.new(0,0,-10)) elseif o:IsA("BasePart") then o.CFrame=rt.CFrame*CFrame.new(0,0,-10) end end) end _12(0.05) end
        end)
        if s then imp.BackgroundColor3=_3(0,180,50) imp.Text="SUCCESS" else _20("ERR: ".._19(e)) imp.BackgroundColor3=_3(200,30,30) imp.Text="ERROR" end
        _12(2) imp.BackgroundColor3=_3(150,30,30) imp.Text="IMPORT"
    end)
end

local function _LF()
    _AX()
    for _,c in pairs(_SF:GetChildren()) do if c:IsA("Frame") then c:Destroy() end end
    local s,f=_10(function() return _22("") end) local cnt=0
    if s and f then
        for _,p in pairs(f) do
            if _15(p,"%.rbxm$") or _15(p,"%.rbxmx$") then
                local fn=_15(p,"([^/\\]+)$") or p _CI(fn) cnt=cnt+1
            end
        end
    end
    _C1V.Text=_19(cnt) _SF.CanvasSize=_4(0,0,0,cnt*46)
end

_BR.MouseButton1Click:Connect(function()
    _AX()
    _BR.Text="  Scanning..." _12(0.5) _LF() _BR.Text="  🔄 RESCAN"
end)

_LF()
