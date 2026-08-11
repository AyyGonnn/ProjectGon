-- ===================================================
-- 🔱 PREMIUM RBXM IMPORTER (STUDIO LITE)
-- ⚠️ MAXIMUM SECURITY: FULL OBFUSCATION APPLIED
-- ===================================================

local _1=game;local _2=Instance.new;local _3=Color3.fromRGB;local _4=UDim2.new;local _5=UDim.new;
local _6=ColorSequence.new;local _7=ColorSequenceKeypoint.new;local _8=TweenInfo.new;local _9=Enum;
local _10=pcall;local _11=task.spawn;local _12=task.wait;local _13=task.cancel;local _14=string.char;
local _15=string.match;local _16=string.find;local _17=table.insert;local _18=string.lower;
local _19=tostring;local _20=warn;local _21=getcustomasset;local _22=listfiles;

local function _E(t) local s="" for _,v in ipairs(t) do s=s.._14(v) end return s end

local _S1=_E({83,116,97,114,116,101,114,71,117,105}) local _S2=_E({83,101,110,100,78,111,116,105,102,105,99,97,116,105,111,110})
local _S3=_E({67,111,114,101,71,117,105}) local _S4=_E({84,119,101,101,110,83,101,114,118,105,99,101})
local _S5=_E({70,114,97,109,101}) local _S6=_E({84,101,120,116,76,97,98,101,108})
local _S7=_E({84,101,120,116,66,117,116,116,111,110}) local _S8=_E({85,73,67,111,114,110,101,114})
local _S9=_E({85,73,83,116,114,111,107,101}) local _S10=_E({85,73,71,114,97,100,105,101,110,116})
local _S11=_E({84,101,120,116,66,111,120}) local _S12=_E({83,99,114,111,108,108,105,110,103,70,114,97,109,101})
local _S13=_E({85,73,76,105,115,116,76,97,121,111,117,116}) local _S14=_E({83,99,114,101,101,110,71,117,105})
local _S15=_E({66,108,111,111,100,83,116,117,100,105,111,73,109,112,111,114,116,101,114})
local _T1=_E({80,114,111,106,101,99,116,32,66,121,32,71,111,110}) local _T2=_E({83,84,85,68,73,79,32,76,73,84,69,32,73,77,80,79,82,84,69,82})
local _T3=_E({77,111,104,111,110,32,84,117,110,103,103,117}) local _T4=_E({83,67,65,78,32,70,73,76,69})

_10(function() _1:GetService(_S1):SetCore(_S2,{Title=_E({240,159,148,177}),Text=_E({73,110,105,116,105,97,108,105,122,105,110,103,46,46,46}),Duration=3}) end)
local _CG=_1:GetService(_S3) if _CG:FindFirstChild(_S15) then _CG[_S15]:Destroy() end
local _TS=_1:GetService(_S4) local _SG=_2(_S14) _SG.Name=_S15 _SG.IgnoreGuiInset=true _SG.Parent=_CG

local _FL=_2(_S5) _FL.Size=_4(1,0,1,0) _FL.Position=_4(0,0,0,0) _FL.BackgroundColor3=_3(10,8,8) _FL.BorderSizePixel=0 _FL.Active=true _FL.Parent=_SG
local _CC=_2(_S5) _CC.Size=_4(0,400,0,200) _CC.Position=_4(0.5,-200,0.5,-100) _CC.BackgroundTransparency=1 _CC.Parent=_FL
local function _cLT(t,y,f,s,c) local l=_2(_S6) l.Size=_4(1,0,0,20) l.Position=_4(0,0,0,y) l.BackgroundTransparency=1 l.Text=t l.TextColor3=c l.Font=f l.TextSize=s l.TextXAlignment=_9.TextXAlignment.Center l.Parent=_CC return l end

_cLT(_E({61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61}),15,_9.Font.Gotham,14,_3(150,50,50))
_cLT('"'.._T2..'"',40,_9.Font.GothamBlack,16,_3(255,200,200)) _cLT('"'.._T1..'"',65,_9.Font.GothamBold,15,_3(255,50,50))
_cLT(_E({61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61}),90,_9.Font.Gotham,14,_3(150,50,50))
local _SL=_cLT(_T3,130,_9.Font.GothamSemibold,13,_3(200,200,200))

local _BB=_2(_S5) _BB.Size=_4(0.8,0,0,15) _BB.Position=_4(0.1,0,0,160) _BB.BackgroundColor3=_3(25,15,15) _BB.Parent=_CC
local _BBC=_2(_S8) _BBC.CornerRadius=_5(1,0) _BBC.Parent=_BB local _BBS=_2(_S9) _BBS.ApplyStrokeMode=_9.ApplyStrokeMode.Border _BBS.Color=_3(100,30,30) _BBS.Thickness=1 _BBS.Parent=_BB
local _BF=_2(_S5) _BF.Size=_4(0,0,1,0) _BF.BackgroundColor3=_3(255,255,255) _BF.BorderSizePixel=0 _BF.Parent=_BB
local _BFC=_2(_S8) _BFC.CornerRadius=_5(1,0) _BFC.Parent=_BF local _BG=_2(_S10) _BG.Color=_6({_7(0,_3(150,0,0)),_7(1,_3(255,30,30))}) _BG.Parent=_BF

local _OB=_2(_S7) _OB.Size=_4(0,45,0,45) _OB.Position=_4(0.05,0,0.5,-22) _OB.BackgroundColor3=_3(15,12,12) _OB.Text=_E({240,159,148,177}) _OB.TextColor3=_3(255,50,50) _OB.TextSize=25 _OB.Font=_9.Font.GothamBold _OB.Active=true _OB.Draggable=true _OB.Visible=false _OB.Parent=_SG
local _OBC=_2(_S8) _OBC.CornerRadius=_5(0,10) _OBC.Parent=_OB local _OBS=_2(_S9) _OBS.ApplyStrokeMode=_9.ApplyStrokeMode.Border _OBS.Color=_3(255,255,255) _OBS.Thickness=2.5 _OBS.Parent=_OB
local _OG=_2(_S10) _OG.Color=_6({_7(0,_3(90,0,0)),_7(0.5,_3(255,20,20)),_7(1,_3(90,0,0))}) _OG.Parent=_OBS

local _MF=_2(_S5) _MF.Size=_4(0,320,0,410) _MF.Position=_4(0.5,-160,0.5,-205) _MF.BackgroundColor3=_3(18,15,15) _MF.BorderSizePixel=0 _MF.Active=true _MF.Draggable=true _MF.Visible=false _MF.ClipsDescendants=true _MF.Parent=_SG
local _MC=_2(_S8) _MC.CornerRadius=_5(0,10) _MC.Parent=_MF local _MS=_2(_S9) _MS.ApplyStrokeMode=_9.ApplyStrokeMode.Border _MS.Color=_3(255,255,255) _MS.Thickness=2 _MS.Parent=_MF
local _MG=_2(_S10) _MG.Color=_6({_7(0,_3(90,0,0)),_7(0.5,_3(255,20,20)),_7(1,_3(90,0,0))}) _MG.Parent=_MS

local _SB=_2(_S7) _SB.Size=_4(0.9,0,0,35) _SB.Position=_4(0.05,0,0,50) _SB.BackgroundColor3=_3(255,255,255) _SB.Text="" _SB.Parent=_MF
local _SC=_2(_S8) _SC.CornerRadius=_5(0,5) _SC.Parent=_SB local _SGd=_2(_S10) _SGd.Color=_6({_7(0,_3(90,0,0)),_7(0.5,_3(200,20,20)),_7(1,_3(90,0,0))}) _SGd.Parent=_SB
local _SLb=_2(_S6) _SLb.Size=_4(1,0,1,0) _SLb.BackgroundTransparency=1 _SLb.Text=_T4 _SLb.TextColor3=_3(255,255,255) _SLb.Font=_9.Font.GothamBold _SLb.TextSize=14 _SLb.ZIndex=2 _SLb.Parent=_SB

local _SBox=_2(_S11) _SBox.Size=_4(0.9,0,0,30) _SBox.Position=_4(0.05,0,0,95) _SBox.BackgroundColor3=_3(25,18,18) _SBox.TextColor3=_3(255,200,200) _SBox.PlaceholderText=_E({240,159,148,141,32,83,101,97,114,99,104,46,46,46}) _SBox.PlaceholderColor3=_3(150,50,50) _SBox.Font=_9.Font.Gotham _SBox.TextSize=12 _SBox.Text="" _SBox.Parent=_MF
local _SBC=_2(_S8) _SBC.CornerRadius=_5(0,5) _SBC.Parent=_SBox local _SBS=_2(_S9) _SBS.ApplyStrokeMode=_9.ApplyStrokeMode.Border _SBS.Color=_3(100,30,30) _SBS.Thickness=1.5 _SBS.Parent=_SBox

local _HF=_2(_S5) _HF.Size=_4(1,0,0,40) _HF.BackgroundTransparency=1 _HF.Parent=_MF local _HL=_2(_S5) _HL.Size=_4(1,0,0,1) _HL.Position=_4(0,0,1,0) _HL.BackgroundColor3=_3(40,20,20) _HL.BorderSizePixel=0 _HL.Parent=_HF
local _TL=_2(_S6) _TL.Size=_4(1,-50,1,0) _TL.Position=_4(0,15,0,0) _TL.BackgroundTransparency=1 _TL.Text=_E({240,159,148,177,32}).._T2 _TL.TextColor3=_3(255,100,100) _TL.Font=_9.Font.GothamBlack _TL.TextSize=14 _TL.TextXAlignment=_9.TextXAlignment.Left _TL.Parent=_HF
local _CB=_2(_S7) _CB.Size=_4(0,30,0,30) _CB.Position=_4(1,-35,0,5) _CB.BackgroundTransparency=1 _CB.Text="X" _CB.TextColor3=_3(255,50,50) _CB.Font=_9.Font.GothamBold _CB.TextSize=16 _CB.Parent=_HF

local _SF=_2(_S12) _SF.Size=_4(0.9,0,0,260) _SF.Position=_4(0.05,0,0,135) _SF.BackgroundColor3=_3(22,18,18) _SF.ScrollBarThickness=3 _SF.ScrollBarImageColor3=_3(150,50,50) _SF.Parent=_MF
local _SFC=_2(_S8) _SFC.CornerRadius=_5(0,5) _SFC.Parent=_SF local _UILL=_2(_S13) _UILL.Padding=_5(0,6) _UILL.HorizontalAlignment=_9.HorizontalAlignment.Center _UILL.Parent=_SF

_11(function() local r=0 while _12() do if not _SG.Parent then break end r=(r+2)%360 _OG.Rotation=r _MG.Rotation=r _SGd.Rotation=r end end)
_11(function() local d={"",".","..","..."} local i=1 local tA=_11(function() while _12(0.4) do if not _FL.Parent then break end _SL.Text=_T3..d[i] i=i+1 if i>4 then i=1 end end end)
    local tw=_TS:Create(_BF,_8(3.0,_9.EasingStyle.Sine,_9.EasingDirection.Out),{Size=_4(1,0,1,0)}) tw:Play() tw.Completed:Wait() _13(tA) _SL.Text=_E({83,101,108,101,115,97,105,33}) _SL.TextColor3=_3(100,255,100) _12(0.5)
    local fT=_8(1.0,_9.EasingStyle.Quad,_9.EasingDirection.Out) for _,o in pairs(_CC:GetDescendants()) do if o:IsA(_S6) then _TS:Create(o,fT,{TextTransparency=1}):Play() elseif o:IsA(_S5) then _TS:Create(o,fT,{BackgroundTransparency=1}):Play() elseif o:IsA(_S9) then _TS:Create(o,fT,{Transparency=1}):Play() end end
    local fM=_TS:Create(_FL,fT,{BackgroundTransparency=1}) fM:Play() fM.Completed:Wait() _FL:Destroy() _OB.Size=_4(0,0,0,0) _OB.Visible=true _TS:Create(_OB,_8(0.4,_9.EasingStyle.Back),{Size=_4(0,45,0,45)}):Play()
end)

_OB.MouseButton1Click:Connect(function() _OB.Visible=false _MF.Visible=true _MF.Size=_4(0,0,0,0) _MF.Position=_4(0.5,0,0.5,0) _TS:Create(_MF,_8(0.4,_9.EasingStyle.Back,_9.EasingDirection.Out),{Size=_4(0,320,0,410),Position=_4(0.5,-160,0.5,-205)}):Play() end)
_CB.MouseButton1Click:Connect(function() local tw=_TS:Create(_MF,_8(0.3,_9.EasingStyle.Quad,_9.EasingDirection.In),{Size=_4(0,0,0,0),Position=_4(0.5,0,0.5,0)}) tw:Play() tw.Completed:Wait() _MF.Visible=false _OB.Visible=true end)

local _ls={}
local function _cFI(fN)
    local _IF=_2(_S5) _IF.Size=_4(0.96,0,0,40) _IF.BackgroundColor3=_3(35,25,25) _IF.Parent=_SF local _IC=_2(_S8) _IC.CornerRadius=_5(0,5) _IC.Parent=_IF
    local _FNL=_2(_S6) _FNL.Size=_4(0.65,0,1,0) _FNL.Position=_4(0,10,0,0) _FNL.BackgroundTransparency=1 _FNL.Text=fN _FNL.TextColor3=_3(255,200,200) _FNL.TextXAlignment=_9.TextXAlignment.Left _FNL.Font=_9.Font.GothamSemibold _FNL.TextSize=12 _FNL.TextTruncate=_9.TextTruncate.AtEnd _FNL.Parent=_IF
    local _IB=_2(_S7) _IB.Size=_4(0.28,0,0.7,0) _IB.Position=_4(0.68,0,0.15,0) _IB.BackgroundColor3=_3(150,30,30) _IB.TextColor3=_3(255,255,255) _IB.Text=_E({73,77,80,79,82,84}) _IB.Font=_9.Font.GothamBold _IB.TextSize=11 _IB.Parent=_IF local _ICo=_2(_S8) _ICo.CornerRadius=_5(0,4) _ICo.Parent=_IB
    
    _IB.MouseButton1Click:Connect(function()
        _IB.Text="..." _IB.BackgroundColor3=_3(200,100,0)
        local s,e=_10(function()
            local cL=_21(fN) local ob=_1:GetObjects(cL) local p=_1.Players.LocalPlayer local c=p.Character or p.CharacterAdded:Wait() local rt=c:FindFirstChild(_E({72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116}))
            for _,o in pairs(ob) do o.Parent=workspace if rt then _10(function() if o:IsA(_E({77,111,100,101,108})) then o:MoveTo(rt.Position+Vector3.new(0,0,-10)) elseif o:IsA(_E({66,97,115,101,80,97,114,116})) then o.CFrame=rt.CFrame*CFrame.new(0,0,-10) end end) end _12(0.05) end
        end)
        if s then _IB.BackgroundColor3=_3(0,150,50) _IB.Text=_E({83,85,67,67,69,83,83}) else _20(_E({69,82,82,79,82})..": ".._19(e)) _IB.BackgroundColor3=_3(200,30,30) _IB.Text=_E({69,82,82,79,82}) end
        _12(2) _IB.BackgroundColor3=_3(150,30,30) _IB.Text=_E({73,77,80,79,82,84})
    end)
end

local function _rDF(k)
    for _,c in pairs(_SF:GetChildren()) do if c:IsA(_S5) then c:Destroy() end end local h=0
    for _,n in ipairs(_ls) do if k=="" or _16(_18(n),_18(k)) then _cFI(n) h=h+1 end end _SF.CanvasSize=_4(0,0,0,h*46)
end

_SBox:GetPropertyChangedSignal("Text"):Connect(function() _rDF(_SBox.Text) end)
_SB.MouseButton1Click:Connect(function()
    _SLb.Text="..." local s,f=_10(function() return _22("") end)
    if s and f then _ls={} for _,p in pairs(f) do if _15(p,_E({37,46,114,98,120,109,36})) or _15(p,_E({37,46,114,98,120,109,120,36})) then local fn=_15(p,_E({40,91,94,47,92,92,93,43,41,36})) or p _17(_ls,fn) end end _rDF(_SBox.Text) _SLb.Text=#_ls.." ".._E({70,79,85,78,68}) else _SLb.Text=_E({69,82,82,79,82}) end
    _12(1.5) _SLb.Text=_T4
end)
