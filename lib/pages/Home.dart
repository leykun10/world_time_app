import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {
   data=data.isEmpty?ModalRoute.of(context).settings.arguments:data;
   String setimage=data['isdaytime']? 'day.png':'night.jpg';
   Color isColor=data['isdaytime']? Colors.blue:Colors.indigo;
    return
     Scaffold(backgroundColor: isColor,body: SafeArea(
       child: Container(decoration:
        BoxDecoration(image: DecorationImage(image: AssetImage('assets/$setimage'),fit:
        BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0 ,120,0,0 ),
            child: Column(
              children: <Widget>[
                FlatButton.icon(onPressed: ()async {
                 dynamic result=await Navigator.pushNamed(context, '/location');
                 setState(() {
                   data=result;
                 });},
                    icon: Icon(Icons.location_on,color: Colors.white70,), label: Text('Edit location',style: TextStyle(color: Colors.white70),),),

              SizedBox(height: 45,),Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Text(data['location'],style:
                  TextStyle(fontSize: 30.0,))],),SizedBox(height: 20,),
                Text(data['time'],style:TextStyle(fontSize: data['size']),)],

            ),
          ),
        ),
     ),
            
      );

  }
}
