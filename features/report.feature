Feature: View Report
  In order to make sense of glucose reading data
  As a user of Sweetly
  I want to view reports for a given date

  Scenario: View report given no data
    Given no data for today
    When I click "Reading Reports" on the "index" page
    Then I am told there is insufficient data for reports
