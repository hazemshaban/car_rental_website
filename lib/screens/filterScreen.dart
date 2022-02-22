import 'package:flutter/cupertino.dart';
import 'package:test_web_car/screens/mangerScreens/showAllcars.dart';
import 'package:flutter/material.dart';
import 'package:test_web_car/shared/constants.dart';
import 'package:test_web_car/screens/availableCarsScreen.dart';
import 'package:test_web_car/shared/components/reusable.dart';
import 'package:test_web_car/shared/constants.dart' show brnads, categories, colors, status;


class filterScreen extends StatefulWidget {
  @override
  _filterScreenState createState() => _filterScreenState();
}

class _filterScreenState extends State<filterScreen> {
  String dropdownColor = 'All';

  String dropdownBrand = 'All';

  String dropdownCategory = 'All';

  String dropdownStatus = 'All';

  TextEditingController yearControler=TextEditingController();

  TextEditingController location_idControler=TextEditingController();

  TextEditingController plate_idControler=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        decoration: BoxDecoration(
          image:DecorationImage(image:  AssetImage('assets/images/back2.jpeg',),
            fit: BoxFit.cover,),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      color: Colors.black.withOpacity(200),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Color"
                            ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
                          ),
                          SizedBox(width: 100,),

                          DropdownButton(
                            value: dropdownColor,
                            items: colors.map((String items) {

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
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.black.withOpacity(200),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Brand"
                            ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
                          ),
                          SizedBox(width: 100,),
                          DropdownButton(

                            value: dropdownBrand,
                            items: brnads.map((String items) {

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
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.black.withOpacity(200),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Category"
                            ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
                          ),
                          SizedBox(width: 100,),

                          DropdownButton(
                            value: dropdownCategory,
                            items: categories.map((String items) {

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

                        ],
                      ),
                    ),
                    Card(
                      color: Colors.black.withOpacity(200),
                      child: textFormFieldCreator(labelText: "Year",
                        preIcon:Icon(Icons.access_time) , control: yearControler, ),
                    ),
                    Card(
                      color: Colors.black.withOpacity(200),
                      child: textFormFieldCreator(labelText: "Location Id",
                        preIcon:Icon(Icons.location_on) , control: location_idControler, ),
                    ),

                    Card(
                      color: Colors.black.withOpacity(200),
                      child: textFormFieldCreator(labelText: "Plate_Id",
                        preIcon:Icon(Icons.location_on) , control: plate_idControler, ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors:[Colors.red,Colors.orange] ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        height: 50,
                        child: MaterialButton(
                          onPressed: ()async{


                            await searchCars(category: dropdownCategory,color: dropdownColor,brand: dropdownBrand,id:(location_idControler.text=='')?'All':location_idControler.text,
                                year:(yearControler.text=='')?'All':yearControler.text,plate_id:(plate_idControler.text=='')?'All':plate_idControler.text,status:'1');

                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                availableCarsScreen()), (Route<dynamic> route) => false);

                          },
                          child: Text(
                            "Seach",
                            style: TextStyle(color: Colors.white,fontSize: 18),
                          ),


                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Expanded(child:Container(),flex: 3,)
          ],
        ),
      ),
    );
  }
}
