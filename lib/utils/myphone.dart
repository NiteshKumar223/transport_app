import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/utils/colors.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({super.key});

  static String verify = "";

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController contrCountryCode = TextEditingController();
  TextEditingController contrPhoneNum = TextEditingController();
  var phone = "";

  @override
  void initState() {
    contrCountryCode.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 160),
              const SizedBox(
                height: 250,
                width: 250,
                child: Image(image: AssetImage("assets/images/entmobile.png"),)
        
              ),
              const SizedBox(height: 15.0),
              const Text("Phone Verification",style: TextStyle(fontSize: 20.0),),
              const SizedBox(height: 15.0),
              const Text("Enter your phone number to register on this app for using every services provided by us",
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black38,
              ),
              textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30.0),

              Container(
                height: 50,
                width: screensize.width,
                decoration: BoxDecoration(
                  border: Border.all(color: colorprimary,width: 2),
                  borderRadius: BorderRadius.circular(5.0)
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10.0),
                    SizedBox(
                      height: 50.0,
                      width: 40.0,
                      child: TextFormField(
                        controller: contrCountryCode,
                        style: const TextStyle(
                          fontSize: 18.0,
                        ),
                        keyboardType: TextInputType.phone,
                        cursorColor: colorprimary,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          
                        ),
        
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0,top: 5.0,bottom: 5.0),
                      child: VerticalDivider(thickness: 2.0,color: colorprimary),
                    ),
                    SizedBox(
                      height: 50.0,
                      width: screensize.width-100,
                      child: TextFormField(
                        controller: contrPhoneNum,
                        onChanged: (value) {
                          phone = value;
                        },
                        style: const TextStyle(
                          fontSize: 18.0,
                        ),
                        keyboardType: TextInputType.phone,
                        cursorColor: colorprimary,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          
                        ),
        
                      ),
                    ),    
                  ],
                ),
              ),
              const SizedBox(height: 15.0),
              ElevatedButton(
                onPressed: ()async{

                  await FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: '${contrCountryCode.text + phone}',
                  verificationCompleted: (PhoneAuthCredential credential) {},
                  verificationFailed: (FirebaseAuthException e) {},
                  codeSent: (String verificationId, int? resendToken) {
                    MyPhone.verify = verificationId;
                    Navigator.pushNamed(context, 'otp');
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {},
);

                  // Navigator.pushNamed(context, 'otp');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorprimary,
                  fixedSize: Size(screensize.width, 45)
        
                ), 
                child: const Text("Send OTP",style: TextStyle(fontSize: 20.0,color: Colors.white),),
              ),
              const SizedBox(height: 20.0),
        
        
          ]),
        ),
      )
    );
  }
}