import 'package:flutter/material.dart';
import  'package:flutter_app/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
List<WorldTime>  locations=[WorldTime(location: 'Addis_Ababa',
flag: 'ethiopia.png',
url: 'Africa/Addis_Ababa'),WorldTime(location: 'Berlin',
flag: 'germany.png',
url: 'Europe/Berlin'),WorldTime(location: 'Nairobi',
flag: 'kenya.png',
url: 'Africa/Nairobi'),WorldTime(location: 'Seoul',
flag: 'south_korea.png',
url: 'Asia/Seoul'),WorldTime(location: 'Jakarta',
flag: 'indonesia.png',
url: 'Asia/Jakarta'),];
void updateTime(index) async{
  WorldTime instance=locations[index];

  await instance.getData();
  Navigator.pop(context,{
    'location': instance.location,
    'flag': instance.flag, 'time': instance.time,
    'size':instance.size,"isdaytime":instance.isdaytime
  });
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 1.0),
              child: Card(child: ListTile(onTap: (){
                updateTime(index);
                setState(() {

                });
              },title: Text(locations[index].location),
                leading: CircleAvatar(backgroundImage: AssetImage('assets/${locations[index]
              .flag}'),),),),
            );
          }),
    );
  }
}
