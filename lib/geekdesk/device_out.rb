 module Geekdesk 
  class DeviceOut

    UP = 0
    DOWN = 1

    def control
      @control ||= Control.instance
    end

    def execute(command)
      time = command.millimeters * control.rate
      dir = case command.direction
            when :up
              UP
            when :down
              DOWN
            end
      move(dir, time)
    end

    def up seconds = 1
      move(UP, seconds)
    end

    def down seconds = 1
      move(DOWN, seconds)
    end

    private

    def move(pin, seconds)
      t = Time.now
      Piface.write(pin, Piface::HIGH)
      fork do
        sleep seconds
        d = Time.now - t
        STDERR.puts "#{d} seconds at #{control.rate} s/mm for #{d * seconds} millimeters"
        Piface.write(pin, Piface::LOW)
      end
    end
  end
end
