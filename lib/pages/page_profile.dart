import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/myphone.dart';
import 'splash_screen.dart';

class PageProfile extends StatefulWidget {
  const PageProfile({super.key});

  @override
  State<PageProfile> createState() => _PageProfileState();
}

class _PageProfileState extends State<PageProfile> {
  FirebaseAuth auth = FirebaseAuth.instance;

  signOutFire() async {
    await auth.signOut().then((value) => Navigator.of(context)
        .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const MyPhone()),
            (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return SizedBox(
      height: screensize.height,
      width: screensize.width,
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: colorprimary),
                borderRadius: BorderRadius.circular(50)),
            child: const Icon(
              Icons.person_sharp,
              size: 80,
              color: Colors.grey,
            ),
          ),
          Container(
            height: 5,
            width: screensize.width,
            margin: const EdgeInsets.only(left: 5.0,right: 5.0),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue,
                Colors.green,
                Colors.yellow,
                Colors.red,
              ],
            )),
          ),
          const SizedBox(height: 10.0),
          Card(
            elevation: 3.0,
            child: ListTile(
              leading: Icon(
                Icons.person_sharp,
                size: 35,
                color: colorprimary,
              ),
              title: const Text("Name"),
              subtitle: const Text("John Peter"),
            ),
          ),
          Card(
            elevation: 3.0,
            child: ListTile(
              leading: Icon(
                Icons.phone_android_sharp,
                size: 35,
                color: colorprimary,
              ),
              title: const Text("Mobile No"),
              subtitle: const Text("+91 1234567890"),
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: OutlinedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        titlePadding: EdgeInsets.zero,
                        contentPadding: EdgeInsets.zero,
                        actionsAlignment: MainAxisAlignment.end,
                        title: Container(
                          height: 35,
                          width: screensize.width,
                          color: colorprimary,
                          child: Row(children: [
                            const SizedBox(width: 5.0),
                            const Icon(Icons.question_mark_sharp,
                                color: Colors.red),
                            const SizedBox(width: 5.0),
                            Text(
                              "LogOut",
                              style: TextStyle(
                                fontSize: 20,
                                color: colorwhite,
                              ),
                            )
                          ]),
                        ),
                        content: SizedBox(
                          height: 50,
                          width: screensize.width,
                          child: Center(
                            child: Text(
                              "Are You Sure Want To LogOut ?",
                              style: TextStyle(
                                color: colorblack,
                              ),
                            ),
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () async {
                              var sharedPref = await SharedPreferences.getInstance();
                              sharedPref.setBool(SplashScreenState.KEYLOGIN, false);
                              signOutFire();
                            },
                            child: Text("Yes",
                                style: TextStyle(
                                    fontSize: 18.0, color: colorprimary)),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("No",
                                style: TextStyle(
                                    fontSize: 18.0, color: colorprimary)),
                          )
                        ],
                      );
                    });
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: colorwhite,
                elevation: 5.0,
                    side: BorderSide(color: colorprimary,width: 2),
                  fixedSize: Size(screensize.width - 20, 45)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.logout_sharp,
                      color: Colors.red, size: 30),
                  SizedBox(width: 10),
                  Text(
                    "LogOut",
                    style: TextStyle(fontSize: 20.0, color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
