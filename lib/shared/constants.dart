import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

String  endDateCarReservation=DateFormat('yyyy-MM-dd').format(DateTime(2024));
String  startDateCarReservation=DateFormat('yyyy-MM-dd').format(DateTime(2015));

///////////////////////used variables/////////////////////////////////////////////
var locations;
List reservations;
List carAllReservations;
String currentLocationID;
List cars;
List allCars;
List carLocations;
List filteredCars;
List clients;
List loginClient;
List reservationToPay;
////////////////////////////////////////////////////////////////////////////



///////////////////////////////functions to get data from database//////////////////////////
Future<void> getcarsData() async
{
  var url="https://unwavering-distorti.000webhostapp.com/getcars.php";
  var data={
    "brand":"BMW",
  };
  var res =await http.post(url,body: data);
  allCars = convert.jsonDecode(res.body);
  cars=allCars;

}
Future<void> getcarsLocation() async
{
  var url="https://unwavering-distorti.000webhostapp.com/getdata.php";
  var data={
    "datatype":"location",
  };
  var res =await http.post(url,body: data);
  carLocations = convert.jsonDecode(res.body);

}

Future<void> updateCars() async
{
  var url="https://unwavering-distorti.000webhostapp.com/updateCars.php";
  var data={
    "today_date":DateFormat('yyyy-MM-dd').format(DateTime.now()),
  };
  var res =await http.post(url,body: data);

}
Future<void> getfilteredcars({String color,String brand,String category,String id} ) async
{
  var url="https://unwavering-distorti.000webhostapp.com/test.php";
  var data={
    "color":color,
    "category":category,
    "brand":brand,
    'location_id':id
  };

  var res =await http.post(url,body: data);
  filteredCars= convert.jsonDecode(res.body);
  cars=filteredCars;

}
Future<void> searchCars({String color,String brand,String category,String id ,String year,String status,String plate_id} ) async
{
  var url="https://unwavering-distorti.000webhostapp.com/searchCar.php";
  var data={
    'color':color,
    'category':category,
    'brand':brand,
    'location_id':id,
    'year':year,
    'status':status,
    'plate_id':plate_id


  };

  var res =await http.post(url,body: data);
  filteredCars= convert.jsonDecode(res.body);
  cars=filteredCars;

}
Future<void> searchClients({String fname,String lname,String address,String email ,String phone} ) async
{
  var url="https://unwavering-distorti.000webhostapp.com/searchClient.php";
  var data={
    'fname':fname,
    'lname':lname,
    'email':email,
    'phone':phone,
    'address':address,

  };


  var res =await http.post(url,body: data);
  clients= convert.jsonDecode(res.body);
  print(clients);
}

Future<void> editDeleteCars({String color,String brand,String category,String id ,String year,String status,String plate_id,String option,String old_plate_id} ) async
{
  var url="https://unwavering-distorti.000webhostapp.com/editDeleteCars.php";
  var data={
    'old_plate_id':old_plate_id,
    'option':option,
    'color':color,
    'category':category,
    'brand':brand,
    'location_id':id,
    'year':year,
    'status':status,
    'plate_id':plate_id
  };

  var res =await http.post(url,body: data);


}


Future<void> getreservationData({String option,String startDate,String endDate,String car_id,String client_id}) async
{
  var url="https://unwavering-distorti.000webhostapp.com/getReservationData.php";

  var data={
    "option":option,
    "startDate":startDate,
    "endDate":endDate,
    "car_id":car_id,
    'client_id':client_id
  };

  var res =await http.post(url,body: data);
  reservations= convert.jsonDecode(res.body);


}

Future<void> getcarsFilteredByLocation(String id) async
{
  var url="https://unwavering-distorti.000webhostapp.com/getCarsFilteredByLocation.php";
  var data={
    "location_id":id,
  };
  var res =await http.post(url,body: data);
  filteredCars = convert.jsonDecode(res.body);
  cars=filteredCars;

}


Future<void> getCarAllReservations(String car_id) async
{
  var url="https://unwavering-distorti.000webhostapp.com/getCarReservationData.php";
  var data={
    "car_id":car_id,
  };
  var res =await http.post(url,body: data);
  carAllReservations = convert.jsonDecode(res.body);
  reservations=carAllReservations;

}


Future<void> Reserve({String car_id,String client_id,String reservation_date,String pickup_date,String return_date}) async
{
  var url="https://unwavering-distorti.000webhostapp.com/reserve.php";
  var data={
    "car_id":car_id,
    "client_id":client_id,
    "reservation_date":reservation_date,
    'pickup_date':pickup_date,
    'return_date':return_date
  };
  var res =await http.post(url,body: data);


}

Future<void> getClientData({String email}) async
{
  var url="https://unwavering-distorti.000webhostapp.com/getClientData.php";
  var data={
    'email':email
  };
  var res =await http.post(url,body: data);
  loginClient = convert.jsonDecode(res.body);


}
Future<void> getreservationTopay({String email}) async
{
  var url="https://unwavering-distorti.000webhostapp.com/getReservationToPay.php";
  var data={
    'email':email
  };
  var res =await http.post(url,body: data);
  reservationToPay = convert.jsonDecode(res.body);

}
Future<void> updatePayment({String email}) async
{
  var url = "https://unwavering-distorti.000webhostapp.com/updatePayment.php";
  var data = {
    'email': email
  };
  var res = await http.post(url, body: data);
}

var brnads=[
  'All',
  'Ranault',
  'Chevrolet',
  'Hyundai',
  'Geely',
  'Mazda',
  'Mitsubishi',
  'Kia',
  'Toyota',
  'Jeep',
  'Peugeot',
  'Audi',
  'Ford',
  'Nissan',
  'Honda',
  'BMW',
  'Mercedez-Benz',
  'Mini',
  'Volkswagen',
  'Seat',
  'Opel',
  'MG',
  'BYD',
  'Tesla',
  'Dodge',
  'Fiat',
  'Lada'

];
var colors=[
  'All',
  'Blue',
  'Beige',
  'Black',
  'Navy Blue',
  'Brown',
  'Burgundy',
  'Gold',
  'Grey',
  'Green',
  'Orange',
  'Red',
  'Silver',
  'White',
  'Yellow'

];
var categories=[
  'All',
  'Sedan',
  'Coupe',
  'Hatchback',
  'SUV',

];

var status=[
  'All',
  'OUT OF SERVICE',
  'ACTIVE',

];
var brandsManger=[
  'Ranault',
  'Chevrolet',
  'Hyundai',
  'Geely',
  'Mazda',
  'Mitsubishi',
  'Kia',
  'Toyota',
  'Jeep',
  'Peugeot',
  'Audi',
  'Ford',
  'Nissan',
  'Honda',
  'BMW',
  'Mercedez-Benz',
  'Mini',
  'Volkswagen',
  'Seat',
  'Opel',
  'MG',
  'BYD',
  'Tesla',
  'Dodge',
  'Fiat',
  'Lada'

];
var colorsManger=[
  'Blue',
  'Beige',
  'Black',
  'Navy Blue',
  'Brown',
  'Burgundy',
  'Gold',
  'Grey',
  'Green',
  'Orange',
  'Red',
  'Silver',
  'White',
  'Yellow'

];
var categoriesManger=[
  'Sedan',
  'Coupe',
  'Hatchback',
  'SUV',

];

var statusManger=[
  'OUT OF SERVICE',
  'ACTIVE',

];
