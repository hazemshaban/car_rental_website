import 'dart:math';

import 'package:test_web_car/screens/chooseLocationScreen.dart';
import 'package:test_web_car/screens/startScreen.dart';
import 'package:test_web_car/shared/components/reusable.dart';
import 'package:test_web_car/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'paymentScreen.dart';
class carScreen extends StatefulWidget {
  int index;
  carScreen({this.index});
  @override
  _carScreenState createState() => _carScreenState();
}

class _carScreenState extends State<carScreen>
{
  DateTime pickUpDate = DateTime.now();
  DateTime returnDate= DateTime.now();
  DateTime selectedDate= DateTime.now();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Color(0x44000000),
          elevation: 0,
          actions: <Widget>[
            Container(
              width: 80,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors:[Colors.orange,Colors.redAccent] ),
                borderRadius: BorderRadius.circular(40),
              ),
              height: 40,

              child: MaterialButton(onPressed: ()async{
                print(loginClient[0]['email']);
                await getreservationTopay(email:loginClient[0]['email']);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>paymentScreen()));

              }
                ,child:Text('Pay'),
              ),
            ),SizedBox(width: 40,
            ),
            Container(
              width: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors:[Colors.orange,Colors.redAccent] ),
                borderRadius: BorderRadius.circular(40),
              ),
              height: 40,

              child: MaterialButton(onPressed: (){
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                    loginScreen()), (Route<dynamic> route) => false);
              },
                child: Text("Log out"),
              ),

            ),

          ],
        ),


        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors:[Colors.black,Colors.grey] ),

          ),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 700,
                          height: 500,

                          child:Image(image: NetworkImage(cars[widget.index]["img_url"])),
                        ),
                        SizedBox(height: 8,),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            children: <Widget>[
                              Card(
                                color: Colors.black,
                                elevation: 10,

                                child: Text("${cars[widget.index]["brand"]} ${cars[widget.index]["model"]}  ${cars[widget.index]["year"]}",
                                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                              ),
                              Card(
                                color: Colors.green,
                                shadowColor: Colors.black,
                                elevation: 10,
                                child: Text("${cars[widget.index]["daily_rate"]}\$",
                                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                              ),

                            ],
                          ),
                        ),



                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    cardCreator(label: "Brand",value: cars[widget.index]["brand"]),
                                    SizedBox(height: 20,),
                                    cardCreator(label: "Model",value: cars[widget.index]["model"]),
                                    SizedBox(height: 20,),
                                    cardCreator(label: "Year",value: cars[widget.index]["year"]),
                                    SizedBox(height: 20,),
                                    cardCreator(label: "Color",value: cars[widget.index]["color"]),
                                  ],
                                ),
                              )
                          ),

                          SizedBox(height: 80,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('From:'),
                              Card(
                                elevation: 8,
                                child: MaterialButton(
                                  onPressed:() async{
                                    final DateTime picked =await showDatePicker(context: context,
                                        initialDate: DateTime.now(),
                                        firstDate:DateTime.now() ,
                                        lastDate:DateTime(2022,1,17) );
                                    if (picked != null && picked != pickUpDate)
                                      setState(() {
                                        pickUpDate = picked;
                                      });
                                  },
                                  child: Row(
                                    children: <Widget>[

                                      Text(DateFormat('yyyy-MM-dd').format(pickUpDate)),
                                    ],
                                  ),

                                ),
                              ),
                              SizedBox(width: 50,),
                              Text('To:'),
                              Card(
                                elevation: 8,
                                child: MaterialButton(
                                  onPressed:() async{
                                    final DateTime picked =await showDatePicker(context: context,
                                        initialDate: DateTime.now(),
                                        firstDate:DateTime.now() ,
                                        lastDate:DateTime(2022,1,17) );
                                    if (picked != null && picked != returnDate)
                                      setState(() {
                                        returnDate = picked;
                                      });
                                  },
                                  child: Row(

                                    children: <Widget>[
                                      Text(DateFormat('yyyy-MM-dd').format(returnDate)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              width: 200,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors:(cars[widget.index]['res_open']=='1')?[Colors.orange,Colors.redAccent]:[Colors.grey,Colors.blueGrey] ),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              height: 50,
                              child:MaterialButton(

                              onPressed:(cars[widget.index]['res_open']=='1')? ()async{
                                if(returnDate.isAfter(pickUpDate))
                                {

                                  await Reserve(car_id: cars[widget.index]['plate_id']
                                      ,client_id: loginClient[0]['client_id'],
                                      reservation_date:DateFormat('yyyy-MM-dd').format(DateTime.now()).toString(),
                                      pickup_date: DateFormat('yyyy-MM-dd').format(pickUpDate).toString(),
                                      return_date: DateFormat('yyyy-MM-dd').format(returnDate).toString()
                                  );
                                  await updateCars();


                                  Fluttertoast.showToast(
                                      msg: "Done",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0
                                  );

                                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                      chooseLocationScreen()), (Route<dynamic> route) => false);
                                }
                                else
                                {
                                  Fluttertoast.showToast(
                                      msg: "Return Date Is After pickup Date ",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0
                                  );
                                }
                              }:(){
                                Fluttertoast.showToast(
                                    msg: "The car is already Reserved ",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );

                              },
                                child: Text('Reserve'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),


                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}