import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:test_web_car/screens/registerScreen.dart';
import 'package:test_web_car/screens/loginScreen.dart';

class loginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white70,

      body:Container(
        decoration: BoxDecoration(
          image:DecorationImage(image:  AssetImage('assets/images/back.jpg',),
          fit: BoxFit.cover,),


        ),
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Expanded(child: Container(),flex: 3,),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Center(

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: <Widget>[

                          Container(
                            width: 300,
                            child: Text(
                              "FAST CAR SERVICE ",
                              maxLines: 2,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 60,
                                  color: Colors.red

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors:[Colors.orange,Colors.redAccent] ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: FlatButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder:(context)=>login() ));
                          },
                              child: Text(
                                "Log IN",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                ),
                              )),
                        ),
                        SizedBox(height: 20,),
                        Container(

                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: FlatButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder:(context)=>registerScreen() ));

                          },
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              )),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
