import 'package:test_web_car/screens/carScreen.dart';
import 'package:test_web_car/screens/chooseLocationScreen.dart';
import 'package:test_web_car/screens/mangerScreens/EditCar.dart';
import 'package:test_web_car/screens/mangerScreens/resevationsScreen.dart';
import 'file:///D:/IdeaProjects/test_web_car/lib/screens/filterScreen.dart';
import 'package:test_web_car/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';
import 'package:flutter/widgets.dart';

import 'filterScreenManger.dart';


class availableCarsScreenManger extends StatefulWidget {
  bool edit=false;
availableCarsScreenManger({this.edit});
  @override
  _availableCarsScreenMangerState createState() => _availableCarsScreenMangerState();
}

class _availableCarsScreenMangerState extends State<availableCarsScreenManger> {
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(200),
        title: Center(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors:[Colors.black,Colors.brown] ),
              borderRadius: BorderRadius.circular(40),
            ),
            child: MaterialButton(onPressed: (){
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>filterScreenManger(edit: widget.edit,)));

              });
            },
              child: Text("Search" ,style: TextStyle(color: Colors.white),),
            ),
          ),
        ),
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

                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      return carCard(index,context,
                              !(widget.edit)?()async{
                        await getreservationData(option: 'Car',startDate: startDateCarReservation,endDate: endDateCarReservation,car_id: cars[index]["plate_id"],client_id: 'All');
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> reservationsScreen()));
                      }:()async{
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>editDeleteScreen(index:index ,)));

                              }
                      );
                    },
                    separatorBuilder: (context,index)=>SizedBox(height: 10,)
                    , itemCount: cars.length),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
Widget carCard(int index,BuildContext context ,Function onPressed)=> Container(
  color: Colors.black.withOpacity(150),
  child:   MaterialButton(
    onPressed:onPressed,
    child:   Row(
      children: <Widget>[

        CircleAvatar(

          backgroundImage:NetworkImage(cars[index]["img_url"]),
          radius: 50,
        ),

        SizedBox(width: 8,),

        Expanded(

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[

              Text("${cars[index]["brand"]} ${cars[index]["model"]} ${cars[index]["year"]} ",

                style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),

                maxLines: 1,

                overflow: TextOverflow.ellipsis,



              ),

              SizedBox(height: 2,),

              Row(

                children: <Widget>[

                  Text("${cars[index]["status"]=='1'?"Active":"Out of Stock"}",
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(width: 8,),
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      color:cars[index]["status"]=='1'?Colors.green:Colors.red,
                      shape: BoxShape.circle,

                    ),



                  ),

                  SizedBox(width: 5,),

                  Text(

                    "${cars[index]["cat_name"]}",

                    style: TextStyle(color: Colors.black54),

                  ),


                ],

              ),





            ],

          ),

        ),

        Card(
          color: Colors.black,
          shadowColor: Colors.black,
          elevation: 10,
          child: Text("${cars[index]["daily_rate"]}\$",
            style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
        ),




      ],

    ),
  ),
);


