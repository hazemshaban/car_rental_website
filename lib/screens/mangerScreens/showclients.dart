import 'package:test_web_car/screens/mangerScreens/resevationsScreen.dart';
import 'package:test_web_car/shared/constants.dart';
import 'package:flutter/material.dart';

class showClientsScreen extends StatefulWidget {
  @override
  _showClientsScreenState createState() => _showClientsScreenState();
}

class _showClientsScreenState extends State<showClientsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(200),
      ),
      body:Container(

        decoration: BoxDecoration(
          image:DecorationImage(image:  AssetImage('assets/images/manger.jpg',),
            fit: BoxFit.cover,),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 20),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context,index)=> GestureDetector(
                      onTap: ()async{
                        await getreservationData(startDate: startDateCarReservation,endDate: endDateCarReservation,car_id: 'All',
                            option: 'Client',client_id:clients[index]["client_id"]);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>reservationsScreen()));

                      },
                      child: Card(
                        color: Colors.black.withOpacity(200),

                        child: Column(
                          children: <Widget>[
                            Text('First Name: ${clients[index]["fname"]}',style: TextStyle(color: Colors.white),),
                            Text('Last Name: ${clients[index]["lname"]}',style: TextStyle(color: Colors.white),),
                            Text('Email : ${clients[index]["email"]}',style: TextStyle(color: Colors.white),),
                            Text('Phone : ${clients[index]["phone"]}',style: TextStyle(color: Colors.white),),
                            Text('Address : ${clients[index]["address"]}',style: TextStyle(color: Colors.white),),


                          ],
                        ),
                      ),
                    ),
                    separatorBuilder: (context,index)=>SizedBox(height: 5,
                    ),
                    itemCount: clients.length),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
