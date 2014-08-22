require 'spec_helper'

RSpec.describe Geekdesk::DeviceOut do
  describe "up" do
    it "should call move with up for n millis" do
      expect(subject).to receive(:move).with(0, :secs)
      subject.up(:secs)
    end

    it "should call move with down for n millis" do
      expect(subject).to receive(:move).with(1, :secs)
      subject.down(:secs)
    end
  end
end
