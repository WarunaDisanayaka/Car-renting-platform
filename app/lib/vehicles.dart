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
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 8, left: 10, right: 10),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),


              ),
            )

          ],
        ),
      ),
    );
  }
}
