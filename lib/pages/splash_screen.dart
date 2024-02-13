import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_app/pages/page_my_home.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../utils/myphone.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  static const String KEYLOGIN = "login";

  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.yellow.shade100,
        child: Center(
          child: 
          Image.asset("assets/images/splashGIFs.gif",
          height: 80,
          width: 100,
          ),
        ),
      ),
    );
  }

void whereToGo()async{
  var sharedPref = await SharedPreferences.getInstance();
  var isLogedIn = sharedPref.getBool(KEYLOGIN);
  Timer(const Duration(seconds: 5),(){

    if(isLogedIn != null){
      if(isLogedIn){
        Navigator.pushReplacement(context, 
      MaterialPageRoute(builder: (context)=> const PageMyHome()));
      } else {
        Navigator.pushReplacement(context, 
      MaterialPageRoute(builder: (context)=> const MyPhone()));
      }
    }else {
      Navigator.pushReplacement(context, 
      MaterialPageRoute(builder: (context)=> const MyPhone()));
    }

    });
}
}