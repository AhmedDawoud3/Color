---@class Color @This library provides basic color functions.
local module = {
    _version = "color.lua V1.0",
    _description = "a simple Love2d Color lib",
}
local brighteningValue = 1.25
local dimmingValue = 0.75
local Color = {}
Color.__index = Color

local function new(r, g, b, a)
    if type(r) == "string" then
        a = g
        r, g, b = Color.HEXToRGB(r)
    else
        if r <= 1 and g <= 1 and b <= 1 then
            r, g, b = r, g, b
        else
            r = r / 255
            g = g / 255
            b = b / 255
        end
    end
    a = a or 1

    return setmetatable({
        r = r,
        g = g,
        b = b,
        a = a,
    }, Color)
end

function Color:__tostring()
    return "Color (r= " .. tonumber(self.r) .. ", g= " .. tonumber(self.g) .. ", b= " .. tonumber(self.b) .. ", a= "
               .. tonumber(self.a) .. ")"
end

function Color:SetBackground()
    love.graphics.setBackgroundColor(self.r, self.g, self.b, self.a)
end

-- a-> alpha value from 0 to 1
function Color:Set(a)
    love.graphics.setColor(self.r, self.g, self.b, a or self.a)
end

function Color:inverted()
    return new(1 - self.r, 1 - self.g, 1 - self.b, self.a)
end

local function Average(colors)
    local r, g, b, a = 0, 0, 0, 0
    for _, color in ipairs(colors) do
        r = r + color.r
        g = g + color.g
        b = b + color.b
        a = a + color.a
    end
    return new(r / #colors, g / #colors, b / #colors, a / #colors)
end

local function Reset()
    return new(1, 1, 1):Set()
end

function Color:SetBrightened(a)
    love.graphics.setColor(self.r * brighteningValue, self.g * brighteningValue, self.b * brighteningValue, a or self.a)
end

function Color:SetDimmed(a)
    love.graphics.setColor(self.r * dimmingValue, self.g * dimmingValue, self.b * dimmingValue, a or self.a)
end

function Color.HEXToRGB(hex)
    local hex = hex:gsub("#", "")
    if hex:len() == 3 then
        return (tonumber("0x" .. hex:sub(1, 1)) * 17) / 255, (tonumber("0x" .. hex:sub(2, 2)) * 17) / 255,
               (tonumber("0x" .. hex:sub(3, 3)) * 17) / 255
    else
        return tonumber("0x" .. hex:sub(1, 2)) / 255, tonumber("0x" .. hex:sub(3, 4)) / 255,
               tonumber("0x" .. hex:sub(5, 6)) / 255
    end
end

local colorsList = {new("#FFFFFF"), new("#DDDDDD"), new("#BBBBBB"), new("#888888"), new("#444444"), new("#222222"),
                    new("#000000"), new("#DDDDDD"), new("#BBBBBB"), new("#888888"), new("#444444"), new("#222222"),
                    new("#C7E9F1"), new("#9CDCEB"), new("#58C4DD"), new("#29ABCA"), new("#236B8E"), new("#0000FF"),
                    new("#58C4DD"), new("#236B8E"), new("#ACEAD7"), new("#76DDC0"), new("#5CD0B3"), new("#55C1A7"),
                    new("#49A88F"), new("#5CD0B3"), new("#C9E2AE"), new("#A6CF8C"), new("#83C167"), new("#77B05D"),
                    new("#699C52"), new("#00FF00"), new("#83C167"), new("#FFF1B6"), new("#FFEA94"), new("#FFFF00"),
                    new("#F4D345"), new("#E8C11C"), new("#FFFF00"), new("#F7C797"), new("#F9B775"), new("#F0AC5F"),
                    new("#E1A158"), new("#C78D46"), new("#F0AC5F"), new("#F7A1A3"), new("#FF8080"), new("#FC6255"),
                    new("#E65A4C"), new("#CF5044"), new("#FF0000"), new("#FC6255"), new("#ECABC1"), new("#EC92AB"),
                    new("#C55F73"), new("#A24D61"), new("#94424F"), new("#C55F73"), new("#CAA3E8"), new("#B189C6"),
                    new("#9A72AC"), new("#715582"), new("#644172"), new("#9A72AC"), new("#D147BD"), new("#DC75CD"),
                    new("#FF862F"), new("#CD853F"), new("#8B4513"), new("#736357")}

local function Random()
    return colorsList[math.random(1, #colorsList)]
end

module.new = new
module.Random = Random
module.Reset = Reset
module.Average = Average

WHITE = new("#FFFFFF")
GRAY_A = new("#DDDDDD")
GRAY_B = new("#BBBBBB")
GRAY_C = new("#888888")
GRAY_D = new("#444444")
GRAY_E = new("#222222")
BLACK = new("#000000")
LIGHTER_GRAY = GRAY_A
LIGHT_GRAY = GRAY_B
GRAY = GRAY_C
DARK_GRAY = GRAY_D
DARKER_GRAY = GRAY_E

BLUE_A = new("#C7E9F1")
BLUE_B = new("#9CDCEB")
BLUE_C = new("#58C4DD")
BLUE_D = new("#29ABCA")
BLUE_E = new("#236B8E")
PURE_BLUE = new("#0000FF")
BLUE = BLUE_C
DARK_BLUE = BLUE_E

TEAL_A = new("#ACEAD7")
TEAL_B = new("#76DDC0")
TEAL_C = new("#5CD0B3")
TEAL_D = new("#55C1A7")
TEAL_E = new("#49A88F")
TEAL = TEAL_C

GREEN_A = new("#C9E2AE")
GREEN_B = new("#A6CF8C")
GREEN_C = new("#83C167")
GREEN_D = new("#77B05D")
GREEN_E = new("#699C52")
PURE_GREEN = new("#00FF00")
GREEN = GREEN_C

YELLOW_A = new("#FFF1B6")
YELLOW_B = new("#FFEA94")
YELLOW_C = new("#FFFF00")
YELLOW_D = new("#F4D345")
YELLOW_E = new("#E8C11C")
YELLOW = YELLOW_C

GOLD_A = new("#F7C797")
GOLD_B = new("#F9B775")
GOLD_C = new("#F0AC5F")
GOLD_D = new("#E1A158")
GOLD_E = new("#C78D46")
GOLD = GOLD_C

RED_A = new("#F7A1A3")
RED_B = new("#FF8080")
RED_C = new("#FC6255")
RED_D = new("#E65A4C")
RED_E = new("#CF5044")
PURE_RED = new("#FF0000")
RED = RED_C

MAROON_A = new("#ECABC1")
MAROON_B = new("#EC92AB")
MAROON_C = new("#C55F73")
MAROON_D = new("#A24D61")
MAROON_E = new("#94424F")
MAROON = MAROON_C

PURPLE_A = new("#CAA3E8")
PURPLE_B = new("#B189C6")
PURPLE_C = new("#9A72AC")
PURPLE_D = new("#715582")
PURPLE_E = new("#644172")
PURPLE = PURPLE_C

PINK = new("#D147BD")
LIGHT_PINK = new("#DC75CD")

ORANGE = new("#FF862F")
LIGHT_BROWN = new("#CD853F")
GRAY_BROWN = new("#736357")
DARK_BROWN = new("#8B4513")

return setmetatable(module, {
    __call = function(_, ...)
        return new(...)
    end,
})
