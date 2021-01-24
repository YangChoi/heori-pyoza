class HardWorker
    include Sidekiq::HardWorker
    require 'discordrb'

    def perform(name, count)
        '허리를 폅시다!'
    end
end