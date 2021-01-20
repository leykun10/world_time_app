import 'package:flutter/material.dart';
import 'package:flutter_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class loading extends StatefulWidget {
  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {
  String time = 'loading';

  void setupWorld_Time() async {
    WorldTime instance = WorldTime(location: 'Addis_Ababa',
        flag: 'Ethiopia.png',
        url: 'Africa/Addis_Ababa');
    await instance.getData();
    Navigator.pushReplacementNamed(
        context, '/home', arguments: {'location': instance.location,
      'flag': instance.flag, 'time': instance.time,
    'size':instance.size,"isdaytime":instance.isdaytime});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorld_Time();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black45
      ,body: Center(child: SpinKitFadingCircle(
      color: Colors.white70,
      size: 80.0,
    ),),);
  }


}