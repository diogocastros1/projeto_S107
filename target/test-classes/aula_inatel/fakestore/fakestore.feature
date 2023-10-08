Feature: Testando recursos da fakestoreapi.com.

Background: Executa uma vez antes de cada teste
    * def url_base = 'https://fakestoreapi.com'
    * def new_product_json = read('new_product.json')
    * def update_product_json = read('update_product.json')

Scenario: Validando lista de produtos
    Given url url_base
    And path '/products'
    When method get
    Then status 200
Scenario: Buscando por lista inexistente
    Given url url_base
    And path '/product'
    When method get
    Then status 404
Scenario: Buscando um produto da lista e comparando o preço
    Given url url_base
    And path '/products/2'
    When method get
    Then status 200
    And match response.price == 22.3
Scenario: Inserindo novo produto e comparando seu preço
    Given url url_base
    And path '/products'
    And request new_product_json
    When method post
    Then status 200
    And match $.price == 33.33
Scenario: Atualizando o preço do produto 2 e comparando o retorno preço
    Given url url_base
    And path '/products/2'
    And request update_product_json
    When method put
    Then status 200
    And match $.price == 50
Scenario: Deletando produto 2
    Given url url_base
    And path '/products/2'
    And request update_product_json
    When method delete
    Then status 200
