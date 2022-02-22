import 'package:test_web_car/shared/components/reusable.dart';
import 'package:test_web_car/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:test_web_car/shared/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

class paymentScreen extends StatefulWidget {
  // Initial Selected Value
  @override
  _paymentScreenState createState() => _paymentScreenState();
}

class _paymentScreenState extends State<paymentScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.black.withOpacity(200),
        ),

        body:  Container(
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
                  padding: const EdgeInsets.all(13.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width:300,
                        child: Text("ALL RECIPTS",
                          maxLines: 2
                          ,style: TextStyle(
                              color: Colors.red,
                              fontSize: 40,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                            itemBuilder:(context,index)=> Card(
                              color: Colors.white.withOpacity(200),
                              child: Column(
                                children: <Widget>[
                                  Text("Brand: ${reservationToPay[index]['brand']}"),
                                  Text("Model: ${reservationToPay[index]['model']}"),
                                  Text("PickUP Date: ${reservationToPay[index]['pickup_date']}"),
                                  Text("Return_Date: ${reservationToPay[index]['return_date']}"),
                                  Text("PayMent: ${reservationToPay[index]["pay"]}"),
                                  MaterialButton(onPressed: ()async{

                                  })
                                ],
                              ),
                            )
                            ,
                            separatorBuilder: (context,index)=>SizedBox(height: 2,),
                            itemCount: reservationToPay.length),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                          child: Container(
                            height:50,
                            width: 200,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors:[Colors.orange,Colors.redAccent] ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: MaterialButton(
                              onPressed: ()async{
                                await updatePayment(email:loginClient[0]['email']);
                                Fluttertoast.showToast(
                                    msg: "Done",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Pay",
                                style: TextStyle(color: Colors.white,fontSize: 18),
                              ),


                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
