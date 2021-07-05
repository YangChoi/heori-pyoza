require 'discordrb'
require 'dotenv'

module Bot::Commands
  module General 
    extend Discordrb::Commands::CommandContainer
    command :hello do |event|
      event.respond "
환영합니다, #{event.user.name} 님
당신의 허리는 소중합니다. 
한 시간에 한 번 씩 허리 펴자 알람을 해드립니다.  
"
    end
  end
end