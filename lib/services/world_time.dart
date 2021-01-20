import 'package:http/http.dart';
import 'dart:convert';
import  'package:intl/intl.dart';
class WorldTime{
  double size;
  String location;
  String time;
  String flag;
  bool isdaytime;
  String url; // url for  the api endpoint;
  WorldTime({this.location,this.flag,this.url});
 Future<void> getData()async{
   try{ Response response=await
   get('http://worldtimeapi.org/api/timezone/$url');
   Map data=jsonDecode(response.body);
   String datetime=data['datetime'];
   String offset=data['utc_offset'];
   offset=offset.substring(1,3);
   DateTime now=DateTime.parse(datetime);
   now=now.add(Duration(hours: int.parse(offset))) ;
   isdaytime= now.hour > 6 && now.hour<20?true:false;
   size=70;

   time=DateFormat.jm().format(now);}
   catch (e){
     print('the error is $e');

     size=20;
     time='could not get time';
   }

  }
}
