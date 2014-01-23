require 'spec_helper'

describe Temperature::Model::Probe do
  describe 'initialize' do
    it 'with a hash' do
      probe = Temperature::Model::Probe.new('name' => 'Test Probe', 'temperatures' => {'min' => '11.1', 'max' => '2220.2'})
      probe.id.should == 'test_probe'
      probe.name.should == 'Test Probe'
      probe.min_temperature.should == '11.1'
      probe.max_temperature.should == '2220.2'
    end
  end

  describe 'to_hash' do
    it 'should generate raw hash' do
      probe = Temperature::Model::Probe.new('name' => 'Test Probe', 'temperatures' => {'min' => '11.1', 'max' => '2220.2'})
      probe.to_hash.should == {'name' => 'Test Probe', 'temperatures' => {'min' => '11.1', 'max' => '2220.2'}}
    end
  end
end