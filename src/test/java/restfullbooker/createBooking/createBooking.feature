Feature: Create Booking
  Este servicio es utilizado para poder
  registrar una reserva nueva

  Background:
    * url baseUrl
    * header Accept = 'application/json'

    Scenario Outline: Verificar peticion correcta para crear una reserva reciba 200
      Given path '/booking'
      And request
      """
      {
        "firstname" : "<firstname>",
        "lastname" : "<lastname>",
        "totalprice" : <totalprice>,
        "depositpaid" : <depositpaid>,
        "bookingdates" : {
        "checkin" : "<checkin>",
        "checkout" : "<checkout>"
      },
         "additionalneeds" : "<additionalneeds>"
      }
      """
      When method POST
      Then status 200
      And match response.booking.firstname == '<firstname>'
      And match response.booking.lastname == '<lastname>'
      And match response.booking.totalprice == <totalprice>
      And match response.booking.depositpaid == <depositpaid>
      And match response.booking.bookingdates.checkin == '<checkin>'
      And match response.booking.bookingdates.checkout == '<checkout>'
      And match response.booking.additionalneeds == '<additionalneeds>'
      And match response.bookingid == '#number'
      And match response.booking.firstname == '#string'
      And match response.booking.lastname == '#string'
      And match response.booking.totalprice == '#number'
      And match response.booking.depositpaid == '#boolean'
      And match response.booking.bookingdates.checkin == '#string'
      And match response.booking.bookingdates.checkout == '#string'
      And match response.booking.additionalneeds == '#string'

      Examples:

      |firstname|lastname|totalprice|depositpaid|checkin    |checkout   |additionalneeds|
      |emily    |paris    |100      |true       |2021-02-10 |2021-02-15 |Lunch          |
      |juan     |vega     |80       |true       |2021-03-11 |2021-03-14 |Lunch          |
      |luis     |perez    |60       |false      |2021-04-12 |2021-04-17 |Lunch          |
      |rosa     |reyes    |200      |true       |2021-02-13 |2021-02-19 |Lunch          |
      |elena    |ebert    |90       |false      |2021-03-14 |2021-03-20 |Lunch          |
      |carlos   |lopez    |30       |true       |2021-06-15 |2021-06-20 |Lunch          |
      |sonia    |arias    |110      |true       |2021-08-16 |2021-08-21 |Lunch          |