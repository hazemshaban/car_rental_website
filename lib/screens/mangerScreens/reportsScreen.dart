import 'package:flutter/cupertino.dart';
import 'package:test_web_car/screens/availableCarsScreen.dart';
import 'package:test_web_car/screens/mangerScreens/insertNewCar.dart';
import 'package:test_web_car/screens/mangerScreens/resevationsScreen.dart';
import 'package:test_web_car/screens/mangerScreens/searchClients.dart';
import 'package:test_web_car/screens/mangerScreens/showAllcars.dart';
import 'package:test_web_car/screens/mangerScreens/showclients.dart';
import 'package:flutter/material.dart';
import 'package:test_web_car/shared/constants.dart';
import 'package:test_web_car/shared/components/reusable.dart';
import 'package:intl/intl.dart';
import 'package:test_web_car/screens/startScreen.dart';
class reportsScreen extends StatefulWidget {
  @override
  _reportsScreenState createState() => _reportsScreenState();
}

class _reportsScreenState extends State<reportsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions:<Widget>[Center(
          child: Container(
            width: 150,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors:[Colors.brown,Colors.black] ),
              borderRadius: BorderRadius.circular(40),
            ),
            height: 40,

            child: MaterialButton(onPressed: (){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  loginScreen()), (Route<dynamic> route) => false);

            },
              child: Text("Log out",style: TextStyle(color: Colors.white),),
            ),

          ),
        ),],

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("From :"),
                      Card(
                        elevation: 5,
                        color: Colors.white70,
                        child: MaterialButton(
                            child: Text("${startDateCarReservation}"),
                            onPressed:() async{
                              final DateTime picked =await showDatePicker(context: context,
                                  initialDate: DateTime.now(),
                                  firstDate:DateTime(2015) ,
                                  lastDate:DateTime(2024) );
                              if (picked != null && picked != startDateCarReservation)
                                setState(() {
                                  startDateCarReservation = DateFormat('yyyy-MM-dd').format(picked);
                                });
                            }

                        ),
                      ),
                      SizedBox(width: 10,),
                      Text("To :"),
                      Card(
                        elevation: 5,
                        color: Colors.white70,
                        child: MaterialButton(
                            child: Text("${endDateCarReservation}"),
                            onPressed:() async{
                              final DateTime picked=await showDatePicker(context: context,
                                  initialDate: DateTime.now(),
                                  firstDate:DateTime(2015) ,
                                  lastDate:DateTime(2024) );
                              if (picked != null && picked != endDateCarReservation)
                                setState(() {
                                  endDateCarReservation = DateFormat('yyyy-MM-dd').format(picked);
                                });
                            } ),
                      ),


                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(

                      color: Colors.black.withOpacity(200),
                      child: mangerOptionsCreator(label: "Reservations",onTap: ()async{
                        await getreservationData(option: "spec_Date",startDate: startDateCarReservation,endDate: endDateCarReservation ,car_id: 'All',client_id: 'All');

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>reservationsScreen()));
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.black.withOpacity(200),
                      child: mangerOptionsCreator(label: "Reservations of a Car",onTap: ()async{
                        await getcarsData();

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>availableCarsScreenManger(edit: false,)));
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.black.withOpacity(200),
                      child: mangerOptionsCreator(label: "Reservations of a Client",onTap: ()async{


                        Navigator.push(context, MaterialPageRoute(builder: (context)=>searchClientsScreen()));
                      }),
                    ),
                  ),

                ],
              ),
            ),
            Expanded(child:Container(),flex: 3,),

          ],
        ),
      ),
    );;
  }
}
