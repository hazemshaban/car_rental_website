import 'package:test_web_car/shared/components/reusable.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_web_car/shared/constants.dart';
class insertNewCar extends StatefulWidget {
  @override
  _insertNewCarState createState() => _insertNewCarState();
}

class _insertNewCarState extends State<insertNewCar> {
  TextEditingController locationControler=TextEditingController();

  TextEditingController imageControler=TextEditingController();

  TextEditingController modelControler=TextEditingController();

  String dropdownColor ='Red';

  String dropdownBrand ='BMW';

  String dropdownCategory ='SUV';

  TextEditingController yearControler=TextEditingController();

  TextEditingController plate_idControler=TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(200),
      ),
      body: Container(

        decoration: BoxDecoration(
          image:DecorationImage(image:  AssetImage('assets/images/manger.jpg',),
            fit: BoxFit.cover,),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child:SingleChildScrollView(
                        child:Form(
                          key: formKey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  width:400,
                                  color: Colors.black.withOpacity(200),
                                  child: Row(
                                    children: <Widget>[

                                      Text("Brand",style: TextStyle(color: Colors.white),),

                                      Card(
                                        color: Colors.black.withOpacity(200),
                                        child: DropdownButton(

                                          value: dropdownBrand,
                                          items: brandsManger.map((String items) {

                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(items
                                                ,style: TextStyle(color: Colors.white),
                                              ),
                                            );
                                          }).toList(),

                                          dropdownColor: Colors.black.withOpacity(200),
                                          icon: const Icon(Icons.keyboard_arrow_down),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              dropdownBrand = newValue;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child:
                                Container(
                                  width: 400,
                                  color: Colors.black.withOpacity(200),
                                  child: Row(

                                    children: <Widget>[
                                    Text("Color",style: TextStyle(color: Colors.white),)
                                      ,Card(
                                        color: Colors.black.withOpacity(200),
                                        child: DropdownButton(
                                          value: dropdownColor,
                                          items: colorsManger.map((String items) {

                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(items
                                                ,style: TextStyle(color: Colors.white),
                                              ),
                                            );
                                          }).toList(),

                                          dropdownColor: Colors.black.withOpacity(200),

                                          icon: const Icon(Icons.keyboard_arrow_down),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              dropdownColor = newValue;
                                            });
                                          },

                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  width: 400,
                                  color: Colors.black.withOpacity(200),
                                  child: Row(

                                    children: <Widget>[

                                      Text("Category",style: TextStyle(color: Colors.white),),

                                      Card(
                                        color: Colors.black.withOpacity(200),
                                        elevation: 10,
                                        child:
                                        DropdownButton(
                                          value: dropdownCategory,
                                          items: categoriesManger.map((String items) {

                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(items
                                                ,style: TextStyle(color: Colors.white),
                                              ),
                                            );
                                          }).toList(),

                                          dropdownColor: Colors.black.withOpacity(200),

                                          icon: const Icon(Icons.keyboard_arrow_down),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              dropdownCategory = newValue;
                                            });
                                          },
                                        ),

                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Card(
                                  color: Colors.black.withOpacity(200),
                                  child: textFormFieldCreator(labelText: "Model",
                                      preIcon:Icon(Icons.directions_car) , control: modelControler, valid: (String value) {
                                        if (value.isEmpty) {
                                          return "the Model is empty";
                                        } else
                                          return null;
                                      }),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Card(
                                  color: Colors.black.withOpacity(200),
                                  child: textFormFieldCreator(labelText: "Year",
                                      preIcon:Icon(Icons.access_time) , control: yearControler, valid: (String value) {
                                        if (value.isEmpty) {
                                          return "the Year is empty";
                                        } else
                                          return null;
                                      }),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Card(
                                  color: Colors.black.withOpacity(200),
                                  child: textFormFieldCreator(labelText: "Image URL",
                                      preIcon:Icon(Icons.image) , control: imageControler, valid: (String value) {
                                        if (value.isEmpty) {
                                          return "the Image URL is empty";
                                        } else
                                          return null;
                                      }),

                                ),

                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Card(
                                  color: Colors.black.withOpacity(200),
                                  child: textFormFieldCreator(labelText: "PLATE_ID ",
                                      preIcon:Icon(Icons.directions_car) , control: plate_idControler, valid: (String value) {
                                        if (value.isEmpty) {
                                          return "the Plate_Id  is empty";
                                        } else
                                          return null;
                                      }),

                                ),

                              ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                            color: Colors.black.withOpacity(200),
                            child: textFormFieldCreator(labelText: "Location Id",
                                preIcon:Icon(Icons.location_on) , control: locationControler, valid: (String value) {
                                  if (value.isEmpty) {
                                    return "the Location Id is empty";
                                  } else
                                    return null;
                                }),
                          ),)
                            ],
                          ),
                        ),
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors:[Colors.black,Colors.brown] ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: MaterialButton(
                        onPressed: ()async
                        {

                          if(formKey.currentState.validate()){
                            var url="https://unwavering-distorti.000webhostapp.com/insertCar.php";
                            var data={
                              "category":dropdownCategory,
                              "year":yearControler.text,
                              "brand":dropdownBrand,
                              "model":modelControler.text,
                              "location":locationControler.text,
                              "image_url":imageControler.text,
                              "color":dropdownColor,
                              "plate_id":plate_idControler.text

                            };
                            var res =await http.post(url,body: data);
                            print("fff");
                            print(res.body);
                            if(jsonDecode(res.body)=="true")
                            {
                              print("done");
                              Navigator.pop(context);
                            }
                            else{
                              print("not Created");


                            }}
                        },
                        child: Text(
                          "Inert",
                          style: TextStyle(color: Colors.white,fontSize: 18),
                        ),


                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container(),flex: 3,),
          ],
        ),
      ),
    );
  }
}
