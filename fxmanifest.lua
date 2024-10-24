fx_version 'cerulean'
game 'gta5'
lua54 'yes'
use_experimental_fxv2_oal 'yes'
author 'Ticker'
description 'Various small code snippets compiled into one resource for ease of use'
version '1.4.0'

shared_scripts {
    'locales/en.lua',
    'locales/*.lua',
    'config.lua'
}
server_script 'server/*.lua'
client_scripts {
    'client/*.lua'
}

data_file 'FIVEM_LOVES_YOU_4B38E96CC036038F' 'events.meta'
data_file 'FIVEM_LOVES_YOU_341B23A2F0E0F131' 'popgroups.ymt'

files {
    'events.meta',
    'popgroups.ymt',
    'relationships.dat'
}
