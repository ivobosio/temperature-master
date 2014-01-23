Given(/^I go to the (.*) page$/) do |page|
  browser.visit(eval("#{page}Page"))
end
When(/^I click '(.*)'$/) do |element_name|
  browser.send(element_name.to_snake_case).click
end