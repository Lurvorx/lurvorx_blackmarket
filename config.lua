Config = {}

-- Your discord webhook for the blackmarket logs.
Config.Webhook = "https://discord.com/api/webhooks/1233569487039496235/OOqCOpIodCEcBBsqdXOqP7lwJPMiKBUtwx__VGHmZOBFXfE5VY_RNJNu8LS7vIF4Mtc-"

-- For how long the notification time wil be shown for (in seconds).
Config.NotificationTime = 5

-- Config the ped under.
-- Find information about peds here: https://docs.fivem.net/docs/game-references/ped-models/
Config.Ped = {
    ShowPed = true,
    PedModel = "a_m_y_soucent_02",
    PedCoords = {x = 1986.4878, y = 3025.7375, z = 46.0563},
    PedHeading = 331.6798
}

-- Config your text under.
-- Text coords are the same as the PedCoords.
Config.Text = {
    Text = "~INPUT_CONTEXT~ To open the blackmarket menu"
}

-- Here you can config your menu.
-- Find information about controls here: https://docs.fivem.net/docs/game-references/controls/
Config.Menu = {
    ControlToOpenMenu = 38,
    MenuName = "Blackmarket menu",
    MenuAlign = "center"
}

Config.Waypoint = {x = 1689.7719, y = 3289.4294, z = 41.1465}

-- Here you can config the items.
-- lable = Text on item players can sell
-- type = The type of the element (DON'T TOUCH)
-- value = How many of the items you can sell per click
-- price = How much money you get from selling the item (price of ONE item)
-- item = What item you can sell
Config.Items = {
    {label = "Pistol", type = "range", value = 1, price = 10000, item = "weapon_pistol"},
    {label = "Cannabis", type = "range", value = 1, price = 1000, item = "cannabis"}
}

-- Config the language you want to use.
Config.Strings = {

    -- The language for the notifications.
    Notification = {
        driveToWaypoint = "Drive to your waypoint to take your item(s)",
        haveTookItemFor = "You have took your item(s) for",
        noMoney = "You do not have enough money to purchase the item(s)"
    },

    -- The language for the marker place.
    MarkerPlace = {
        takeItem = "To take your item(s)"
    }

}
