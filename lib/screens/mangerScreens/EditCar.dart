import 'package:flutter/cupertino.dart';
import 'package:test_web_car/screens/mangerScreens/mangerScreen.dart';
import 'package:test_web_car/screens/mangerScreens/showAllcars.dart';
import 'package:flutter/material.dart';
import 'package:test_web_car/shared/constants.dart';
import 'package:test_web_car/screens/availableCarsScreen.dart';
import 'package:test_web_car/shared/components/reusable.dart';
import 'package:test_web_car/shared/constants.dart' show brnads, categories, colors, status;

class editDeleteScreen extends StatefulWidget {
   int index;
   editDeleteScreen({this.index});
  @override
  _editDeleteScreenState createState() => _editDeleteScreenState();
}

class _editDeleteScreenState extends State<editDeleteScreen> {
  String dropdownColor ='Red';
  String dropdownBrand ='BMW';
  String dropdownCategory ='SUV';
  String dropdownStatus ='ACTTIVE';
  TextEditingController yearControler=TextEditingController();
  TextEditingController location_idControler=TextEditingController();
  TextEditingController plate_idControler=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    dropdownColor=cars[widget.index]['color'];
    dropdownBrand=cars[widget.index]['brand'];
    dropdownCategory=cars[widget.index]['cat_name'];
    dropdownStatus=(cars[widget.index]['status']=='0')?'OUT OF SERVICE':'ACTIVE';
    yearControler.text=cars[widget.index]['year'];
    location_idControler.text=cars[widget.index]['current_location'];
    plate_idControler.text=cars[widget.index]['plate_id'];


    super.initState();
  }
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image:DecorationImage(image:  AssetImage('assets/images/manger.jpg',),
            fit: BoxFit.cover,),
        ),
        child: Form(
          key:formKey ,
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

                          ],
                        ),
                      ),
                      Card(
                        color: Colors.black.withOpacity(200),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Status"
                              ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
                            ),
                            SizedBox(width: 100,),
                            DropdownButton(
                              value: dropdownStatus,
                              items: statusManger.map((String items) {

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
                                  dropdownStatus = newValue;
                                });
                              },
                            ),


                          ],
                        ),
                      ),
                      Card(
                        color: Colors.black.withOpacity(200),
                        child: textFormFieldCreator(labelText: "Year",
                          preIcon:Icon(Icons.access_time) , control: yearControler,valid: (String value) {
                              if (value.isEmpty) {
                                return "the year is empty";
                              } else
                                return null;
                            } ),
                      ),
                      Card(
                        color: Colors.black.withOpacity(200),

                        child: textFormFieldCreator(labelText: "Location Id",
                          preIcon:Icon(Icons.location_on) , control: location_idControler, valid: (String value) {
                              if (value.isEmpty) {
                                return "the location_id is empty";
                              } else
                                return null;
                            }),
                      ),

                      Card(
                        color: Colors.black.withOpacity(200),

                        child: textFormFieldCreator(labelText: "Plate_Id",
                          preIcon:Icon(Icons.location_on) , control: plate_idControler,valid: (String value) {
                              if (value.isEmpty) {
                                return "the plate_id is empty";
                              } else
                                return null;
                            } ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors:[Colors.black,Colors.brown] ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: MaterialButton(
                            onPressed: ()async{
                              await editDeleteCars(color: dropdownColor,brand: dropdownBrand,year: yearControler.text,
                                category: dropdownCategory,option: 'edit',
                                plate_id: plate_idControler.text,
                                status: (dropdownStatus=='ACTIVE')?'1':'0',
                                id: location_idControler.text,
                                old_plate_id: cars[widget.index]['plate_id']
                              );




                             Navigator.push(context, MaterialPageRoute(builder: (context)=>mangerStartScreen()));
                            },
                            child: Text(
                              "Edit",
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
      ),
    );
  }
}
