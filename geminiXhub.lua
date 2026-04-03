-- [[ GeminiXhub v4.0 - ESTILO VOIDWARE ]]
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

_G.Key = "GXM-2026-TOP1"

local function EstiloVoid(instancia)
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = instancia
end

local function CrearMenuVoid()
    local MainGui = Instance.new("ScreenGui")
    MainGui.Name = "GeminiX_Voidware"
    MainGui.Parent = CoreGui
    MainGui.ResetOnSpawn = false

    -- BOTÓN FLOTANTE (ESTILO NEÓN)
    local OpenBtn = Instance.new("TextButton")
    OpenBtn.Size = UDim2.new(0, 45, 0, 45)
    OpenBtn.Position = UDim2.new(0, 15, 0.5, 0)
    OpenBtn.Text = "V" -- De Voidware
    OpenBtn.Visible = false
    OpenBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    OpenBtn.Font = Enum.Font.GothamBold
    OpenBtn.Parent = MainGui
    EstiloVoid(OpenBtn)

    -- PANEL PRINCIPAL VOIDWARE
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 240, 0, 300)
    Frame.Position = UDim2.new(0.5, -120, 0.5, -150)
    Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15) -- Fondo oscuro
    Frame.BorderSizePixel = 0
    Frame.Parent = MainGui
    EstiloVoid(Frame)
    
    -- Borde Neón (Efecto Void)
    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Color3.fromRGB(0, 170, 255)
    Stroke.Thickness = 2
    Stroke.Parent = Frame

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 45)
    Title.Text = "VOIDWARE | GEMINIX"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 18
    Title.Parent = Frame

    -- BOTONES TIPO VOIDWARE
    local function CrearBoton(texto, pos, func)
        local Btn = Instance.new("TextButton")
        Btn.Size = UDim2.new(0, 210, 0, 40)
        Btn.Position = pos
        Btn.Text = texto
        Btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
        Btn.Font = Enum.Font.Gotham
        Btn.Parent = Frame
        EstiloVoid(Btn)
        
        Btn.MouseButton1Click:Connect(func)
    end

    CrearBoton("VELOCIDAD FLASH", UDim2.new(0.5, -105, 0, 60), function()
        LocalPlayer.Character.Humanoid.WalkSpeed = 100
    end)

    CrearBoton("SUPER SALTO", UDim2.new(0.5, -105, 0, 110), function()
        LocalPlayer.Character.Humanoid.UseJumpPower = true
        LocalPlayer.Character.Humanoid.JumpPower = 150
    end)
    
    CrearBoton("RESET CHARACTER", UDim2.new(0.5, -105, 0, 160), function()
        LocalPlayer.Character:BreakJoints()
    end)

    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 210, 0, 40)
    CloseBtn.Position = UDim2.new(0.5, -105, 0, 240)
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

-- SISTEMA DE KEY (ESTILO VOID)
local function StartKeySystem()
    local KeyGui = Instance.new("ScreenGui")
    KeyGui.Parent = CoreGui
    local Main = Instance.new("Frame")
    Main.Size = UDim2.new(0, 320, 0, 200)
    Main.Position = UDim2.new(0.5, -160, 0.5, -100)
    Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    Main.Parent = KeyGui
    EstiloVoid(Main)
    
    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Color3.fromRGB(0, 170, 255)
    Stroke.Parent = Main

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
    Enter.TextColor3 = Color3.fromRGB(255, 255, 255)
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
