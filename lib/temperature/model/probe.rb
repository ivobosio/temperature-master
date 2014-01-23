module Temperature
  module Model
    class Probe
      attr_reader :id, :name, :min_temperature, :max_temperature

      def initialize(raw_probe)
        @name = raw_probe['name']
        @id = raw_probe['name'].to_snake_case
        @min_temperature = raw_probe['temperatures']['min']
        @max_temperature = raw_probe['temperatures']['max']
      end

      def to_hash
        {
            'name' => @name,
            'temperatures' => {
                'min' => @min_temperature,
                'max' => @max_temperature
            }
        }
      end
    end
  end
end