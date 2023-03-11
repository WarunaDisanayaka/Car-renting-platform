import 'package:flutter/material.dart';

class vehicles extends StatefulWidget {
  const vehicles({Key? key}) : super(key: key);

  @override
  State<vehicles> createState() => _vehiclesState();
}

class _vehiclesState extends State<vehicles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Select'),
      ),
      backgroundColor: Colors.orangeAccent,
      body: Container(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
