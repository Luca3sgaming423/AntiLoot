--[[ 
     ___        _   _   _                 _   
    / _ \      | | (_) | |               | |  
   / /_\ \_ __ | |_ _  | |     ___   ___ | |_ 
   |  _  | '_ \| __| | | |    / _ \ / _ \| __|
   | | | | | | | |_| | | |___| (_) | (_) | |_ 
   \_| |_/_| |_|\__|_| \_____/\___/ \___/ \__|   
                                           
]]

--    [[ MAIN SETTINGS ]]

fx_version 'cerulean'
game 'gta5'

description 'Anti Loot Script'
author 'juhu'
version '1.2'      
lua54 'yes'

--    [[ SERVER - SIDE SCRIPTS ]]

server_scripts { 
    'src/server.lua', 
    'config/config.lua' 
}

--    [[ ESCROW SETTINGS ]]

escrow_ignore {
    'config/**.lua'
}
