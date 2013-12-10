Given(/^I have no cheese$/) do
  @browser.goto "http://www.google.com"
end

When(/^I press the "(.*?)"$/) do |pepe|
  on(Google).search = pepe
end

Then(/^I should have (\d+) piece of cheese$/) do |num_pieces|
  puts "Rejoice! We have #{num_pieces} pieces of cheese."
end