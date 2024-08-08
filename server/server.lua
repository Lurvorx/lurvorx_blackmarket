ESX = nil
ESX = exports["es_extended"]:getSharedObject()

SendToDiscord = function(playerName, discordMessage)
    local embeds = {
        {
            ['type'] = 'rich',
            ['title'] = '`🔫` BLACKMARKET LOGS',
            ['description'] = discordMessage,
            ['color'] = 10092339,
            ['footer'] = {
                ['text'] = 'Lurvorx Scripts Logs | ' .. os.date(),
                ['icon_url'] = 'https://cdn.discordapp.com/attachments/1185300625320329296/1185630929847337000/Lurvorx-Scripts-Logga.jpg?ex=6675b4d9&is=66746359&hm=154e4c80ac278286f9b24f7e1b832fe2afcddad8d4801c62e7656d4b1a79da55&'
            }
        }
    }

    PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({ embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

RegisterNetEvent("lurvorx_blackmarket:checkMoney")
AddEventHandler("lurvorx_blackmarket:checkMoney", function(item, amount, price, markerCoords)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local playerName = GetPlayerName(_source)
    local hasMoney = xPlayer.getMoney()

    if hasMoney >= price then
        TriggerClientEvent("esx:showNotification", _source, Config.Strings.Notification.driveToWaypoint, "success", Config.NotificationTime * 1000)
        TriggerClientEvent("lurvorx_blackmarket:setWaypoint", _source, markerCoords)
    else
        TriggerClientEvent("esx:showNotification", _source, Config.Strings.Notification.noMoney, "error", Config.NotificationTime * 1000)
    end
end)

RegisterNetEvent("lurvorx_blackmarket:buyItem")
AddEventHandler("lurvorx_blackmarket:buyItem", function(item, amount, price)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local playerName = GetPlayerName(_source)
    local hasMoney = xPlayer.getMoney()

    if hasMoney >= price then
        xPlayer.addInventoryItem(item, amount)
        xPlayer.removeMoney(price)
        TriggerClientEvent("esx:showNotification", _source, Config.Strings.Notification.haveTookItemFor .. " " .. price, "success", Config.NotificationTime * 1000)
    else
        TriggerClientEvent('esx:showNotification', _source, Config.Strings.Notification.noMoney, "error", Config.NotificationTime * 1000)
        return
    end

    for k,v in pairs(GetPlayerIdentifiers(source)) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            steamid = v
        elseif string.sub(v, 1, string.len("license:")) == "license:" then
            license = v
        elseif string.sub(v, 1, string.len("license2:")) == "license2:" then
            license2 = v
        elseif string.sub(v, 1, string.len("fivem:")) == "fivem:" then
            fivem = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            discord = v
        end
    end

    steamhex = steamid or "N/A"
    fivemlicense = license or "N/A"
    fivemlicense2 = license2 or "N/A"
    fivemid = fivem or "N/A"
    discordid = string.gsub(discord, "discord:", "") or "N/A"

    SendToDiscord(
        discordMessage, "**" .. playerName .. "** have purchased **" .. amount .. "** item(s)." .. "\n\n`📃` **ITEM NAME:** `" .. item .. "`\n\n`👤` **PLAYER:** `" .. playerName .. "`\n`🔢` **SERVER ID:** `" .. source .. "`\n`💬` **DISCORD:** " .. "<@" .. discordid .. "> [||" .. discordid .. "||]" .. "\n`🎮` **STEAM HEX:** ||" .. steamhex .. "||\n`🎮` **FIVEM:** ||" .. fivemid .. "||\n`💿` **LICENSE:** ||" .. fivemlicense .. "||\n`📀` **LICENSE 2:** ||" .. fivemlicense2 .. "||"
    )

end)
