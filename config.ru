ROOT_DIR = File.dirname(__FILE__)

$LOAD_PATH.unshift("#{ROOT_DIR}/lib")

require 'temperature'

module Temperature
  class App < Sinatra::Base
    configure do
      set :root, ROOT_DIR
    end

    configure :test do
      Content.path_to_file = "#{ROOT_DIR}/features/support"
    end

    configure :development do
      Content.path_to_file = ROOT_DIR
    end

    configure :production do
      Content.path_to_file = '/tmp'
    end
  end
end

run Temperature::App