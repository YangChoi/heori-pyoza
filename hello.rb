require 'discordrb'
require 'dotenv'

Dotenv.load('discord.env')
bot = Discordrb::Bot.new token: ENV['DISCORD_API_KEY']

bot.message(with_text: '안녕!') do |event|
    event.respond '허리펴자 채널에 오신 것을 환영합니다. 
당신의 허리는 소중합니다. 
한 시간에 한 번 씩 허리 펴자 알람을 해드립니다. '
end

bot.run