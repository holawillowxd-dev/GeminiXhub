-- [[ GeminiXhub v12.6 - FULL FINAL EDITION ]]
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

_G.Key = "GXM-2026-TOP1"
local States = { Speed=16, Jump=50, ESP=false, InfJump=false, Noclip=false, Fly=false }

local function EstiloVoid(instancia, radio)
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, radio or 8)
    Corner.Parent = instancia
end

local function CrearMenuTabs()
    if CoreGui:FindFirstChild("GeminiX_Ultimate") then CoreGui.GeminiX_Ultimate:Destroy() end
    local MainGui = Instance.new("ScreenGui", CoreGui)
    MainGui.Name = "GeminiX_Ultimate"

    -- Botón para reabrir el menú (Flotante)
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
    MainFrame.Size = UDim2.new(0, 550, 0, 400)
    MainFrame.Position = UDim2.new(0.5, -275, 0.5, -200)
    MainFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
    EstiloVoid(MainFrame, 12)
    Instance.new("UIStroke", MainFrame).Color = Color3.fromRGB(0, 170, 255)

    -- BOTÓN MINIMIZAR (LA X ARRIBA A LA DERECHA)
    local Close = Instance.new("TextButton", MainFrame)
    Close.Size = UDim2.new(0, 30, 0, 30)
    Close.Position = UDim2.new(1, -35, 0, 5)
    Close.Text = "X"
    Close.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    Close.TextColor3 = Color3.fromRGB(255, 255, 255)
    Close.Font = Enum.Font.GothamBold
    EstiloVoid(Close, 6)
    
    Close.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
        OpenBtn.Visible = true
    end)
    OpenBtn.MouseButton1Click:Connect(function()
        MainFrame.Visible = true
        OpenBtn.Visible = false
    end)

    local Sidebar = Instance.new("Frame", MainFrame)
    Sidebar.Size = UDim2.new(0, 130, 1, 0)
    Sidebar.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
    EstiloVoid(Sidebar, 12)

    local PagesContainer = Instance.new("Frame", MainFrame)
    PagesContainer.Size = UDim2.new(1, -145, 1, -10)
    PagesContainer.Position = UDim2.new(0, 135, 0, 5)
    PagesContainer.BackgroundTransparency = 1

    local TabPages = {}
    local function CrearPagina(nombre)
        local P = Instance.new("ScrollingFrame", PagesContainer)
        P.Name = nombre
        P.Size = UDim2.new(1, 0, 1, 0)
        P.BackgroundTransparency = 1
        P.Visible = false
        P.CanvasSize = UDim2.new(0, 0, 3, 0)
        P.ScrollBarThickness = 0
        TabPages[nombre] = P
        return P
    end

    local P_Main = CrearPagina("Main")
    local P_NotVis = CrearPagina("NotVis")
    local P_World = CrearPagina("World")
    local P_Visuals = CrearPagina("Visuals")

    local function MostrarPagina(n)
        for _, p in pairs(TabPages) do p.Visible = false end
        TabPages[n].Visible = true
    end
    MostrarPagina("Main")

    local function BotonTab(txt, y, target)
        local B = Instance.new("TextButton", Sidebar)
        B.Size = UDim2.new(0.9, 0, 0, 30)
        B.Position = UDim2.new(0.05, 0, 0, y)
        B.Text = txt
        B.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        B.TextColor3 = Color3.fromRGB(255, 255, 255)
        EstiloVoid(B, 5)
        B.MouseButton1Click:Connect(function() MostrarPagina(target) end)
    end

    BotonTab("General", 50, "Main")
    BotonTab("Hacks", 90, "NotVis")
    BotonTab("World", 130, "World")
    BotonTab("Visuals", 170, "Visuals")

    local function Toggle(txt, pag, y, callback)
        local T = Instance.new("TextButton", pag)
        T.Size = UDim2.new(0.95, 0, 0, 35)
        T.Position = UDim2.new(0, 0, 0, y)
        T.Text = txt .. ": OFF"
        T.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        T.TextColor3 = Color3.fromRGB(200, 200, 200)
        EstiloVoid(T, 5)
        local act = false
        T.MouseButton1Click:Connect(function()
            act = not act
            T.Text = txt .. (act and ": ON" or ": OFF")
            T.BackgroundColor3 = act and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(25, 25, 25)
            callback(act)
        end)
    end

    -- CONTENIDO
    Toggle("Reset Char", P_Main, 0, function() LocalPlayer.Character:BreakJoints() end)
    Toggle("Speed 100", P_NotVis, 0, function(s) LocalPlayer.Character.Humanoid.WalkSpeed = s and 100 or 16 end)
    Toggle("Jump 150", P_NotVis, 45, function(s) LocalPlayer.Character.Humanoid.JumpPower = s and 150 or 50 end)
    Toggle("Inf Jump", P_NotVis, 90, function(s) States.InfJump = s end)
    Toggle("Low Gravity", P_World, 0, function(s) workspace.Gravity = s and 50 or 196.2 end)
    Toggle("ESP Wallhack", P_Visuals, 0, function(s)
        States.ESP = s
        if s then for _, v in pairs(Players:GetPlayers()) do if v ~= LocalPlayer and v.Character then local h = Instance.new("Highlight", v.Character) h.Name = "GeminiESP" h.FillColor = Color3.fromRGB(0, 170, 255) end end
        else for _, v in pairs(Players:GetPlayers()) do if v.Character and v.Character:FindFirstChild("GeminiESP") then v.Character.GeminiESP:Destroy() end end end
    end)
end

-- SISTEMA DE KEY
local function StartKeySystem()
    local KeyGui = Instance.new("ScreenGui", CoreGui)
    local Main = Instance.new("Frame", KeyGui)
    Main.Size = UDim2.new(0, 320, 0, 200)
    Main.Position = UDim2.new(0.5, -160, 0.5, -100)
    Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    EstiloVoid(Main, 12)
    Instance.new("UIStroke", Main).Color = Color3.fromRGB(0, 170, 255)

    local GetKey = Instance.new("TextButton", Main)
    GetKey.Size = UDim2.new(0.8, 0, 0, 40)
    GetKey.Position = UDim2.new(0.1, 0, 0.2, 0)
    GetKey.Text = "COPY KEY 🔑"
    GetKey.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    GetKey.TextColor3 = Color3.fromRGB(255, 255, 255)
    EstiloVoid(GetKey, 8)
    GetKey.MouseButton1Click:Connect(function()
        setclipboard(_G.Key)
        GetKey.Text = "COPIED! ✅"
    end)

    local Input = Instance.new("TextBox", Main)
    Input.Size = UDim2.new(0.8, 0, 0, 40)
    Input.Position = UDim2.new(0.1, 0, 0.45, 0)
    Input.PlaceholderText = "Paste key here..."
    Input.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Input.TextColor3 = Color3.fromRGB(255, 255, 255)
    EstiloVoid(Input, 8)

    local Login = Instance.new("TextButton", Main)
    Login.Size = UDim2.new(0.8, 0, 0, 40)
    Login.Position = UDim2.new(0.1, 0, 0.7, 0)
    Login.Text = "LOGIN 🚀"
    Login.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    EstiloVoid(Login, 8)
    Login.MouseButton1Click:Connect(function()
        if Input.Text == _G.Key then KeyGui:Destroy() CrearMenuTabs() end
    end)
end

UserInputService.JumpRequest:Connect(function() if States.InfJump then LocalPlayer.Character.Humanoid:ChangeState("Jumping") end end)
StartKeySystem()
