Feature: View a report
  In order to understand mt entries
  As a user of Sweetly
  I want to view a report of entry data

  Scenario:
    Given an entry with date "1/1/15" and value "90"
    Given an entry with date "1/1/15" and value "100"
    Given an entry with date "1/1/15" and value "110"
    When from index, I click on "Reading Reports"
    And set date to "1/1/15"
    Then daily report "maximum" should be "110"
