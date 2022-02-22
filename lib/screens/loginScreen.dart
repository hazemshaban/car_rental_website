import 'dart:convert';

import 'package:test_web_car/screens/chooseLocationScreen.dart';
import 'package:test_web_car/screens/homeScreen.dart';
import 'package:test_web_car/screens/mangerScreens/mangerScreen.dart';
import 'package:flutter/material.dart';
import 'package:test_web_car/shared/components/reusable.dart';
import 'package:test_web_car/screens/registerScreen.dart';
import 'package:http/http.dart' as http;
import 'package:test_web_car/shared/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  bool hide = true;

  String mangerEmail = "hazem@gmail.com";
  String mangerPassword = "123456789";
  TextEditingController emailControler = TextEditingController();
  TextEditingController passControler = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back.jpg'),
            fit: BoxFit.cover
          )
        ),


        child: Row(
          children: <Widget>[
            Expanded(child: Container(),flex: 3,),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Container(

                        width: 300,
                        child: Column(
                          children: <Widget>[
                            Text(
                              "LOGIN",
                              style: TextStyle(
                                fontSize: 60,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            textFormFieldCreator(
                              labelText: "Email Adress",
                              preIcon: Icon(Icons.email),
                              control: emailControler,
                              function: (value) {},
                              valid: (String value) {
                                if (value.isEmpty) {
                                  return "email is empty";
                                } else
                                  return null;
                              },
                              isPassword: false,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            textFormFieldCreator(
                                labelText: "Password",
                                preIcon: Icon(Icons.lock),
                                isPassword: true,
                                hide: hide,
                                function: (value) {},
                                control: passControler,
                                passwordHide: () {
                                  setState(() {
                                    hide = !hide;
                                  });
                                },
                                valid: (String value) {
                                  if (value.isEmpty) {
                                    return "the pass is empty";
                                  } else
                                    return null;
                                }),
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors:[Colors.orange,Colors.redAccent] ),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              height: 50,
                              child: MaterialButton(
                                onPressed: () async {
                                  if(emailControler.text==mangerEmail && passControler.text==mangerPassword  )
                                    {emailControler.text='';
                                    passControler.text='';
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>mangerStartScreen()));
                                    }
                                  else
                                    {


                                      var url =
                                          "https://unwavering-distorti.000webhostapp.com/signin.php";

                                      if(formKey.currentState.validate()){
                                        var data = {
                                          "email": emailControler.text,
                                          "password": passControler.text
                                        };

                                        var res = await http.post(url, body: data);

                                        if (jsonDecode(res.body) == "don't") {
                                          passControler.text='';
                                          Fluttertoast.showToast(
                                              msg: "The Email is Not Exist",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0
                                          );
                                        } else {
                                          if (jsonDecode(res.body) == "false") {
                                            passControler.text='';
                                            Fluttertoast.showToast(
                                                msg: "The Password or The Email is Not True",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0
                                            );
                                          } else {
                                            passControler.text='';
                                            await getClientData(email: emailControler.text,);
                                            Fluttertoast.showToast(
                                                msg:"hello ${loginClient[0]["fname"]}${loginClient[0]["lname"]}",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 2,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0
                                            );

                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>chooseLocationScreen()));
                                          }}
                                      };
                                    }


                                },
                                child: Text(
                                  "login",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Don't have an account?"),
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => registerScreen()));
                                  },
                                  child: Text(
                                    "Register",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
