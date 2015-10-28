Feature: View Report
  In order to make sense of glucose reading data
  As a user of Sweetly
  I want to view reports for a given date

  Scenario: View report given no data
    Given no data for today
    When I click "Reading Reports" on the "index" page
    Then I am shown "Insufficient data"

  Scenario: View report for today given 4 entries
        Given an entry for today of "95"
        When I click "Reading Reports" on the "index" page
        Then I am shown "Mean Average: 95"
        And I am shown "Maximum Value: 95"
        And I am shown "Minimum Value: 95"
