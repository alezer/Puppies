Feature: Adopting puppies

  As a puppy lover
  I want to adopt puppies
  So they can chew my furniture

  Scenario Outline: Adopting one puppy
    Given I am on the puppy adoption site
    When I click the View Details button for "Maggie Mae"
    And I click the Adopt Me button
    And I click the Complete the Adoption button
    And I complete the checkout form
    Then I should see "Thank you for adopting a puppy!"

  Examples:
    |name   |address            |email              |payment      |
    |Juan   |123 Main Street    |cheezy@example.com |Credit card  |
    #|Pedro  |321 Second Street  |
