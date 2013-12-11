Given(/^I am on the puppy adoption site$/) do
  visit(Home)
end

When(/^I click the View Details button for "(.*?)"$/) do |puppy_name|
  on(Home).select_puppy(puppy_name)
end

#When(/^I click the second View Details button$/) do
#  on(Puppies).viewDetailsButton
#end

And(/^I complete the checkout form$/) do
  on(Checkout).checkout
end

And(/^I click the Adopt Me button$/) do
  on(Details).adopt_me
end

And(/^I click the Adopt Another Puppy button$/) do
  on(Cart).adopt_another_puppy
end

And(/^I click the Complete the Adoption button$/) do
  on(Cart).complete_adoption
end

And(/^I enter "(.*?)" in the name field$/) do |name|
  on(Checkout).order_name = name
end

And(/^I enter "(.*?)" in the address field$/) do |address|
  on(Checkout).order_address = address
end

And(/^I enter "(.*?)" in the email field$/) do |email|
  on(Checkout).order_email = email
end

And(/^I select "(.*?)" from the pay with dropdown$/) do |pay_type|
  on(Checkout).order_pay_type = pay_type
end

And(/^I click the Place Order button$/) do
  on(Checkout).place_order
end

Then(/^I should see "(.*?)"$/) do |message|
  on(Home).notice.should include message
end

Given(/^I already chosen a puppy to adopt$/) do
  visit(Home)
  on(Home).select_puppy
  on(Details).adopt_me
  on(Cart).complete_adoption
end

When (/^I complete form without a name$/) do
  on(Checkout).checkout('order_name' => '')
end

When (/^I complete form without an address$/) do
  on(Checkout).checkout('order_address' => '')
end

When (/^I complete form without an email$/) do
  on(Checkout).checkout('order_email' => '')
end

Then (/^I should see the error message "([^"]*)"$/) do |message|
  on(Checkout).error_messages.should include message
end

Then /^I should see "([^"]*)" as the name for line item (\d+)$/ do |name, line_item|
  on(Cart).cart_line_item(line_item)[1].text.should include name
  #on(Cart).validate_information(name, line_item)
end

And /^I should see "([^"]*)" as the subtotal for line item (\d+)$/ do |subtotal,line_item|
  on(Cart).cart_line_item(line_item)[3].text.should include subtotal
  #on(Cart).validate_information(subtotal, line_item)
end

And /^I should see "([^"]*)" as the cart total$/ do |total|
  on(Cart).validate_total(total)
end