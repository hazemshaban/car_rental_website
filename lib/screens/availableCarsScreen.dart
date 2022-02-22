import 'package:test_web_car/screens/carScreen.dart';
import 'package:test_web_car/screens/chooseLocationScreen.dart';
import 'file:///D:/IdeaProjects/test_web_car/lib/screens/filterScreen.dart';
import 'package:test_web_car/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:test_web_car/shared/components/reusable.dart';
import 'package:flutter/widgets.dart';
import 'paymentScreen.dart';
import 'startScreen.dart';
class availableCarsScreen extends StatefulWidget {

  @override
  _availableCarsScreenState createState() => _availableCarsScreenState();
}

class _availableCarsScreenState extends State<availableCarsScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x44000000),
        elevation: 0,
        actions: <Widget>[
          Container(
            width: 80,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors:[Colors.orange,Colors.redAccent] ),
              borderRadius: BorderRadius.circular(40),
            ),
            height: 40,

            child: MaterialButton(onPressed: ()async{
              print(loginClient[0]['email']);
              await getreservationTopay(email:loginClient[0]['email']);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>paymentScreen()));

            }
              ,child:Text('Pay'),
            ),
          ),SizedBox(width: 40,
          ),
          Container(
            width:80,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors:[Colors.orange,Colors.redAccent] ),
              borderRadius: BorderRadius.circular(40),
            ),
            height: 40,

            child: MaterialButton(onPressed: (){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  loginScreen()), (Route<dynamic> route) => false);
            },
              child: Text("Log out"),
            ),

          ),

        ],
      ),


      body:Container(
        decoration: BoxDecoration(
          image:DecorationImage(image:  AssetImage('assets/images/back.jpg',),
            fit: BoxFit.cover,),
        ),

        child: Row(
          children: <Widget>[
            Expanded(child: Container(),flex: 3,),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Container(
                        width: 140,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors:[Colors.orange,Colors.redAccent] ),
                          borderRadius: BorderRadius.circular(40),
                        ),

                        child: MaterialButton(onPressed: (){
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>filterScreen()));

                          });
                        },
                          child: Text("FILTER",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context,index){
                            return carCard(index,context);
                          },
                          separatorBuilder: (context,index)=>SizedBox(height: 10,)
                          , itemCount: cars.length),
                    ),
                  ],
                ),
              ),
            ),


          ],
        ),
      ),

    );
  }
}
Widget carCard(int index,BuildContext context )=> MaterialButton(
  onPressed:()async{
    await getCarAllReservations(cars[index]["plate_id"]);

    Navigator.push(context, MaterialPageRoute(builder: (context)=>carScreen(index: index,)));},
  child:   Card(
    color: Colors.white.withOpacity(70),
    child: Row(
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


                  Text((cars[index]["res_open"]=='1')?'Availble':'Reserved',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(width: 8,),
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      color:cars[index]["res_open"]=='1'?Colors.green:Colors.red,
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

        Container(
          width: 80,
          height: 40,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors:[Colors.orange,Colors.redAccent] ),
            borderRadius: BorderRadius.circular(40),
          ),


          child: Center(
            child: Text("${cars[index]["daily_rate"]}\$",
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
          ),
        ),




      ],

    ),
  ),
);


