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
  on(CheckoutPage).checkout('order_name' => '')
end

When (/^I complete form without an address$/) do
  on(CheckoutPage).checkout('order_address' => '')
end

When (/^I complete form without an email$/) do
  on(CheckoutPage).checkout('order_email' => '')
end

Then (/^I should see the error message "([^"]*)"$/) do |message|
  on(Cart).error_messages.should include message
end