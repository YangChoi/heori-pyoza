require 'discordrb'
require 'json'
require 'ostruct'

module Bot
	CONFIG = OpenStruct.new(JSON.parse(File.open('data/config.json').read))
	BOT = Discordrb::Bot.new token: ENV['DISCORD_API_KEY']

	def self.load_modules(class, path)
		new_module = Module.new
		const_set(class.to_sym, new_module)
		Dir['src/modules/#{path}/*rb'].each { |file| load file }
		new_module.constants.each do |module|
			BOT.include! new_module.const_get(module)
		end
	end

	load_modules(:Commands, 'commands')
	load_modules(:Events, 'events')

	BOT.run :async
	puts "Bot is running"
	BOT.sync
end