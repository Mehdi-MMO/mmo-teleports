Config = {}

Config.teleportKey = 51

Config.teleportVehicles = false

Config.useAce = false -- true if you want to use ace permissions

Config.teleportLocations = { --[[
        { {coords1}, {coords2}, {r, g, b}, "Text 1", "Text 2", "ACE_PERM"}

        -- teleports from coords 1 to coords 2 and the opposite
        -- red green blue (rgb) for the circle
        -- text 1 will be displayed for the first coord and text 2 for the second
        -- change the "ace_perm" to whatever perm you have if Config.useAce is set to true
    ]] {{-66.7087, -802.4756, 44.2273, 154.0947}, {-75.6067, -824.6723, 321.2919, 164.6716}, {36, 237, 157},
        "Go To The Roof", "Go Back Down", "ACE_PERM"},
       {{103.9796, -743.4225, 45.7547, 300.5798}, {136.0750, -761.8773, 242.1519, 158.6957}, {36, 237, 157},
        "Go To Floor 49", "Go Back Down"}}
