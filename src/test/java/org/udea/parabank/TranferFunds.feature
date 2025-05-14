@parabank_transferfunds
Feature: Transfer funds in parabank

Background:
    * url baseUrl
    * header Accept = 'application/json'
    * def val_fromAccountId = '13344'
    * def val_toAccountId = '14565'
    * def fakerObj = new faker()
    * def val_amount = fakerObj.number().numberBetween(1, 200)

Scenario: Successful Transfer
  Given path 'transfer'
  And param fromAccountId = val_fromAccountId
  And param toAccountId = val_toAccountId
  And param amount = val_amount
  When method POST
  Then status 200
  And match response == "Successfully transferred $" + val_amount + " from account #" + val_fromAccountId + " to account #" + val_toAccountId
