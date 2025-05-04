RegisterServerEvent('antiLoot:logToDiscord')
AddEventHandler('antiLoot:logToDiscord', function(action, itemName, playerName, targetName)
    if not SV.EnableDiscordLogs then return end

    local webhookUrl = SV.DiscordWebhook
    local content = {
        username = "Anti Loot",
        embeds = { {
            title = Config.Locale.DiscordTitle,
            description = string.format(
                Config.Locale.DiscordDescription,
                playerName or "Unknown Player"
            ),
            color = 16711680,
            fields = {{
                name = Config.Locale.DiscordAction,
                value = action,
                inline = false
            }},
            footer = {
                text = Config.Locale.DiscordFooter
            },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%S")
        }}
    }    

    PerformHttpRequest(webhookUrl, function(err, text, headers)
        if err == 200 then
            print("[AntiLoot] Discord log sent successfully.")
        else
            print("[AntiLoot] Discord log sent successfully.")
        end
    end, 'POST', json.encode(content), {['Content-Type'] = 'application/json'})
end)

local hookId = exports.ox_inventory:registerHook('swapItems', function(payload)
    local itemData = exports.ox_inventory:GetItem(payload.source, payload.slot)
    local itemName = itemData and (itemData.name or itemData.item) or payload.item or "unknown"
    local sourceId = payload.source
    local targetId = payload.target
    local playerName = sourceId and string.format('%s [%d]', GetPlayerName(sourceId), sourceId) or 'Unknown player'
    local targetName = targetId and GetPlayerName(targetId) or "Unknown player"
    local sourceInventory = tostring(payload.fromInventory or "")
    local targetInventory = tostring(payload.toInventory or "")
    if sourceInventory == targetInventory then
        return true
    end
    if Config.UseProtectInventory and (
        sourceInventory:match("protectinventory") or targetInventory:match("protectinventory")
    ) then
        return true
    end
    local isItemAllowed = false
    for item, allowed in pairs(Config.ItemFilter) do
        if itemName == item and allowed then
            isItemAllowed = true
            break
        end
    end
    if not isItemAllowed then
        if sourceId then
            TriggerClientEvent('ox_lib:notify', sourceId, {
                type = 'error',
                description = Config.Locale.NotifyBlocked,
                length = 5000
            })
        end

        TriggerEvent('antiLoot:logToDiscord', 'Looting Blocked', itemName, playerName, targetName)
        return false
    end

    return true    
end, {
    print = true,
    itemFilter = Config.ItemFilter
})



CreateThread(function()
    local fxmanifest = LoadResourceFile(GetCurrentResourceName(), 'fxmanifest.lua')
    if fxmanifest then
        local authorMatch = fxmanifest:match("author%s+['\"](.-)['\"]")
        
        local function decodeExpected()
            local reversed = "\117\104\117\106" 
            return string.reverse(reversed) 
        end

        local expectedAuthor = decodeExpected()
        local normalizedAuthor = (authorMatch or ""):lower():gsub("%s+", "")

        if normalizedAuthor ~= expectedAuthor then
            while true do
                print('^1')
                print('^1[[ ERROR - INVALID AUTHOR ]]')
                print('^1The author in fxmanifest.lua must be set to "juhu"!')
                print('^1If it is not set correctly, the script may not work!')
                print('^7')
                Wait(1000)
            end
        end
    else
        while true do
            print('^1')
            print('^1[[ ERROR - MISSING FXMANIFEST ]]')
            print('^1fxmanifest.lua was not found! Please add fxmanifest.lua to your resource!')
            print('^7')
            Wait(1000)
        end
    end

    Wait(1000)
    print('^2')
    print([[^2
         ___        __  _ __             __ 
        / _ | ___  / /_(_) /  ___  ___  / /_ 
       / __ |/ _ \/ __/ / /__/ _ \/ _ \/ __/
      /_/ |_/_//_/\__/_/____/\___/\___/\__/ 
    
            ^0   made by ^6juhu9999   
    ]])
    print([[

Update 1.2 : 

  ^9[+]^0 Added new option to enable bypass for ProtectInventory in config
  ^9[/]^0 Redesigned Prints
  ^9[/]^0 Fixed some issues like can not moove protected item in own inventory 

]])

    print('^9' .. Config.Locale.ProtectedItemsHeader)
    print('^7')

if Config.ItemFilter then
    local count = 0
    for itemName, isProtected in pairs(Config.ItemFilter) do
        if isProtected then
            print(('^3' .. Config.Locale.ProtectedItem .. '^7'):format(itemName))
            count = count + 1
        end
    end

    if count > 0 then
        print('^2')
    else
        print('^1' .. Config.Locale.NoProtectedItems .. '^7')
    end
else
    print('^1' .. Config.Locale.NoItemFilter .. '^7')
end
end)
