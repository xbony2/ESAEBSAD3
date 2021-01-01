require 'discordrb'
require 'mediawiki-butt'
require 'tomlrb'

CONFIG = Tomlrb.load_file('config.toml').freeze

puts CONFIG['discord-token']

bot = Discordrb::Bot.new(token: CONFIG['discord-token'])

bot.message(with_text: 'Ping!') do |event|
	event.respond 'Pong!'
end

bot.run
