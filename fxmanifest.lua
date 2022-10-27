shared_script "@vrp/lib/lib.lua" --Para remover esta pendencia de todos scripts, execute no console o comando "uninstall"

fx_version 'cerulean'
game 'gta5'

client_scripts {
    '@vrp/lib/utils.lua',
    'config.lua',
    'client-side/client.lua'
}

server_scripts {
    '@vrp/lib/utils.lua',
    'config.lua',
    'server-side/server.lua'
}              