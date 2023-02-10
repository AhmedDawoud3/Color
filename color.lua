---@class Color @This library provides basic color functions.
local module = {
    _version = "color.lua V1.0.1",
    _description = "a simple Love2d Color lib",
}
local brighteningValue = 1.25
local dimmingValue = 0.75
local color = {}
color.__index = color

--- Initialize a new color object
--- @overload fun(r, g, b, a)
--- @overload fun(hex, a) where hex is a string like "FF0000"
--- @param r number Red value
--- @param g number Green value
--- @param b number Blue value
--- @param a number Alpha value
--- @return Color color object
local function new(r, g, b, a)
    -- If first argument is a string, then it's a hex value
    if type(r) == "string" then
        -- Alpha value is passed in g
        a = g
        -- Convert from hex to RGB and store in r, g, b
        r, g, b = color.HEXToRGB(r)
    else
        -- If RGB values are between 0 and 1, then they are already normalized
        if r <= 1 and g <= 1 and b <= 1 then
            -- Use the RGB values as is
            r, g, b = r, g, b
        else
            -- Otherwise, normalize RGB values
            r = r / 255
            g = g / 255
            b = b / 255
        end
    end
    -- If alpha is not passed in, set it to 1
    a = a or 1

    -- Assert alpha value is between 0 and 1
    assert(a <= 1, "Alpha value must be between 0 and 1")
    -- Return new color object
    return setmetatable({
        r = r,
        g = g,
        b = b,
        a = a,
    }, color)
end

--- @return string
function color:__tostring()
    -- This function allows you to print a color object to the console
    return "Color (r= " .. tonumber(self.r) .. ", g= " .. tonumber(self.g) .. ", b= " .. tonumber(self.b) .. ", a= "
               .. tonumber(self.a) .. ")"
end

--- Set the background color to this color
function color:SetBackground()
    love.graphics.clear(self.r, self.g, self.b)
end

--- Sets the color of the next object to be drawn
--- @param a number alpha value from 0 to 1
function color:Set(a)
    love.graphics.setColor(self.r, self.g, self.b, a or self.a)
end

--- @return Color inverted copy of color
function color:inverted()
    return new(1 - self.r, 1 - self.g, 1 - self.b, self.a)
end

--- This function takes a list of colors and returns the average of those colors.
--- @param colors table a list of color objects
local function Average(colors)
    -- Initialize the total hue, saturation, lightness and alpha values to 0.
    local h, s, l, a = 0, 0, 0, 0
    -- Loop through each color in the list.
    for _, color in ipairs(colors) do
        -- Add the hue, saturation, lightness and alpha values of the current color to the total values.
        h = h + color.h
        s = s + color.s
        l = l + color.l
        a = a + color.a
    end
    -- Return the average of the total values.
    return new(h / #colors, s / #colors, l / #colors, a / #colors)
end

--- Sets the color of the next object to be drawn to white
local function Reset()
    WHITE:Set()
end

--- sets the color of the object to the brightened version
--- @param a number alpha value from 0 to 1
function color:SetBrightened(a) 
    love.graphics.setColor(self.r * brighteningValue, self.g * brighteningValue, self.b * brighteningValue, a or self.a) -- sets the color to the brightened version of the color
end

--- Set the color to the dimmed version of the color
--- @param a number alpha value from 0 to 1
function color:SetDimmed(a)
    love.graphics.setColor(self.r * dimmingValue, self.g * dimmingValue, self.b * dimmingValue, a or self.a)
end

-- this function converts the color into a table of r, g, b values
function color:ToTable()
    return {self.r, self.g, self.b}
end

--- function to convert hex to rgb
function color.HEXToRGB(hex)
    -- remove # from hex string
    local hex = hex:gsub("#", "")
    -- if hex is 3 characters long
    if hex:len() == 3 then
        -- return the red, green, and blue values
        return (tonumber("0x" .. hex:sub(1, 1)) * 17) / 255, (tonumber("0x" .. hex:sub(2, 2)) * 17) / 255,
               (tonumber("0x" .. hex:sub(3, 3)) * 17) / 255
    -- if hex is 6 characters long
    elseif hex:len() == 6 then
        -- return the red, green, and blue values
        return tonumber("0x" .. hex:sub(1, 2)) / 255, tonumber("0x" .. hex:sub(3, 4)) / 255,
               tonumber("0x" .. hex:sub(5, 6)) / 255
    -- if hex is not 3 or 6 characters
    else
        -- throw an error
        error("Invalid hex string!")
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

Color = setmetatable(module, {
    __call = function(_, ...)
        return new(...)
    end,
})
