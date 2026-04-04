-- [[ GeminiXhub v10.5 - EMERGENCY FIX ]]
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

_G.Key = "GXM-2026-TOP1"
local States = { Speed = false, Jump = false, ESP = false, InfJump = false }

local function EstiloVoid(instancia, radio)
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, radio or 8)
    Corner.Parent = instancia
end

local function CrearMenuTabs()
    local MainGui = Instance.new("ScreenGui", CoreGui)
    MainGui.Name = "GeminiX_Fixed"

    local OpenBtn = Instance.new("TextButton", MainGui)
    OpenBtn.Size = UDim2.new(0, 50, 0, 50)
    OpenBtn.Position = UDim2.new(0, 10, 0.5, 0)
    OpenBtn.Text = "G"
    OpenBtn.Visible = false
    OpenBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    OpenBtn.Font = Enum.Font.GothamBold
    EstiloVoid(OpenBtn, 25)

    local MainFrame = Instance.new("Frame", MainGui)
    MainFrame.Size = UDim2.new(0, 480, 0, 320)
    MainFrame.Position = UDim2.new(0.5, -240, 0.5, -160)
    MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    EstiloVoid(MainFrame, 12)
    Instance.new("UIStroke", MainFrame).Color = Color3.fromRGB(0, 170, 255)

    local Sidebar = Instance.new("Frame", MainFrame)
    Sidebar.Size = UDim2.new(0, 130, 1, 0)
    Sidebar.BackgroundColor3 = Color3.fromRGB(7, 7, 7)
    EstiloVoid(Sidebar, 12)

    local Pages = Instance.new("Frame", MainFrame)
    Pages.Size = UDim2.new(1, -145, 1, -10)
    Pages.Position = UDim2.new(0, 135, 0, 5)
    Pages.BackgroundTransparency = 1

    local function CrearPagina(nombre)
        local P = Instance.new("ScrollingFrame", Pages)
        P.Name = nombre
        P.Size = UDim2.new(1, 0, 1, 0)
        P.BackgroundTransparency = 1
        P.Visible = false
        P.CanvasSize = UDim2.new(0, 0, 1.5, 0)
        P.ScrollBarThickness = 0
        return P
    end

    local PagMain = CrearPagina("Main")
    local PagNotVisual = CrearPagina("NotVisual")
    local PagVisuals = CrearPagina("Visuals")
    local PagInfo = CrearPagina("Info")

    local function MostrarPagina(nombre)
        for _, p in pairs(Pages:GetChildren()) do p.Visible = false end
        Pages[nombre].Visible = true
    end
    MostrarPagina("Main")

    local function BotonTab(texto, yPos, target)
        local B = Instance.new("TextButton", Sidebar)
        B.Size = UDim2.new(0.9, 0, 0, 35)
        B.Position = UDim2.new(0.05, 0, 0, yPos)
        B.Text = texto
        B.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        B.TextColor3 = Color3.fromRGB(255, 255, 255)
        B.Font = Enum.Font.Gotham
        EstiloVoid(B, 6)
        B.MouseButton1Click:Connect(function() MostrarPagina(target) end)
    end

    BotonTab("Main", 60, "Main")
    BotonTab("Not Visual", 100, "NotVisual")
    BotonTab("Visuals", 140, "Visuals")
    BotonTab("Info", 180, "Info")

    local function CrearToggle(txt, pag, y, callback)
        local T = Instance.new("TextButton", pag)
        T.Size = UDim2.new(0.95, 0, 0, 40)
        T.Position = UDim2.new(0.025, 0, 0, y)
        T.Text = txt .. ": OFF"
        T.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        T.TextColor3 = Color3.fromRGB(220, 220, 220)
        EstiloVoid(T, 6)
        local act = false
        T.MouseButton1Click:Connect(function()
            act = not act
            T.Text = txt .. (act and ": ON" or ": OFF")
            T.BackgroundColor3 = act and Color3.fromRGB(0, 100, 200) or Color3.fromRGB(25, 25, 25)
            callback(act)
        end)
    end

    CrearToggle("Reset Character", PagMain, 10, function() LocalPlayer.Character:BreakJoints() end)
    
    CrearToggle("Speed Flash", PagNotVisual, 40, function(s) LocalPlayer.Character.Humanoid.WalkSpeed = s and 100 or 16 end)
    CrearToggle("Super Jump", PagNotVisual, 90, function(s) LocalPlayer.Character.Humanoid.JumpPower = s and 150 or 50 end)
    CrearToggle("Infinite Jump", PagNotVisual, 140, function(s) States.InfJump = s end)

    CrearToggle("ESP Wallhack", PagVisuals, 10, function(s)
        States.ESP = s
        if s then
            for _, v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer and v.Character then
                    local h = Instance.new("Highlight", v.Character)
                    h.Name = "GeminiESP"
                    h.FillColor = Color3.fromRGB(0, 170, 255)
                end
            end
        else
            for _, v in pairs(Players:GetPlayers()) do
                if v.Character and v.Character:FindFirstChild("GeminiESP") then v.Character.GeminiESP:Destroy() end
            end
        end
    end)

    local LikeBtn = Instance.new("TextButton", PagInfo)
    LikeBtn.Size = UDim2.new(0.8, 0, 0, 45)
    LikeBtn.Position = UDim2.new(0.1, 0, 0, 50)
    LikeBtn.Text = "👍 DAR LIKE"
    LikeBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    EstiloVoid(LikeBtn, 8)
    LikeBtn.MouseButton1Click:Connect(function() LikeBtn.Text = "GRACIAS! ❤️" end)

    local Close = Instance.new("TextButton", Sidebar)
    Close.Size = UDim2.new(0.9, 0, 0, 30)
    Close.Position = UDim2.new(0.05, 1, 1, -40)
    Close.Text = "Minimizar"
    Close.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    EstiloVoid(Close, 6)
    Close.MouseButton1Click:Connect(function() MainFrame.Visible = false OpenBtn.Visible = true end)
    OpenBtn.MouseButton1Click:Connect(function() MainFrame.Visible = true OpenBtn.Visible = false end)
end

local function StartKeySystem()
    local KeyGui = Instance.new("ScreenGui", CoreGui)
    local Main = Instance.new("Frame", KeyGui)
    Main.Size = UDim2.new(0, 300, 0, 160)
    Main.Position = UDim2.new(0.5, -150, 0.5, -80)
    Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    EstiloVoid(Main, 10)
    Instance.new("UIStroke", Main).Color = Color3.fromRGB(0, 170, 255)

    local Input = Instance.new("TextBox", Main)
    Input.Size = UDim2.new(0.8, 0, 0, 40)
    Input.Position = UDim2.new(0.1, 0, 0.2, 0)
    Input.PlaceholderText = "Key..."
    Input.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Input.TextColor3 = Color3.fromRGB(255, 255, 255)
    EstiloVoid(Input, 6)

    local Enter = Instance.new("TextButton", Main)
    Enter.Size = UDim2.new(0.8, 0, 0, 40)
    Enter.Position = UDim2.new(0.1, 0, 0.6, 0)
    Enter.Text = "LOGIN"
    Enter.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    EstiloVoid(Enter, 6)
    Enter.MouseButton1Click:Connect(function()
        if Input.Text == _G.Key then KeyGui:Destroy() CrearMenuTabs() end
    end)
end

UserInputService.JumpRequest:Connect(function()
    if States.InfJump then
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum:ChangeState("Jumping") end
    end
end)

StartKeySystem()
