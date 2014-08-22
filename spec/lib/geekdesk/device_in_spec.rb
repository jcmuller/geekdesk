require 'spec_helper'

RSpec.describe Geekdesk::DeviceIn, pending: true do
  subject { described_class.new }

  describe "work", pending: "A" do
    before do
      #Piface.stub(:read).and_return(Piface::LOW)
    end

    it "should call move with up for 1000 when up is pressed" do
      subject.work
    end

    it "should not call move with up for 1000 when up is pressed" do
      subject.work
    end

    it "should call move with down for 1000 when down is pressed" do
      Piface.stub(:read).with(1).and_return(Piface::HIGH)
      expect(device_out).to receive(:move).with(1, 1000)
      subject.work
    end

    it "should not call move with down for 1000 when down is pressed" do
      Piface.stub(:read).with(1).and_return(Piface::LOW)
      expect(device_out).not_to receive(:move).with(1, 1000)
      subject.work
    end

  end
end
