Then(/^I should see the value of (min|max) temperature for '(.*)' to be '(.*)'$/) do |temperature, probe, value|
  browser.send(probe.to_snake_case).send(temperature).value.should == value
end

Then(/^I should see '(.*)'$/) do |text|
  raise "Expected to see '#{text}'" unless browser.text_on_page?(text)
end