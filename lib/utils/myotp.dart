import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/pages/splash_screen.dart';
import 'package:login_app/utils/colors.dart';
import 'package:login_app/utils/myphone.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyOtp extends StatefulWidget {
  const MyOtp({super.key});

  @override
  State<MyOtp> createState() => _MyOtpState();
}

class _MyOtpState extends State<MyOtp> {
  TextEditingController controllerOtp = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  var code = "";

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    final defaultPinTheme = PinTheme(
      width: 40,
      height: 50,
      textStyle: const TextStyle(
          fontSize: 18,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: colorprimary,width: 2.0),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 90.0),
                const SizedBox(
                    height: 250,
                    width: 250,
                    child: Image(
                      image: AssetImage("assets/images/Entotpp.png"),
                    )),
                const SizedBox(height: 15.0),
                const Text(
                  "OTP Verification",
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  "Enter OTP recieved through Message to login",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black38,
                  ),
                ),
                const SizedBox(height: 30.0),

                Pinput(
                  length: 6,
                  showCursor: true,
                  onChanged: (value) {
                    code = value;
                  },
                  defaultPinTheme: defaultPinTheme,
                 
                ),

             
                const SizedBox(height: 15.0),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      // Create a PhoneAuthCredential with the code
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                        verificationId: MyPhone.verify,
                        smsCode: code,
                      );
                      // Sign the user in (or link) with the credential
                      await auth.signInWithCredential(credential);

                      var sharedPref = await SharedPreferences.getInstance();
                      sharedPref.setBool(SplashScreenState.KEYLOGIN, true);

                      Navigator.pushNamedAndRemoveUntil(
                          context, "home", (route) => false);
                    } 
                    catch (e) {
                      debugPrint("wrong otp");
                      showDialog(
                        context:context,
                        builder: (BuildContext context) {
                          return const AlertDialog(
                            content: Text(
                              "Entered OTP is wrong",
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          );
                        }
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colorprimary,
                      fixedSize: Size(screensize.width, 45)),
                  child: const Text(
                    "Verify",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () async {
                          Navigator.pushNamedAndRemoveUntil(
                              context, 'phone', (route) => false);
                        },
                        child: Text(
                          'Edit Phone Number ?',
                          style: TextStyle(
                            color: colorprimary,
                          ),
                        )),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
