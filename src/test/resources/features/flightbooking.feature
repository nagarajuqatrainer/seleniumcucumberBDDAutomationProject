Feature: Flight Booking from travel website
  As a user
  I want to search and book flights
  So that I can travel to my preferred destination

  @Positive
  Scenario: Successful flight booking with valid details
    Given user launches the travel booking application
    When user logs in with valid username "testuser" and password "Test@123"
    And user searches for flights from "New York" to "London"
    And user selects departure date "2025-09-15" and return date "2025-09-30"
    And user selects number of passengers "2"
    And user clicks on search button
    Then available flights are displayed
    When user selects the first available flight
    And user enters passenger details
    And user proceeds to payment with valid card "4111111111111111" and cvv "123"
    Then booking confirmation should be displayed with booking ID

  @Negative
  Scenario: Flight search with invalid date
    Given user launches the travel booking application
    When user searches for flights from "Paris" to "Dubai"
    And user selects departure date "2025-02-30" and return date "2025-02-10"
    And user clicks on search button
    Then error message "Invalid date selection" should be displayed

  @Negative
  Scenario: Payment failure with invalid card
    Given user launches the travel booking application
    When user logs in with valid username "testuser" and password "Test@123"
    And user searches for flights from "Delhi" to "Sydney"
    And user selects departure date "2025-10-05" and return date "2025-10-20"
    And user clicks on search button
    And user selects the first available flight
    And user enters passenger details
    And user proceeds to payment with invalid card "123456789" and cvv "000"
    Then error message "Payment failed. Please try again." should be displayed
