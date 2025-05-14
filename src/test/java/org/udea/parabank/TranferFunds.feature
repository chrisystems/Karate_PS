@parabank_transferfunds
Feature: Transfer funds in parabank

Background:
    * url baseUrl
    * header Accept = 'application/json'
    * def val_fromAccountId = '13344'
    * def val_toAccountId = '14565'
    * def fakerObj = new faker()
    * def val_amount = fakerObj.number().numberBetween(1, 200)
    * def val_fromAccountId_error = '12345'
    * def val_toAccountId_error = fakerObj.number().randomNumber(5, true)

Scenario: Successful Transfer
  Given path 'transfer'
  And param fromAccountId = val_fromAccountId
  And param toAccountId = val_toAccountId
  And param amount = val_amount
  When method POST
  Then status 200
  And match response == "Successfully transferred $" + val_amount + " from account #" + val_fromAccountId + " to account #" + val_toAccountId

  Scenario: Transfer Failed by fromAccountId error
  Given path 'transfer'
  And param fromAccountId = val_fromAccountId_error
  And param toAccountId = val_toAccountId_error
  And param amount = val_amount
  When method POST
  Then status 400
  And match response == "Could not find account number" + val_fromAccountId_error + " and/or " + val_toAccountId_error
