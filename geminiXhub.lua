-- [[ GeminiXhub v2.0 - Official Source Code ]]
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

_G.Key = "GXM-2026-TOP1"
_G.Noclip = false
_G.Flying = false

local function StartKeySystem()
    local KeyGui = Instance.new("ScreenGui")
    KeyGui.Name = "GeminiX_KeySystem"
    KeyGui.Parent = CoreGui
    local Main = Instance.new("Frame")
    Main.Size = UDim2.new(0, 350, 0, 220)
    Main.Position = UDim2.new(0.5, -175, 0.5, -110)
    Main.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    Main.Parent = KeyGui
    Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.Text = "GeminiXhub | KEY ACCESS"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 18
    Title.BackgroundTransparency = 1
    Title.Parent = Main
    local GetKeyBtn = Instance.new("TextButton")
    GetKeyBtn.Size = UDim2.new(0, 280, 0, 30)
    GetKeyBtn.Position = UDim2.new(0.5, -140, 0, 55)
    GetKeyBtn.Text = "key here bro (Copy Key)"
    GetKeyBtn.Parent = Main
    local Input = Instance.new("TextBox")
    Input.Size = UDim2.new(0, 280, 0, 40)
    Input.Position = UDim2.new(0.5, -140, 0, 100)
    Input.PlaceholderText = "Pega la key aqui..."
    Input.Parent = Main
    local VerifyBtn = Instance.new("TextButton")
    VerifyBtn.Size = UDim2.new(0, 280, 0, 45)
    VerifyBtn.Position = UDim2.new(0.5, -140, 0, 155)
    VerifyBtn.Text = "INGRESAR A GEMINIXHUB"
    VerifyBtn.Parent = Main
    VerifyBtn.MouseButton1Click:Connect(function()
        if Input.Text == _G.Key then 
            KeyGui:Destroy()
            print("Acceso Concedido")
        end
    end)
end
StartKeySystem()
