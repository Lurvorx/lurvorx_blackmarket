Config = {}

-- The webhook link for you logs
Config.Webhook = "https://discord.com/api/webhooks/1233569487039496235/OOqCOpIodCEcBBsqdXOqP7lwJPMiKBUtwx__VGHmZOBFXfE5VY_RNJNu8LS7vIF4Mtc-"

-- For how long the notification will be shown
Config.NotificationTime = 5000

-- Here you can config your ped
Config.Ped = {
    ShowPed = true,
    PedModel = "a_m_y_soucent_02", -- https://docs.fivem.net/docs/game-references/ped-models/
    PedCoords = {x = 1986.4878, y = 3025.7375, z = 46.0563},
    PedHeading = 331.6798
}

-- Here you can config your text
-- Text coords are the same as the PedCoords
Config.Text = {
    Text = "~INPUT_CONTEXT~ To open the blackmarket menu"
}

-- Here you can config your menu
Config.Menu = {
    ControlToOpenMenu = 38, -- https://docs.fivem.net/docs/game-references/controls/
    MenuName = "Blackmarket menu",
    MenuAlign = "center"
}

Config.Waypoint = {x = 1689.7719, y = 3289.4294, z = 41.1465}

-- Here you can config the items
-- lable = Text on item players can sell
-- type = The type of the element (DON'T TOUCH)
-- value = How many of the items you can sell per click
-- price = How much money you get from selling the item
-- item = What item you can sell
Config.Items = {
    {label = "Pistol", type = "range", value = 1, price = 10000, item = "weapon_pistol"},
    {label = "Cannabis", type = "range", value = 1, price = 1000, item = "cannabis"}
}

Config.Locale = {
    Notification = {
        driveToWaypoint = "Drive to your waypoint to take your item(s)",
        haveTookItemFor = "You have took your item(s) for",
        noMoney = "You do not have enough money to purchase the item(s)"
    },

    MarkerPlace = {
        takeItem = "To take your item(s)"
    }
}