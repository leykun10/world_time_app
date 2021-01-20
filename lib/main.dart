import 'package:flutter/material.dart';
import 'pages/Home.dart';
import 'pages/Loading_screen.dart';
import 'pages/choose_location.dart';



void main()=>runApp(MaterialApp(debugShowCheckedModeBanner: false,
  initialRoute: '/',

     routes: {"/":(context)=>loading(),
      '/home':(context)=>Home(),
       '/location':(context)=>ChooseLocation()},

));