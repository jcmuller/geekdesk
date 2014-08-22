module Geekdesk
  class DeviceIn

    DIRECTIONS = [
      UP = 0,
      DOWN = 1
    ]

    def initialize
      @memo = {}
      fork do
        listen
      end
    end

    def listen
      loop do
        work
      end
    end

    def work
      DIRECTIONS.each do |direction|
        val = Piface.read(direction)

        if val != memo[direction]
          Piface.write(direction, val)
          memo[direction] = val
        end
        sleep 0.1
      end
    end

    private

    attr_reader :memo

  end
end
