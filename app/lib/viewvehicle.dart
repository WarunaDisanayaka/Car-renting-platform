import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class view extends StatefulWidget {
  const view({Key? key}) : super(key: key);

  @override
  State<view> createState() => _viewState();
}

class _viewState extends State<view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Select'),
      ),
      body: Container(
        child: Column(
          children: [
            // image CarouselSlider

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage(
                  'assets/cr4.jpeg',
                ),
              ),
            ),

            

          ],
        ),
      ),
    );
  }
}
