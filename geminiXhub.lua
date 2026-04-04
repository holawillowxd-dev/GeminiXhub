-- [[ GeminiXhub v6.0 - PROFESSIONAL TOGGLES ]]
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

_G.Key = "GXM-2026-TOP1"

-- Variables de Estado
local States = {
    Speed = false,
    Jump = false,
    ESP = false,
    InfJump = false
}

local function EstiloVoid(instancia)
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = instancia
end

local function CrearMenuVoid()
    local MainGui = Instance.new("ScreenGui")
    MainGui.Name = "GeminiX_Voidware_V6"
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
    Frame.Size = UDim2.new(0, 240, 0, 380)
    Frame.Position = UDim2.new(0.5, -120, 0.5, -190)
    Frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    Frame.Parent = MainGui
    EstiloVoid(Frame)
    Instance.new("UIStroke", Frame).Color = Color3.fromRGB(0, 170, 255)

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 45)
    Title.Text = "GEMINIXHUB | V6 PRO"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1
    Title.Font = Enum.Font.GothamBold
    Title.Parent = Frame

    local function CrearToggle(texto, pos, callback)
        local Btn = Instance.new("TextButton")
        Btn.Size = UDim2.new(0, 210, 0, 35)
        Btn.Position = pos
        Btn.Text = texto .. ": OFF"
        Btn.BackgroundColor3 = Color3.fromRGB(40, 20, 20) -- Rojo oscuro inicial
        Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        Btn.Font = Enum.Font.Gotham
        Btn.Parent = Frame
        EstiloVoid(Btn)

        local active = false
        Btn.MouseButton1Click:Connect(function()
            active = not active
            if active then
                Btn.BackgroundColor3 = Color3.fromRGB(20, 40, 20) -- Verde oscuro
                Btn.Text = texto .. ": ON"
            else
                Btn.BackgroundColor3 = Color3.fromRGB(40, 20, 20)
                Btn.Text = texto .. ": OFF"
            end
            callback(active)
        end)
    end

    -- TOGGLE VELOCIDAD
    CrearToggle("VELOCIDAD", UDim2.new(0.5, -105, 0, 55), function(state)
        States.Speed = state
        if state then
            LocalPlayer.Character.Humanoid.WalkSpeed = 100
        else
            LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end
    end)

    -- TOGGLE SALTO
    CrearToggle("SUPER SALTO", UDim2.new(0.5, -105, 0, 100), function(state)
        States.Jump = state
        if state then
            LocalPlayer.Character.Humanoid.UseJumpPower = true
            LocalPlayer.Character.Humanoid.JumpPower = 150
        else
            LocalPlayer.Character.Humanoid.JumpPower = 50
        end
    end)

    -- TOGGLE ESP (MEJORADO)
    CrearToggle("ESP WALLHACK", UDim2.new(0.5, -105, 0, 145), function(state)
        States.ESP = state
        if state then
            for _, v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer and v.Character then
                    local h = Instance.new("Highlight")
                    h.Name = "GeminiESP"
                    h.FillColor = Color3.fromRGB(0, 170, 255)
                    h.Parent = v.Character
                end
            end
        else
            for _, v in pairs(Players:GetPlayers()) do
                if v.Character and v.Character:FindFirstChild("GeminiESP") then
                    v.Character.GeminiESP:Destroy()
                end
            end
        end
    end)

    -- TOGGLE SALTO INFINITO
    CrearToggle("INF JUMP", UDim2.new(0.5, -105, 0, 190), function(state)
        States.InfJump = state
    end)

    UserInputService.JumpRequest:Connect(function()
        if States.InfJump then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
    end)

    -- RESET Y MINIMIZAR
    local ResetBtn = Instance.new("TextButton")
    ResetBtn.Size = UDim2.new(0, 210, 0, 35)
    ResetBtn.Position = UDim2.new(0.5, -105, 0, 250)
    ResetBtn.Text = "RESETEAR PERSONAJE"
    ResetBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    ResetBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    ResetBtn.Parent = Frame
    EstiloVoid(ResetBtn)
    ResetBtn.MouseButton1Click:Connect(function() LocalPlayer.Character:BreakJoints() end)

    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 210, 0, 35)
    CloseBtn.Position = UDim2.new(0.5, -105, 0, 320)
    CloseBtn.Text = "MINIMIZAR"
    CloseBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
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

-- SISTEMA DE KEY (MISMO)
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
    GetKey.Text = "COPIAR KEY"
    GetKey.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    GetKey.TextColor3 = Color3.fromRGB(0, 170, 255)
    GetKey.Parent = Main
    EstiloVoid(GetKey)
    GetKey.MouseButton1Click:Connect(function()
        setclipboard(_G.Key)
        GetKey.Text = "COPIADA!"
        task.wait(1)
        GetKey.Text = "COPIAR KEY"
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
