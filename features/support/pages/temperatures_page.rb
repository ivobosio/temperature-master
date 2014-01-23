class TemperaturesPage
  include PageMagic
  url "http://localhost:#{ENV['port'] || 9292}/temperatures"

  section :sonda_1, css: '.probe:first-of-type' do
    [:min, :max].each do |temperature|
      text_field temperature, css: "#sonda_1_#{temperature}"
    end
  end

  button :update_temperatures, text: 'Update temperatures'
end