import 'package:test_web_car/screens/availableCarsScreen.dart';
import 'package:test_web_car/screens/mangerScreens/insertNewCar.dart';
import 'package:test_web_car/screens/mangerScreens/reportsScreen.dart';
import 'package:test_web_car/screens/mangerScreens/searchClients.dart';
import 'package:test_web_car/screens/mangerScreens/showAllcars.dart';
import 'package:test_web_car/shared/constants.dart';
import 'package:test_web_car/shared/components/reusable.dart';
import 'package:flutter/material.dart';
import 'package:test_web_car/screens/startScreen.dart';
class mangerStartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions:<Widget>[
          Center(
          child: Container(
            width: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors:[Colors.black,Colors.brown] ),
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
              child:SingleChildScrollView(
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    mangerOptionsCreator(label: "ADD NEW CAR",onTap: ()async{
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>insertNewCar()));
                    }),
                    mangerOptionsCreator(label: "Edit Car",onTap: ()async{
                      await getcarsData();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>availableCarsScreenManger(edit: true,)));
                    }),
                    mangerOptionsCreator(label: "Reports",onTap: ()async{
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>reportsScreen()));
                    }),

                  ],
                ),
              )
            ),
            Expanded(child: Container(),flex: 3,)
          ],
        ),
      ),
    );
  }
}
