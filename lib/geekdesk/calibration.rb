 module Geekdesk 
  class Calibration

    def initialize
    end

    def calibrate(inches)
    end

    def run(direction)
      Piface.write(direction, Piface::HIGH)
      sleep 5
      Piface.write(direction, Piface::LOW)
    end
  end
end
