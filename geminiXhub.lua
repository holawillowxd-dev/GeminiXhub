-- [[ GeminiXhub v9.0 - COMMUNITY GOALS UPDATE ]]
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
    MainGui.Name = "GeminiX_Community"

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
    MainFrame.Size = UDim2.new(0, 450, 0, 300)
    MainFrame.Position = UDim2.new(0.5, -225, 0.5, -150)
    MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    EstiloVoid(MainFrame, 10)
    Instance.new("UIStroke", MainFrame).Color = Color3.fromRGB(0, 170, 255)

    local Sidebar = Instance.new("Frame", MainFrame)
    Sidebar.Size = UDim2.new(0, 120, 1, 0)
    Sidebar.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
    EstiloVoid(Sidebar, 10)

    local Title = Instance.new("TextLabel", Sidebar)
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.Text = "GEMINIX"
    Title.TextColor3 = Color3.fromRGB(0, 170, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 18
    Title.BackgroundTransparency = 1

    local Pages = Instance.new("Frame", MainFrame)
    Pages.Size = UDim2.new(1, -130, 1, -10)
    Pages.Position = UDim2.new(0, 125, 0, 5)
    Pages.BackgroundTransparency = 1

    local function CrearPagina(nombre)
        local P = Instance.new("ScrollingFrame", Pages)
        P.Name = nombre
        P.Size = UDim2.new(1, 0, 1, 0)
        P.BackgroundTransparency = 1
        P.Visible = false
        P.CanvasSize = UDim2.new(0, 0, 1.2, 0)
        P.ScrollBarThickness = 0
        return P
    end

    local PagMain = CrearPagina("Main")
    local PagCombat = CrearPagina("Combat")
    local PagVisuals = CrearPagina("Visuals")
    local PagInfo = CrearPagina("Info") -- Antes Other

    local function MostrarPagina(nombre)
        for _, p in pairs(Pages:GetChildren()) do p.Visible = false end
        Pages[nombre].Visible = true
    end
    MostrarPagina("Main")

    local function BotonTab(texto, yPos)
        local B = Instance.new("TextButton", Sidebar)
        B.Size = UDim2.new(0.9, 0, 0, 35)
        B.Position = UDim2.new(0.05, 0, 0, yPos)
        B.Text = texto
        B.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        B.TextColor3 = Color3.fromRGB(255, 255, 255)
        B.Font = Enum.Font.Gotham
        EstiloVoid(B, 5)
        B.MouseButton1Click:Connect(function() MostrarPagina(texto) end)
    end

    BotonTab("Main", 60)
    BotonTab("Combat", 100)
    BotonTab("Visuals", 140)
    BotonTab("Info", 180)

    -- CONTENIDO PAGINAS (SISTEMA TOGGLE)
    local function CrearToggle(txt, pag, y, callback)
        local T = Instance.new("TextButton", pag)
        T.Size = UDim2.new(0.95, 0, 0, 40)
        T.Position = UDim2.new(0.025, 0, 0, y)
        T.Text = txt .. ": OFF"
        T.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        T.TextColor3 = Color3.fromRGB(200, 200, 200)
        EstiloVoid(T, 6)
        local act = false
        T.MouseButton1Click:Connect(function()
            act = not act
            T.Text = txt .. (act and ": ON" or ": OFF")
            T.BackgroundColor3 = act and Color3.fromRGB(0, 150, 100) or Color3.fromRGB(25, 25, 25)
            callback(act)
        end)
    end

    CrearToggle("Speed Hack", PagMain, 10, function(s) LocalPlayer.Character.Humanoid.WalkSpeed = s and 100 or 16 end)
    CrearToggle("Super Jump", PagMain, 60, function(s) LocalPlayer.Character.Humanoid.JumpPower = s and 150 or 50 end)
    CrearToggle("Inf Jump", PagMain, 110, function(s) States.InfJump = s end)
    
    CrearToggle("Reset Char", PagCombat, 10, function() LocalPlayer.Character:BreakJoints() end)
    
    CrearToggle("ESP Players", PagVisuals, 10, function(s)
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

    -- SECCIÓN INFO (META DE LIKES)
    local GoalLabel = Instance.new("TextLabel", PagInfo)
    GoalLabel.Size = UDim2.new(0.9, 0, 0, 50)
    GoalLabel.Position = UDim2.new(0.05, 0, 0, 10)
    GoalLabel.Text = "GOAL: 10,000 LIKES FOR NEXT UPDATE"
    GoalLabel.TextColor3 = Color3.fromRGB(255, 200, 0) -- Dorado/Amarillo
    GoalLabel.Font = Enum.Font.GothamBold
    GoalLabel.BackgroundTransparency = 1
    GoalLabel.TextWrapped = true

    local LikeBtn = Instance.new("TextButton", PagInfo)
    LikeBtn.Size = UDim2.new(0.6, 0, 0, 45)
    LikeBtn.Position = UDim2.new(0.2, 0, 0, 70)
    LikeBtn.Text = "👍 DAR LIKE"
    LikeBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    LikeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    LikeBtn.Font = Enum.Font.GothamBold
    EstiloVoid(LikeBtn, 8)

    local liked = false
    LikeBtn.MouseButton1Click:Connect(function()
        if not liked then
            liked = true
            LikeBtn.Text = "GRACIAS! ❤️"
            LikeBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 100)
            print("Like registrado localmente")
        end
    end)

    local Credits = Instance.new("TextLabel", PagInfo)
    Credits.Size = UDim2.new(1, 0, 0, 60)
    Credits.Position = UDim2.new(0, 0, 0, 130)
    Credits.Text = "Developed by GeminiX Team\nVisits: 10,000+\nStatus: Safe"
    Credits.TextColor3 = Color3.fromRGB(150, 150, 150)
    Credits.BackgroundTransparency = 1
    Credits.Font = Enum.Font.Gotham

    -- MINIMIZAR
    local Close = Instance.new("TextButton", Sidebar)
    Close.Size = UDim2.new(0.9, 0, 0, 30)
    Close.Position = UDim2.new(0.05, 0, 1, -40)
    Close.Text = "Minimizar"
    Close.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    EstiloVoid(Close, 5)
    Close.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
        OpenBtn.Visible = true
    end)

    OpenBtn.MouseButton1Click:Connect(function()
        MainFrame.Visible = true
        OpenBtn.Visible = false
    end)
end

-- KEY SYSTEM
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
    EstiloVoid(Input, 5)

    local Enter = Instance.new("TextButton", Main)
    Enter.Size = UDim2.new(0.8, 0, 0, 40)
    Enter.Position = UDim2.new(0.1, 0, 0.6, 0)
    Enter.Text = "Login"
    Enter.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    EstiloVoid(Enter, 5)
    Enter.MouseButton1Click:Connect(function()
        if Input.Text == _G.Key then KeyGui:Destroy() CrearMenuTabs() end
    end)
end

UserInputService.JumpRequest:Connect(function()
    if States.InfJump then LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping") end
end)

StartKeySystem()
