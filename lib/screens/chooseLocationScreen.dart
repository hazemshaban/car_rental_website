import 'package:test_web_car/screens/paymentScreen.dart';
import 'package:test_web_car/shared/components/reusable.dart';
import 'package:test_web_car/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:test_web_car/screens/availableCarsScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'paymentScreen.dart';
import 'startScreen.dart';
class chooseLocationScreen extends StatefulWidget {
  @override
  _chooseLocationScreenState createState() => _chooseLocationScreenState();
}

class _chooseLocationScreenState extends State<chooseLocationScreen> {
  // Initial Selected Value
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu

  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              width: 80,
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



        body:  Container(
          decoration: BoxDecoration(
            image:DecorationImage(image:  AssetImage('assets/images/back.jpg',),
              fit: BoxFit.cover,),
          ),
          child: Row(
            
            children: <Widget>[
              Expanded(child: Container(),flex: 3,),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width:300,
                        child: Text("CHOOSER CAR LOCATION",
                        maxLines: 2
                        ,style: TextStyle(
                            color: Colors.red,
                            fontSize: 40,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                            itemBuilder:(context,index)=> cardLocationCreator(index: index
                            ,onTap: ()async{
                                  currentLocationID=carLocations[index]["0"];
                                  await getcarsFilteredByLocation(carLocations[index]["0"]);
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>availableCarsScreen()));


                                }
                            ),
                            separatorBuilder: (context,index)=>SizedBox(height: 2,),
                            itemCount: carLocations.length),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                          child: Container(
                            height:50,
                            width: 200,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors:[Colors.orange,Colors.redAccent] ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: MaterialButton(
                              onPressed: ()async{
                                await getcarsData();
                                currentLocationID='All';
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>availableCarsScreen()));
                              },
                              child: Text(
                                "All locations",
                                style: TextStyle(color: Colors.white,fontSize: 18),
                              ),


                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
