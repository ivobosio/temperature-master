module Temperature
  class App < Sinatra::Base
    get '/temperatures' do
      haml :temperatures
    end

    post '/temperatures' do
      updated_probes = params[:probes].collect { |probe_id, probe_data| Model::Probe.new(probe_data) }
      Content::Probes.update(*updated_probes)
      redirect '/temperatures?result=success'
    end
  end
end