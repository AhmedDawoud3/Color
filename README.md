# Color

Color is a lightweight LÖVE color library with basic functionalities.

## Setup

```lua
local Color = require "color" --require the library
```

## Usage

Create a new color

```lua
local myColor = Color(212,224,117)
```

Set it

```lua
myColor:Set()
```

## Functions

### Color()

The main function to create a new color.

May provide the color as 3 arguments rgb each `from 0 to 255`, or `from 0 to 1` or as a `hex color`.

```lua
myColor = Color(251,96,106)

myColor = Color(0.98,0.38,0.42)

myColor = Color("#fb606a")
```

All return the same color

---

### Color.Random()

Returns a random color from a preset list of colors.

```lua
myColor = Color.Random()
```

---

### Color.Reset()

Resets the color (set a white color) `no need to call Set()`.

```lua
Color.Reset()
```

---

### Color.Average()

Creates a new color based on the average values of the colors given.

```lua
myColor = Color.Average({PURE_RED, PURE_GREEN})
```

---
### Color:Set(a)
Called on a color to set it.<br>
Takes optional argument `a` to overload the already existing value for the color.
```lua
myColor:Set()    --> Set the color with it's original value
myColor:Set(0.5) --> Set the color with 50% opacity
```
---
### Color:SetBackground()
Called on a color to set it as background.
```lua
myColor:SetBackground()
```
---
### Color:inverted()
Returns an inverted copy of the color.
```lua
newColor = myColor:inverted()
```
### Color:SetDimmed(a) || Color:SetBrightened(a)
Sets a lighter/dimmed variant of the color.

---
## Preset Colors
Here's the list of preset colors

`WHITE #FFFFFF `<br>
`GRAY_A #DDDDDD `<br>
`GRAY_B #BBBBBB `<br>
`GRAY_C #888888 `<br>
`GRAY_D #444444 `<br>
`GRAY_E #222222 `<br>
`BLACK #000000 `<br>
`LIGHTER_GRAY is GRAY_A`<br>
`LIGHT_GRAY is GRAY_B`<br>
`GRAY is GRAY_C`<br>
`DARK_GRAY is GRAY_D`<br>
`DARKER_GRAY is GRAY_E`<br>


`BLUE_A #C7E9F1 `<br>
`BLUE_B #9CDCEB `<br>
`BLUE_C #58C4DD `<br>
`BLUE_D #29ABCA `<br>
`BLUE_E #236B8E `<br>
`PURE_BLUE #0000FF `<br>
`BLUE is BLUE_C`<br>
`DARK_BLUE is BLUE_E`<br>

`TEAL_A #ACEAD7 `<br>
`TEAL_B #76DDC0 `<br>
`TEAL_C #5CD0B3 `<br>
`TEAL_D #55C1A7 `<br>
`TEAL_E #49A88F `<br>
`TEAL is TEAL_C`<br>

`GREEN_A #C9E2AE `<br>
`GREEN_B #A6CF8C `<br>
`GREEN_C #83C167 `<br>
`GREEN_D #77B05D `<br>
`GREEN_E #699C52 `<br>
`PURE_GREEN #00FF00 `<br>
`GREEN is GREEN_C`<br>

`YELLOW_A #FFF1B6 `<br>
`YELLOW_B #FFEA94 `<br>
`YELLOW_C #FFFF00 `<br>
`YELLOW_D #F4D345 `<br>
`YELLOW_E #E8C11C `<br>
`YELLOW is YELLOW_C`<br>

`GOLD_A #F7C797 `<br>
`GOLD_B #F9B775 `<br>
`GOLD_C #F0AC5F `<br>
`GOLD_D #E1A158 `<br>
`GOLD_E #C78D46 `<br>
`GOLD is GOLD_C`<br>


`RED_A #F7A1A3 `<br>
`RED_B #FF8080 `<br>
`RED_C #FC6255 `<br>
`RED_D #E65A4C `<br>
`RED_E #CF5044 `<br>
`PURE_RED #FF0000 `<br>
`RED is RED_C`<br>

`MAROON_A #ECABC1 `<br>
`MAROON_B #EC92AB `<br>
`MAROON_C #C55F73 `<br>
`MAROON_D #A24D61 `<br>
`MAROON_E #94424F `<br>
`MAROON is MAROON_C`<br>

`PURPLE_A #CAA3E8 `<br>
`PURPLE_B #B189C6 `<br>
`PURPLE_C #9A72AC `<br>
`PURPLE_D #715582 `<br>
`PURPLE_E #644172 `<br>
`PINK #D147BD `<br>
`LIGHT_PINK #DC75CD `<br>
`PURPLE is PURPLE_C`<br>

`ORANGE #FF862F `<br>
`LIGHT_BROWN #CD853F `<br>
`GRAY_BROWN #736357 `<br>
`DARK_BROWN #8B4513 `<br>