Feature: Create a new entry
  In order to enable blood glucose monitoring
  As a user of Sweetly
  I want to create a new blood glucose entry

  Scenario: Create an glucose entry given 3 today
    Given 3 entries so far today
    When I submit an entry from the Glucose Reading form page
    Then I am returned to the index page
    And I am given an accurate readout of how many readings I have entered today
