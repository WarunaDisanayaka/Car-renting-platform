import 'package:cr_app/login.dart';
import 'package:cr_app/map.dart';
import 'package:cr_app/register.dart';
import 'package:flutter/material.dart';

class welcome extends StatefulWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image(
                  image: AssetImage(
                    'assets/15.png',
                  ),
                  height: 400,
                ),
              ),
              Text(
                "Select Your Vehicle",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Lets's book your vehicle first you neetto register to the system Thnak you",
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
              ),



              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              width: 2.0, // set the border weight to 2.0
                              color:  Color.fromRGBO(47, 114, 100, 1),
                            ),
                              fixedSize: Size(150, 50),
                          ),
                          onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => login()));
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              width: 2.0, // set the border weight to 2.0
                              color:  Color.fromRGBO(47, 114, 100, 1),
                            ),
                            fixedSize: Size(150, 50),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => register()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
