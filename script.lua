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

FreezeButton.Parent = Frame
FreezeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
FreezeButton.Position = UDim2.new(0.1, 0, 0.15, 0)
FreezeButton.Size = UDim2.new(0, 175, 0, 40)
FreezeButton.Font = Enum.Font.SourceSansBold
FreezeButton.Text = "Freeze Trade"
FreezeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FreezeButton.TextSize = 16

AutoAcceptButton.Parent = Frame
AutoAcceptButton.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
AutoAcceptButton.Position = UDim2.new(0.1, 0, 0.55, 0)
AutoAcceptButton.Size = UDim2.new(0, 175, 0, 40)
AutoAcceptButton.Font = Enum.Font.SourceSansBold
AutoAcceptButton.Text = "Auto Accept"
AutoAcceptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoAcceptButton.TextSize = 16

FreezeButton.MouseButton1Click:Connect(function()
    print("Freeze Trade activado")
end)

AutoAcceptButton.MouseButton1Click:Connect(function()
    print("Auto Accept activado")
end)
