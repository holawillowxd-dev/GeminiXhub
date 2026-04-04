-- [[ GeminiXhub v12.5 - OFFICIAL GITHUB RELEASE ]]
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local Mouse = LocalPlayer:GetMouse()

_G.Key = "GXM-2026-TOP1"
local States = { Speed=16, Jump=50, ESP=false, InfJump=false, Noclip=false, Fly=false, Spin=false, AutoClick=false }

local function EstiloVoid(instancia, radio)
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, radio or 8)
    Corner.Parent = instancia
end

-- ==========================================
-- FUNCIÓN DEL MENÚ PRINCIPAL (EL HUB)
-- ==========================================
local function CrearMenuTabs()
    if CoreGui:FindFirstChild("GeminiX_Ultimate") then CoreGui.GeminiX_Ultimate:Destroy() end
    local MainGui = Instance.new("ScreenGui", CoreGui)
    MainGui.Name = "GeminiX_Ultimate"

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
        P.CanvasSize = UDim2.new(0, 0, 4, 0)
        P.ScrollBarThickness = 2
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
        B.Font = Enum.Font.Gotham
        EstiloVoid(B, 5)
        B.MouseButton1Click:Connect(function() MostrarPagina(target) end)
    end

    BotonTab("General", 50, "Main")
    BotonTab("Not Visual", 90, "NotVis")
    BotonTab("World & Mix", 130, "World")
    BotonTab("Visuals", 170, "Visuals")

    local function Toggle(txt, pag, y, callback)
        local T = Instance.new("TextButton", pag)
        T.Size = UDim2.new(0.95, 0, 0, 35)
        T.Position = UDim2.new(0, 0, 0, y)
        T.Text = txt .. ": OFF"
        T.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        T.TextColor3 = Color3.fromRGB(200, 200, 200)
        T.Font = Enum.Font.Gotham
        EstiloVoid(T, 5)
        local act = false
        T.MouseButton1Click:Connect(function()
            act = not act
            T.Text = txt .. (act and ": ON" or ": OFF")
            T.BackgroundColor3 = act and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(25, 25, 25)
            callback(act)
        end)
    end

    -- --- CONTENIDO DEL HUB ---
    Toggle("Reset Character", P_Main, 0, function() LocalPlayer.Character:BreakJoints() end)
    Toggle("FPS Boost", P_Main, 40, function(s) if s then for _,v in pairs(game:GetDescendants()) do if v:IsA("BasePart") then v.Material = Enum.Material.SmoothPlastic end end end end)
    Toggle("FOV 120", P_Main, 80, function(s) workspace.CurrentCamera.FieldOfView = s and 120 or 70 end)
    Toggle("Speed 100", P_NotVis, 0, function(s) LocalPlayer.Character.Humanoid.WalkSpeed = s and 100 or 16 end)
    Toggle("Jump 150", P_NotVis, 40, function(s) LocalPlayer.Character.Humanoid.JumpPower = s and 150 or 50 end)
    Toggle("Inf Jump", P_NotVis, 80, function(s) States.InfJump = s end)
    Toggle("Fly (BETA)", P_NotVis, 120, function(s) States.Fly = s end)
    Toggle("Noclip", P_NotVis, 160, function(s) States.Noclip = s end)
    Toggle("Low Gravity", P_World, 0, function(s) workspace.Gravity = s and 50 or 196.2 end)
    Toggle("ESP Wallhack", P_Visuals, 0, function(s)
        States.ESP = s
        if s then for _, v in pairs(Players:GetPlayers()) do if v ~= LocalPlayer and v.Character then local h = Instance.new("Highlight", v.Character) h.Name = "GeminiESP" h.FillColor = Color3.fromRGB(0, 170, 255) end end
        else for _, v in pairs(Players:GetPlayers()) do if v.Character and v.Character:FindFirstChild("GeminiESP") then v.Character.GeminiESP:Destroy() end end end
    end)

    -- LOOPS DE FUNCIONAMIENTO
    RunService.Stepped:Connect(function()
        if States.Noclip and LocalPlayer.Character then for _,v in pairs(LocalPlayer.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end end
    end)

    local Close = Instance.new("TextButton", Sidebar)
    Close.Size = UDim2.new(0.9, 0, 0, 30)
    Close.Position = UDim2.new(0.05, 0, 1, -40)
    Close.Text = "Minimizar"
    Close.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    EstiloVoid(Close, 6)
    Close.MouseButton1Click:Connect(function() MainFrame.Visible = false OpenBtn.Visible = true end)
    OpenBtn.MouseButton1Click:Connect(function() MainFrame.Visible = true OpenBtn.Visible = false end)
end

-- ==========================================
-- SISTEMA DE KEY CON GET KEY (AUTO-COPIAR)
-- ==========================================
local function StartKeySystem()
    local KeyGui = Instance.new("ScreenGui", CoreGui)
    KeyGui.Name = "GeminiX_KeySystem"

    local Main = Instance.new("Frame", KeyGui)
    Main.Size = UDim2.new(0, 320, 0, 200)
    Main.Position = UDim2.new(0.5, -160, 0.5, -100)
    Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    EstiloVoid(Main, 12)
    Instance.new("UIStroke", Main).Color = Color3.fromRGB(0, 170, 255)

    local Title = Instance.new("TextLabel", Main)
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.Text = "GEMINIX KEY SYSTEM"
    Title.TextColor3 = Color3.fromRGB(0, 170, 255)
    Title.Font = Enum.Font.GothamBold
    Title.BackgroundTransparency = 1

    local Input = Instance.new("TextBox", Main)
    Input.Size = UDim2.new(0.85, 0, 0, 40)
    Input.Position = UDim2.new(0.075, 0, 0.25, 0)
    Input.PlaceholderText = "Paste Key here..."
    Input.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Input.TextColor3 = Color3.fromRGB(255, 255, 255)
    EstiloVoid(Input, 8)

    local GetKey = Instance.new("TextButton", Main)
    GetKey.Size = UDim2.new(0.4, 0, 0, 35)
    GetKey.Position = UDim2.new(0.075, 0, 0.55, 0)
    GetKey.Text = "GET KEY 🔑"
    GetKey.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    GetKey.TextColor3 = Color3.fromRGB(255, 255, 255)
    EstiloVoid(GetKey, 8)

    local Login = Instance.new("TextButton", Main)
    Login.Size = UDim2.new(0.4, 0, 0, 35)
    Login.Position = UDim2.new(0.525, 0, 0.55, 0)
    Login.Text = "LOGIN 🚀"
    Login.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    Login.TextColor3 = Color3.fromRGB(255, 255, 255)
    EstiloVoid(Login, 8)

    GetKey.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard(_G.Key)
            GetKey.Text = "COPIED! ✅"
            task.wait(2)
            GetKey.Text = "GET KEY 🔑"
        else
            GetKey.Text = "No Clipboard Support"
        end
    end)

    Login.MouseButton1Click:Connect(function()
        if Input.Text == _G.Key then
            KeyGui:Destroy()
            CrearMenuTabs()
        else
            Input.Text = ""
            Input.PlaceholderText = "WRONG KEY ❌"
            task.wait(1)
            Input.PlaceholderText = "Paste Key here..."
        end
    end)
end

UserInputService.JumpRequest:Connect(function() if States.InfJump then LocalPlayer.Character.Humanoid:ChangeState("Jumping") end end)
StartKeySystem()
