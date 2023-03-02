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
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Container(
          child:Column(
            children: [
              Image(image: AssetImage('assets/img1.jpeg')),
              Text("hello"),
            ],
          ),
        ),
      ),
    );
  }
}
