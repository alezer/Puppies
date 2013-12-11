Feature: Adopting puppies

  As a puppy lover
  I want to adopt puppies
  So they can chew my furniture

  Scenario: Adopting one puppy
    Given I am on the puppy adoption site
    When I click the View Details button for "Maggie Mae"
    And I click the Adopt Me button
    And I click the Complete the Adoption button
    And I complete the checkout form
    Then I should see "Thank you for adopting a puppy!"

  Scenario: Validate cart with one puppy
    Given I am on the puppy adoption site
    When I click the View Details button for "Brook"
    And I click the Adopt Me button
    Then I should see "Brook" as the name for line item 1
    And I should see "$34.95" as the subtotal for line item 1
    And I should see "$34.95" as the cart total

  Scenario: Adopting two puppies
    Given I am on the puppy adoption site
    When I click the View Details button for "Brook"
    And I click the Adopt Me button
    And I click the Adopt Another Puppy button
    And I click the View Details button for "Hanna"
    And I click the Adopt Me button
    And I click the Complete the Adoption button
    And I complete the checkout form
    Then I should see "Thank you for adopting a puppy!"

  Scenario: Name is a required field
    Given I already chosen a puppy to adopt
    When I complete form without a name
    Then I should see the error message "Name can't be blank"

  Scenario: Address is a required field
    Given I already chosen a puppy to adopt
    When I complete form without an address
    Then I should see the error message "Address can't be blank"

  Scenario: Email is a required field
    Given I already chosen a puppy to adopt
    When I complete form without an email
    Then I should see the error message "Email can't be blank"