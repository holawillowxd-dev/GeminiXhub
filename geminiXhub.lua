-- [[ GeminiXhub v5.0 - VOIDWARE + ESP + INF JUMP ]]
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

_G.Key = "GXM-2026-TOP1"

local function EstiloVoid(instancia)
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = instancia
end

local function CrearMenuVoid()
    local MainGui = Instance.new("ScreenGui")
    MainGui.Name = "GeminiX_Voidware_V5"
    MainGui.Parent = CoreGui
    MainGui.ResetOnSpawn = false

    local OpenBtn = Instance.new("TextButton")
    OpenBtn.Size = UDim2.new(0, 45, 0, 45)
    OpenBtn.Position = UDim2.new(0, 15, 0.5, 0)
    OpenBtn.Text = "V"
    OpenBtn.Visible = false
    OpenBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    OpenBtn.Font = Enum.Font.GothamBold
    OpenBtn.Parent = MainGui
    EstiloVoid(OpenBtn)

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 240, 0, 380) -- Más alto para las nuevas opciones
    Frame.Position = UDim2.new(0.5, -120, 0.5, -190)
    Frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    Frame.Parent = MainGui
    EstiloVoid(Frame)
    
    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Color3.fromRGB(0, 170, 255)
    Stroke.Thickness = 2
    Stroke.Parent = Frame

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 45)
    Title.Text = "VOIDWARE | V5"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1
    Title.Font = Enum.Font.GothamBold
    Title.Parent = Frame

    local function CrearBoton(texto, pos, func)
        local Btn = Instance.new("TextButton")
        Btn.Size = UDim2.new(0, 210, 0, 35)
        Btn.Position = pos
        Btn.Text = texto
        Btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
        Btn.Font = Enum.Font.Gotham
        Btn.Parent = Frame
        EstiloVoid(Btn)
        Btn.MouseButton1Click:Connect(func)
    end

    -- BOTONES EXISTENTES
    CrearBoton("VELOCIDAD FLASH", UDim2.new(0.5, -105, 0, 50), function()
        LocalPlayer.Character.Humanoid.WalkSpeed = 100
    end)

    CrearBoton("SUPER SALTO", UDim2.new(0.5, -105, 0, 95), function()
        LocalPlayer.Character.Humanoid.UseJumpPower = true
        LocalPlayer.Character.Humanoid.JumpPower = 150
    end)

    -- NUEVO: ESP (VER GENTE)
    CrearBoton("ACTIVAR ESP (VER GENTE)", UDim2.new(0.5, -105, 0, 140), function()
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                local Highlight = Instance.new("Highlight")
                Highlight.Parent = v.Character
                Highlight.FillColor = Color3.fromRGB(0, 170, 255)
                Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            end
        end
    end)

    -- NUEVO: SALTO INFINITO
    local InfJumpEnabled = false
    CrearBoton("SALTO INFINITO", UDim2.new(0.5, -105, 0, 185), function()
        InfJumpEnabled = not InfJumpEnabled
        local b = Frame:FindFirstChild("InfJumpStatus") or Instance.new("TextLabel")
        b.Name = "InfJumpStatus"
        b.Size = UDim2.new(0, 210, 0, 20)
        b.Position = UDim2.new(0.5, -105, 0, 225)
        b.BackgroundTransparency = 1
        b.TextColor3 = InfJumpEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        b.Text = InfJumpEnabled and "INFINITE JUMP: ACTIVADO" or "INFINITE JUMP: DESACTIVADO"
        b.Parent = Frame
    end)

    UserInputService.JumpRequest:Connect(function()
        if InfJumpEnabled then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
    end)

    CrearBoton("RESET CHARACTER", UDim2.new(0.5, -105, 0, 260), function()
        LocalPlayer.Character:BreakJoints()
    end)

    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 210, 0, 35)
    CloseBtn.Position = UDim2.new(0.5, -105, 0, 320)
    CloseBtn.Text = "MINIMIZAR"
    CloseBtn.BackgroundColor3 = Color3.fromRGB(40, 10, 10)
    CloseBtn.TextColor3 = Color3.fromRGB(255, 50, 50)
    CloseBtn.Parent = Frame
    EstiloVoid(CloseBtn)
    
    CloseBtn.MouseButton1Click:Connect(function()
        Frame.Visible = false
        OpenBtn.Visible = true
    end)

    OpenBtn.MouseButton1Click:Connect(function()
        Frame.Visible = true
        OpenBtn.Visible = false
    end)
end

-- SISTEMA DE KEY (MISMO DE ANTES)
local function StartKeySystem()
    local KeyGui = Instance.new("ScreenGui")
    KeyGui.Parent = CoreGui
    local Main = Instance.new("Frame")
    Main.Size = UDim2.new(0, 320, 0, 200)
    Main.Position = UDim2.new(0.5, -160, 0.5, -100)
    Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    Main.Parent = KeyGui
    EstiloVoid(Main)
    Instance.new("UIStroke", Main).Color = Color3.fromRGB(0, 170, 255)

    local GetKey = Instance.new("TextButton")
    GetKey.Size = UDim2.new(0, 280, 0, 35)
    GetKey.Position = UDim2.new(0.5, -140, 0, 30)
    GetKey.Text = "COPIAR KEY (VOID)"
    GetKey.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    GetKey.TextColor3 = Color3.fromRGB(0, 170, 255)
    GetKey.Parent = Main
    EstiloVoid(GetKey)
    GetKey.MouseButton1Click:Connect(function()
        setclipboard(_G.Key)
        GetKey.Text = "COPIADA!"
        task.wait(1)
        GetKey.Text = "COPIAR KEY (VOID)"
    end)

    local Input = Instance.new("TextBox")
    Input.Size = UDim2.new(0, 280, 0, 40)
    Input.Position = UDim2.new(0.5, -140, 0, 80)
    Input.PlaceholderText = "Escribe la llave..."
    Input.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Input.TextColor3 = Color3.fromRGB(255, 255, 255)
    Input.Parent = Main
    EstiloVoid(Input)

    local Enter = Instance.new("TextButton")
    Enter.Size = UDim2.new(0, 280, 0, 45)
    Enter.Position = UDim2.new(0.5, -140, 0, 135)
    Enter.Text = "AUTENTICAR"
    Enter.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    Enter.Parent = Main
    EstiloVoid(Enter)
    
    Enter.MouseButton1Click:Connect(function()
        if Input.Text == _G.Key then
            KeyGui:Destroy()
            CrearMenuVoid()
        end
    end)
end

StartKeySystem()
