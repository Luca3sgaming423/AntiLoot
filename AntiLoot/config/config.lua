                                                                                                                                                                                                                              --[[
        _____          ____     
       / ___/__  ___  / _(_)__ _
      / /__/ _ \/ _ \/ _/ / _ `/
      \___/\___/_//_/_//_/\_, / 
                         /___/                                                                                                                                                                                                  ]]

Config = {}

-- [[ ITEM PROTECTIONS ]]

Config.UseProtectInventory = false                 -- [[ Enable this only if you are using JG_ProtectInventory ]]

Config.ItemFilter = {                             -- [[ Add here your protected items ]]
    water = true,
    WEAPON_PISTOL = true
}

-- [[ DISCORD LOGS ]]

Config.EnableDiscordLogs = false

Config.DiscordWebhook = 'YOUR_WEBHOOK_HERE'

-- [[ LOCALES ]]

Config.Locale = {                                 -- [[ Your Locales for Logs , Notifications etc.]]
    NotifyBlocked = "You can't move this item!",
    DiscordTitle = "🚫 Blocked Move Attempt",
    DiscordDescription = "%s tried to loot something , keep an eye on them!",
    DiscordAction = "Action",
    DiscordFooter = "Anti Loot System",
    ProtectedItemsHeader = "Protected items:",
    ProtectedItem = "[ ➜ ] ^5 %s",
    TotalProtected = "Total protected items: ^7 %d",
    NoProtectedItems = "No protected items found in Config.ItemFilter!",
    NoItemFilter = "Config.ItemFilter is not set!"
}



