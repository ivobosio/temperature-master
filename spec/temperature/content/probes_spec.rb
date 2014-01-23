require 'spec_helper'

describe Temperature::Content::Probes do
  before :each do
    File.open("#{File.dirname("#{__dir__}/spec/")}/temperature.json", 'w') do |file|
      content = <<CONTENT
{
    "probes": {
        "sonda_1": {
            "name": "Sonda 1",
            "temperatures": {
                "min": "1.0",
                "max": "2.0"
            }
        },
        "sonda_2": {
            "name": "Sonda 2",
            "temperatures": {
                "min": "3.0",
                "max": "4.0"
            }
        },
        "sonda_3": {
            "name": "Sonda 3",
            "temperatures": {
                "min": "5.0",
                "max": "6.0"
            }
        }
    },
    "emails": [
        "pippo1@tin.it",
        "pippo2@tin.it",
        "pippo3@tin.it"
    ]
}
CONTENT
      file.write(content)
    end

    Temperature::Content.stub(:path_to_file).and_return File.dirname("#{__dir__}/spec/")
  end

  describe 'all' do
    it 'should read temperature from a file' do
      Temperature::Content::Probes.all.should == [
          Temperature::Model::Probe.new('name' => 'Sonda 1', 'temperatures' => {'min' => '1.0', 'max' => '2.0'}),
          Temperature::Model::Probe.new('name' => 'Sonda 2', 'temperatures' => {'min' => '3.0', 'max' => '4.0'}),
          Temperature::Model::Probe.new('name' => 'Sonda 3', 'temperatures' => {'min' => '5.0', 'max' => '6.0'})
      ]
    end
  end

  context 'update' do
    it 'should update temperatures' do
      updated_probes = [
          Temperature::Model::Probe.new('name' => 'Sonda 1', 'temperatures' => {'min' => '999.9', 'max' => '888.8'}),
          Temperature::Model::Probe.new('name' => 'Sonda 2', 'temperatures' => {'min' => '777.7', 'max' => '666.6'}),
          Temperature::Model::Probe.new('name' => 'Sonda 3', 'temperatures' => {'min' => '555.5', 'max' => '444.4'})
      ]

      Temperature::Content::Probes.update(*updated_probes)
      Temperature::Content::Probes.all.should == updated_probes
    end
  end
end