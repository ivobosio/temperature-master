module Temperature
  module Content
    module Probes
      class << self
        def update *probes
          content = Content.raw
          probes.each do |probe|
            content['probes'][probe.id] = probe.to_hash
          end
          Content.update(content.to_json)
        end

        def all
          Content.probes
        end
      end
    end
  end
end
