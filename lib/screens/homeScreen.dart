import 'package:test_web_car/screens/availableCarsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_web_car/shared/components/reusable.dart';
import 'package:test_web_car/shared/constants.dart';

class homePage extends StatefulWidget {
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 20,
        title:Center(
          child: Text(
            "CaRental",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,

            ),
          ),
        ),
      ),
      body:Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("FIRST CLASS CAR RENTAL & LIMOUSINE SERVICES"
              ,style: TextStyle(
                fontSize: 15,
                color: Colors.black,

              ),
            ),




            Expanded(
            ) ,

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                color: Colors.black,
                child: MaterialButton(
                  onPressed: (){
                  },
                  child: Text(
                    "ALL Brands",
                    style: TextStyle(color: Colors.white),
                  ),


                ),
              ),
            ),



            Container(
              color: Colors.black,
              height: 100,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    Text("Numeber:01020601062"
                      ,style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 10,),
                    Text("Email:shabanhazem546@gmail.com",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    )
                  ],
                ),
              ),
            )

          ],
        ),
      ) ,
    );
  }
}

