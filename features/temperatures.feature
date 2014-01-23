Feature: Temperatures
  Temperatures for all probes can be viewed and managed in the Temperatures page

  Scenario: Viewing temperatures
    Given I go to the Temperatures page
    Then I should see the value of min temperature for 'Sonda 1' to be '1.0'

  Scenario: Editing temperatures
    Given I go to the Temperatures page
    When I insert '2.5' as min temperature for 'Sonda 1'
    And I click 'Update temperatures'
    Then I should see 'Update successful'
    And I should see the value of min temperature for 'Sonda 1' to be '2.5'