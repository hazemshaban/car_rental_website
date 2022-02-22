
import 'package:test_web_car/screens/mangerScreens/showclients.dart';
import 'package:flutter/material.dart';
import 'package:test_web_car/shared/components/reusable.dart';
import 'package:test_web_car/shared/constants.dart';
class  searchClientsScreen extends StatelessWidget {
  TextEditingController fnameControler=TextEditingController();
  TextEditingController lnameControler=TextEditingController();
  TextEditingController emailControler=TextEditingController();
  TextEditingController phoneControler=TextEditingController();
  TextEditingController addressControler=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(

        decoration: BoxDecoration(
          image:DecorationImage(image:  AssetImage('assets/images/manger.jpg',),
            fit: BoxFit.cover,),
        ),
        child: Center(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Card(
                        color: Colors.black.withOpacity(200),
                        child: textFormFieldCreator(labelText: "First Name",
                          preIcon:Icon(Icons.person) , control: fnameControler, ),
                      ),Card(
                        color: Colors.black.withOpacity(200),
                        child: textFormFieldCreator(labelText: "Last Name",
                          preIcon:Icon(Icons.person) , control: lnameControler, ),
                      ),Card(
                        color: Colors.black.withOpacity(200),
                        child: textFormFieldCreator(labelText: "Email",
                          preIcon:Icon(Icons.email) , control: emailControler, ),
                      ),Card(
                        color: Colors.black.withOpacity(200),
                        child: textFormFieldCreator(labelText: "Phone",
                          preIcon:Icon(Icons.phone) , control: phoneControler, ),
                      ),
                      Card(
                        color: Colors.black.withOpacity(200),
                        child: textFormFieldCreator(labelText: "Address",
                          preIcon:Icon(Icons.location_on) , control: addressControler, ),

                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height:50,
                          width: 200,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors:[Colors.black,Colors.brown] ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: MaterialButton(
                            onPressed: ()async{


                              await searchClients(fname: (fnameControler.text=='')?'All':fnameControler.text,lname: (lnameControler.text=='')?'All':lnameControler.text,email: (emailControler.text=='')?'All':emailControler.text,
                                  phone: (phoneControler.text=='')?'All':phoneControler.text,address: (addressControler.text=='')?'All':addressControler.text);

                              Navigator.push(context, MaterialPageRoute(builder: (context)=>showClientsScreen()));
                            },
                            child: Text(
                              "Search",
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
