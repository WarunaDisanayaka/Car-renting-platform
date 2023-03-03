import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Select'),
      ),
      backgroundColor: Colors.amber,
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 30,),

            //select stsrt date
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(1)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          // handle the tap event
                          print('Icon tapped!');
                        },
                      ),
                      hintText: '2023/03/20',
                    ),
                  ),
                ),
              ),
            ),
          ],

        ),
      ),
    );
  }
}
