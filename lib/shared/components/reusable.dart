import 'package:test_web_car/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Widget textFormFieldCreator(
    {

      Function onTap,
      @required String labelText,
      @required Widget preIcon,
      bool isPassword=false,
      bool hide =false,
      Function passwordHide,
      @required TextEditingController control,
      @required Function valid,
      Function function,


    }
    ) {
  return TextFormField(
    obscureText: hide,
    validator: valid,
    onChanged: function,
    onTap: onTap,



    controller: control,
    decoration: InputDecoration(
        focusColor: Colors.white,
        hoverColor: Colors.black,
        prefixIcon: preIcon,
        labelText: labelText,

        labelStyle: TextStyle(color: Colors.grey),
        suffixIcon: !isPassword ? null : IconButton(
            icon: Icon(hide ? Icons.remove_red_eye : Icons.pan_tool),
            onPressed: passwordHide),

        border: OutlineInputBorder(
        )

    ),


  );
}



Widget carBrandCard( int index,String brand,Function goCarScreen)
{

  return GestureDetector(
      onTap: goCarScreen,
      child: Container(
        child: Stack(

          alignment: Alignment.bottomLeft,
          children: <Widget>[
            Image(image:AssetImage("assets/images/${index.toString()}.jpg")
              ,fit: BoxFit.cover,
            ),
            Text(brand
              ,style: TextStyle(
                  fontWeight: FontWeight.bold
                  ,color: Colors.white
                  ,fontSize: 30
              ),
            )
          ],
        ),
      )

  );


}






Widget cardCreator({String label,String value})
{
  return Card(
    color: Colors.white70,
    child: Container(
      width: 500,
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: <Widget>[
          Text("${label}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
          Expanded(child: Container(width: 100,),),
          Text("${value}",style: TextStyle(fontSize: 15,)),
        ],
      ),
    ),
  );
}
Widget cardLocationCreator({String label,int index,Function onTap})
{
  return Padding(
    padding: const EdgeInsets.all(8),
    child: GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        color: Colors.white70,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 30,
            child: Center(child: Text("${carLocations[index]["3"]} , ${carLocations[index]["2"]} , ${carLocations[index]["1"]}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)),

          ),
        ),
      ),
    ),
  );
}

Widget mangerOptionsCreator({String label,int index,Function onTap})
{
  return Padding(
    padding: const EdgeInsets.all(8),
    child: GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        color: Colors.black.withOpacity(200),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 50,
            child: Center(child: Text(label,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),)),

          ),
        ),
      ),
    ),
  );
}