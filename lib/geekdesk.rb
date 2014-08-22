$: << File.dirname(__FILE__) + "/geekdesk/"

require "yaml"
require "piface"

module Geekdesk
  autoload :VERSION, 'geekdesk/VERSION'
  autoload :API, 'geekdesk/api'
  autoload :Calibration, 'geekdesk/calibration'
  autoload :Command, 'geekdesk/command'
  autoload :Control, 'geekdesk/control'
  autoload :DeviceIn, 'geekdesk/device_in'
  autoload :DeviceOut, 'geekdesk/device_out'
  autoload :State, 'geekdesk/state'
end
