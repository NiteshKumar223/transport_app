import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_app/pages/page_my_home.dart';
import 'package:login_app/pages/splash_screen.dart';

import 'utils/myotp.dart';
import 'utils/myphone.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'splash',
    routes: {
      'splash' :(context) => const SplashScreen(),
      'phone' : (context) => const MyPhone(),
      'otp' :(context) => const MyOtp(),
      'home' :(context) => const PageMyHome(),
    },
    theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(

      primary: Colors.yellow[700],
      secondary: Colors.yellow.shade700,

    ),
    ),
  ));
}

