require 'singleton'

module Geekdesk
  class Control
    include Singleton

    FILENAME = "calibration.yml"

    attr_accessor :rate

    def initialize
      STDERR.puts "initializing..."
      @rate = load_rate
    end

    def calibrate
      @calibrate ||= Calibration.new
      @calibrate.run(1)
    end

    def load_rate
      # 1s / 20 mm
      YAML.load_file(FILENAME)
    rescue Errno::ENOENT, Psych::SyntaxError
      0.05
    end

    def adjust(millimeters_per_5_seconds)
      @rate = 5.0 / millimeters_per_5_seconds
      File.open FILENAME, "w" do |file|
        file << rate.to_yaml
      end
    end

  end
end
