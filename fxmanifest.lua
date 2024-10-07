fx_version "cerulean"
use_fxv2_oal "yes"
lua54 "yes"
game "gta5"
version "1.0.0"
description "A simple spawnselector system"
name 'krs_spawnselector'
author "karos7804"

shared_scripts {
    '@es_extended/imports.lua',
	'@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

ui_page 'ui/index.html'

files {
    
    'ui/*.*',
}