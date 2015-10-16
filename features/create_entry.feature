Feature: Create a new entry
  In order to enable blood glucose monitoring
  As a user of Sweetly
  I want to create a new blood glucose entry

  Scenario: Create a glucose entry given 3 today
    Given 3 entries so far today
    When I submit an entry with value of "90"
    Then I am returned to the index page
    And I am given an accurate readout of how many readings I have entered today

    Scenario: Create a glucose entry given 4 today
      Given 4 entries so far today
      When I submit an entry with value of "90"
      Then I am returned to the index page
      And I am told that I already have 4 entries

    Scenario: Attempt to create an entry with blank value
      Given 0 entries so far today
      When I submit an entry with value of ""
      And I am told that my entry "can't be blank"

    Scenario: Attempt to create an entry with non-number value
      Given 0 entries so far today
      When I submit an entry with value of "banana"
      And I am told that my entry "is not a number"
