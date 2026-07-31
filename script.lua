local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local FreezeButton = Instance.new("TextButton")
local AutoAcceptButton = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Frame.Position = UDim2.new(0.4, 0, 0.4, 0)
Frame.Size = UDim2.new(0, 220, 0, 140)
Frame.Active = true
Frame.Draggable = true

-- Estados iniciales (Apagado / OFF)
local freezeActive = false
local autoAcceptActive = false

-- Configuración del botón Freeze Trade
FreezeButton.Parent = Frame
FreezeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
FreezeButton.Position = UDim2.new(0.1, 0, 0.15, 0)
FreezeButton.Size = UDim2.new(0, 175, 0, 40)
FreezeButton.Font = Enum.Font.SourceSansBold
FreezeButton.Text = "Freeze Trade: OFF"
FreezeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FreezeButton.TextSize = 16

-- Configuración del botón Auto Accept
AutoAcceptButton.Parent = Frame
AutoAcceptButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
AutoAcceptButton.Position = UDim2.new(0.1, 0, 0.55, 0)
AutoAcceptButton.Size = UDim2.new(0, 175, 0, 40)
AutoAcceptButton.Font = Enum.Font.SourceSansBold
AutoAcceptButton.Text = "Auto Accept: OFF"
AutoAcceptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoAcceptButton.TextSize = 16

-- Función para Freeze Trade (Cambia entre ON y OFF)
FreezeButton.MouseButton1Click:Connect(function()
    freezeActive = not freezeActive
    if freezeActive then
        FreezeButton.Text = "Freeze Trade: ON"
        FreezeButton.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
        print("Freeze Trade activado")
    else
        FreezeButton.Text = "Freeze Trade: OFF"
        FreezeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        print("Freeze Trade desactivado")
    end
end)

-- Función para Auto Accept (Cambia entre ON y OFF)
AutoAcceptButton.MouseButton1Click:Connect(function()
    autoAcceptActive = not autoAcceptActive
    if autoAcceptActive then
        AutoAcceptButton.Text = "Auto Accept: ON"
        AutoAcceptButton.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
        print("Auto Accept activado")
    else
        AutoAcceptButton.Text = "Auto Accept: OFF"
        AutoAcceptButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        print("Auto Accept desactivado")
    end
end)
