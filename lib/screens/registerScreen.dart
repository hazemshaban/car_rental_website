import 'dart:convert';

import 'package:test_web_car/screens/availableCarsScreen.dart';
import 'package:test_web_car/screens/chooseLocationScreen.dart';
import 'package:test_web_car/screens/homeScreen.dart';
import 'package:test_web_car/shared/components/reusable.dart';
import 'package:test_web_car/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
class registerScreen extends StatefulWidget {
  @override
  _registerScreenState createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  bool hide=true;
  bool processing =false;
  TextEditingController emailControler=TextEditingController();
  TextEditingController passControler=TextEditingController();
  TextEditingController fNameControler=TextEditingController();
  TextEditingController lNameControler=TextEditingController();
  TextEditingController numberControler=TextEditingController();
  TextEditingController LocationControler=TextEditingController();

  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/back2.jpeg'),
                fit: BoxFit.cover
            ),),
        child: Row(
          children: <Widget>[
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
                              "Register",
                              style: TextStyle(
                                fontSize: 40,
                                color:Colors.red,
                                fontWeight: FontWeight.bold,

                              ),),
                            SizedBox(height: 20,),
                            textFormFieldCreator(
                              labelText: "First Name",
                              preIcon: Icon(Icons.person),
                              control: fNameControler,
                              function: (value){},
                              valid: (String value){
                                if(value.isEmpty)
                                {
                                  return "First Name is empty";

                                }
                                else
                                  return null;
                              },
                              isPassword: false,


                            ),

                            SizedBox(
                              height: 10,
                            ) ,
                            textFormFieldCreator(
                              labelText: "Last Name",
                              preIcon: Icon(Icons.person),
                              control: lNameControler,
                              function: (value){},
                              valid: (String value){
                                if(value.isEmpty)
                                {
                                  return "Last Name is empty";

                                }
                                else
                                  return null;
                              },
                              isPassword: false,


                            ),
                            SizedBox(
                              height: 10,
                            ) ,
                            textFormFieldCreator(
                              labelText: "Email Adress",
                              preIcon: Icon(Icons.email),
                              control: emailControler,
                              function: (value){},
                              valid: (String value){
                                if(value.isEmpty)
                                {
                                  return "email is empty";

                                }
                                else
                                  return null;
                              },
                              isPassword: false,


                            ),
                            SizedBox(
                              height: 10,
                            ) ,
                            textFormFieldCreator(
                                labelText: "Password",
                                preIcon: Icon(Icons.lock),
                                isPassword: true,
                                hide: hide,
                                function: (value){},
                                control: passControler,
                                passwordHide: (){
                                  setState(() {
                                    hide=!hide;
                                  });

                                },
                                valid: (String value){
                                  if(value.isEmpty)
                                  {
                                    return "the Password is empty";

                                  }
                                  else
                                    return null;
                                }),
                            SizedBox(height: 10,),
                            textFormFieldCreator(
                              labelText: "PhoneNumber",
                              preIcon: Icon(Icons.phone),
                              control: numberControler,
                              function: (value){},
                              valid: (String value){
                                if(value.isEmpty)
                                {
                                  return "PhoneNumber is empty";

                                }
                                else
                                  return null;
                              },
                              isPassword: false,


                            ),
                            SizedBox(height: 10,),
                            textFormFieldCreator(
                              labelText: "Adress",
                              preIcon: Icon(Icons.location_city),
                              control: LocationControler,
                              function: (value){},
                              valid: (String value){
                                if(value.isEmpty)
                                {
                                  return "Adress is empty";

                                }
                                else
                                  return null;
                              },
                              isPassword: false,


                            ),
                            SizedBox(height: 10,),

                            Container(

                              width: double.infinity,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors:[Colors.orange,Colors.redAccent] ),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              height: 40,


                              child: MaterialButton(
                                  onPressed: ()async
                                  {

                                    if(formKey.currentState.validate()){
                                      var url="https://unwavering-distorti.000webhostapp.com/signup.php";
                                      var data={
                                        "fname":fNameControler.text,
                                        "lname":lNameControler.text,
                                        "email":emailControler.text,
                                        "password":passControler.text,
                                        "address":LocationControler.text,
                                        "phone":numberControler.text

                                      };
                                      var res =await http.post(url,body: data);
                                      if(jsonDecode(res.body)=="account already exist")
                                      {Fluttertoast.showToast(
                                          msg:"account already exist",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 2,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0
                                      );

                                      } else
                                        {if(jsonDecode(res.body)=="true") {
                                          await getcarsLocation();
                                          await getClientData(email: emailControler.text,);

                                          Fluttertoast.showToast(
                                              msg:"Done",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 2,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0
                                          );
                                          fNameControler.text='';

                                          lNameControler.text='';
                                          LocationControler.text='';
                                          numberControler.text='';
                                          emailControler.text='';
                                          passControler.text='';
                                          await getcarsData();
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>chooseLocationScreen()));

                                          }
                                        else{
                                          print("not created");
                                        }


                                      }}
                                  },
                                  child:Text(
                                    "Register",
                                    style: TextStyle(color: Colors.white),
                                  )


                              ),

                            ),
                            SizedBox(height: 5,),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(child: Container(),flex: 3,),
          ],
        ),
      ),
    );
  }
}
