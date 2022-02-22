import 'dart:html';

import 'package:test_web_car/screens/availableCarsScreen.dart';
import 'package:test_web_car/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class reservationsScreen extends StatefulWidget {
  @override
  _reservationsScreenState createState() => _reservationsScreenState();
}

class _reservationsScreenState extends State<reservationsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(

        decoration: BoxDecoration(
          image:DecorationImage(image:  AssetImage('assets/images/manger.jpg',),
            fit: BoxFit.cover,),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Expanded(
                  child:ListView.separated(
                      itemBuilder: (context,index)=>reservationCardCreator(index),
                      separatorBuilder: (context,index)=>SizedBox(height: 10,),
                      itemCount: reservations.length),
              ),
            ],
          ),
        ),
      ),
    );;
  }
}
Widget reservationCardCreator(int index){
  return Container(

    child: Card(
      color: Colors.white.withOpacity(200),
      child: Column(
        children: <Widget>[
          Text("${reservations[index]["reserve_id"]}"),
          Row(
            children: <Widget>[
              Expanded(child: Column(
          children: <Widget>[
            Text('Client Name :${reservations[index]["fname"]} ${reservations[index]["lname"]}',style: TextStyle(color: Colors.white)),
          Text('Email :${reservations[index]["email"]}',style: TextStyle(color: Colors.white)),
          Text('Address :${reservations[index]["address"]}',style: TextStyle(color: Colors.white)),
          Text('Phone : ${reservations[index]["phone"]}',style: TextStyle(color: Colors.white)),
            Text('PickUp : ${reservations[index]["pickup_date"]}',style: TextStyle(color: Colors.white)),
            Text('Reservation Date: ${reservations[index]["reservation_date"]}',style: TextStyle(color: Colors.white)),

          ],
      )),
              Expanded(child: Column(
                children: <Widget>[
                  Text('Car Id: ${reservations[index]["plate_id"]}',style: TextStyle(color: Colors.white),),
                  Text('Model: ${reservations[index]["brand"]} ${reservations[index]["model"]}',style: TextStyle(color: Colors.white)),
                  Text('Year : ${reservations[index]["year"]}',style: TextStyle(color: Colors.white)),
                  Text('Color : ${reservations[index]["color"]}',style: TextStyle(color: Colors.white)),
                  Text('Return : ${reservations[index]["return_date"]}',style: TextStyle(color: Colors.white)),
                  Text('Recipt: ${reservations[index]["payment"]}',style: TextStyle(color: Colors.white)),


                ],
              ))
            ],
          ),


        ],
      ),
    ),
  );

}