import 'package:flutter/material.dart';

class view extends StatefulWidget {
  final Map<dynamic, dynamic> product;

  const view({Key? key, required this.product}) : super(key: key);

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product["brand"] ?? ""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.product["model"] ?? "",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "RS: ${widget.product["price"] ?? ""}  | Per Day",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Fuel Type: ${widget.product["fuelType"] ?? ""}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Seats: ${widget.product["seats"] ?? ""}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Transmission: ${widget.product["transmission"] ?? ""}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
