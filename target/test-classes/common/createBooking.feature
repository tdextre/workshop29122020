Feature: Create Booking
  Este servicio es utilizado para poder
  registrar una reserva nueva

  Background:
    * url baseUrl
    * header Accept = 'application/json'

    Scenario: Verificar peticion correcta para crear una reserva reciba 200
      Given path '/booking'
      And request
      """
      {
        "firstname" : "Tulya",
        "lastname" : "Dextre",
        "totalprice" : 777,
        "depositpaid" : true,
        "bookingdates" : {
        "checkin" : "2021-01-01",
        "checkout" : "2021-01-20"
      },
         "additionalneeds" : "Lunch"
      }
      """
      When method POST
      Then status 200
      And match response.booking.firstname == 'Tulya'
      And match response.booking.lastname == 'Dextre'
      And match response.booking.totalprice == 777
      And match response.booking.depositpaid == true
      And match response.booking.bookingdates.checkin == '2021-01-01'
      And match response.booking.bookingdates.checkout == '2021-01-20'
      And match response.booking.additionalneeds == 'Lunch'
