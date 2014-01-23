Given(/^I insert '(.*)' as (min|max) temperature for '(.*)'$/) do |value, temperature, probe|
  browser.send(probe.to_snake_case).send(temperature).set(value)
end