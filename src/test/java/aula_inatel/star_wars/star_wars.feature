Feature: Testando API StarWars.

Scenario: Testando Retorno people/1/.
    Given url "https://swapi.dev/api/people/1/"
    When method get
    Then status 200
Scenario: Testando Retorno people/1/.
    Given url "https://swapi.dev/api/people/1/1234"
    When method get
    Then status 404
Scenario: Testando Retorno people/1/.
    Given url "https://swapi.dev/api/people/1/1234"
    When method get
    Then status 404
Scenario: Testando Retorno people/.
    Given url "https://swapi.dev/api/people/1/"
    When method get
    Then status 200
    And def films = $.films
    And print films
