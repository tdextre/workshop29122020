Feature: Get Booking
  Este servicio es utilizado para el listado de una reserva
  a traves de el codigoId de la reserva

  Background:
    * url baseUrl
    * header Accept = 'application/json'

    Scenario: Verificar peticion correcta con una reserva id reciba cod 200
      * def CreateBookingResponse = call read('classpath:common/createBooking.feature')
      * def bookingId = CreateBookingResponse.response.bookingid
      Given path '/booking/' + bookingId
      When method GET
      Then status 200
      And match response.firstname == 'Tulya'



