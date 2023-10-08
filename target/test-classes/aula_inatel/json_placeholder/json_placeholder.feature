Feature: Testando resources da API json placeholder

Background: Executa uma vez antes de cada teste
    * def url_base = 'https://jsonplaceholder.typicode.com'
    * def request_json1 = read('json_teste.json')
    * def request_json2 = read('json_teste2.json')

Scenario: Pegando elementos do array de response e testando eu tipo
    Given url url_base
    And path '/posts'
    When method get
    Then status 200
    And match $ == '#[]' //verificando se a resposta é um array
    And match $ == '#[100]' // verificando se o array possui 100 elementos
    And match each $ contains {title: '#string', userId:'#number'}

Scenario Outline: Criando um novo elemento usando o metodo POST
    Given url url_base
    And path '/posts'
    And request <request_json1>
    When method post
    Then status 201
    And match $.id == 101
    And match $.title == '#string'
    And match $.body == '<body>'
    And match $.userId == '#number'

    Examples:
    | request_json1 | body        | 
    | request_json1 | Body teste  |
    | request_json2 | Body teste2 |