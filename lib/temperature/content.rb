module Temperature
  module Content
    class << self
      attr_accessor :path_to_file

      def probes
        raw['probes'].values.collect { |raw_probe| Model::Probe.new(raw_probe) }
      end

      def raw
        JSON.parse(File.read(content_file_name))
      end

      def update content
        File.open(content_file_name, 'w') do |file|
          file.write(content)
        end
      end

      def content_file_name
        "#{path_to_file}/temperature.json"
      end
    end
  end
end