$LOAD_PATH.unshift("#{File.dirname(__dir__)}/../lib")

require 'temperature'

module Temperature
  module Model
    class Probe
      def == other
        self.id == other.id && self.name == other.name &&
            self.min_temperature == other.min_temperature && self.max_temperature == other.max_temperature
      end
    end
  end
end