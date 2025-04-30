                                                                                                                                                                                                                              --[[
        _____          ____     
       / ___/__  ___  / _(_)__ _
      / /__/ _ \/ _ \/ _/ / _ `/
      \___/\___/_//_/_//_/\_, / 
                         /___/                                                                                                                                                                                                  ]]

Config = {}

Config.UseProtectInventory = true                 -- [[ Enable this only if you are using JG_ProtectInventory ]]

Config.ItemFilter = {                             -- [[ Add here your protected items ]]
    water = true,
    WEAPON_PISTOL = true
}

Config.Locale = {                                 -- [[ Your Locales for Logs , Notifications etc.]]
    NotifyBlocked = "You can't move this item!",
    DiscordTitle = "🚫 Blocked Move Attempt",
    DiscordDescription = "**%s** tried to move **%s** to **%s**, but it was blocked.",
    DiscordAction = "Action",
    DiscordFooter = "Anti Loot System",
    ProtectedItemsHeader = "Protected items:",
    ProtectedItem = "[ ➜ ] ^5 %s",
    TotalProtected = "Total protected items: ^7 %d",
    NoProtectedItems = "No protected items found in Config.ItemFilter!",
    NoItemFilter = "Config.ItemFilter is not set!"
}

--[[
Config.Locale = {                                 
NotifyBlocked = "Nemůžeš přesunout tento item!",
DiscordTitle = "🚫 Pokus o blokované přesunutí",
DiscordDescription = "**%s** se pokusil přesunout **%s** do **%s**, ale bylo to zablokováno.",
DiscordAction = "Akce",
DiscordFooter = "Anti Loot Systém",
ProtectedItemsHeader = "Chráněné itemy :",
ProtectedItem = "[ ➜ ] ^5 %s",
NoProtectedItems = "Nebyl nalezen žádný chráněný item v Config.ItemFilter!",
NoItemFilter = "Config.ItemFilter není nastaven!"
}
]]



