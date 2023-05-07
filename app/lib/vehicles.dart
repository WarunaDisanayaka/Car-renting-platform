import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cr_app/viewvehicle.dart';

import 'myaccount.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();

}
List<String> imageList = [

  'assets/cr1.jpg',
  'assets/cr2.jpg',
  'assets/cr3.jpg',
];


class _ProductListState extends State<ProductList> {
  final databaseReference = FirebaseFirestore.instance;

  List<Map<dynamic, dynamic>> productList = [];

  @override
  void initState() {
    super.initState();
    databaseReference.collection("products").get().then((QuerySnapshot snapshot) {
      setState(() {
        productList = snapshot.docs.map((DocumentSnapshot document) => document.data() as Map<dynamic, dynamic>).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(47, 114, 100, 1),
        elevation: 0.0,
        title: Text('Available Vehicle'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(47, 114, 100, 1),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('My Account'),
              onTap: () {
                // Handle navigation to the home screen
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>  MyAccount()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle navigation to the settings screen
              },
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [

            //CarouselSlider
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CarouselSlider(
                items: imageList.map((imagePath) {
                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(8.0),

                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          width: 520,
                        ),
                      ),
                    ],
                  );
                }).toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 16 / 6,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                ),
              ),
            ),


            Expanded(
              child: productList.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                itemCount: productList.length,
                itemBuilder: (BuildContext context, int index) {
                  Map<dynamic, dynamic> product = productList[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10, bottom: 0, left: 10, right: 10),
                            child: Column(
                              children: [
                                Container(
                                  height: 120,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 15,
                                                bottom: 2,
                                                left: 10,
                                                right: 10),
                                            child: Text(
                                              product["brand"] ?? "",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 6,
                                                bottom: 2,
                                                left: 10,
                                                right: 10),
                                            child: Text(
                                              product["model"]?? "",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 6,
                                                bottom: 0,
                                                left: 10,
                                                right: 10),
                                            child: Text(
                                              "RS: ${product["price"]?? ""}  | Per Day",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 6, bottom: 0, left: 0, right: 20),
                                        child: Flexible(
                                          child: Image(
                                            image: AssetImage(
                                              'assets/v1.png',
                                            ),
                                            height: 100,
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Vehicle info bar
                          Padding(
                            padding:
                            EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 2),
                                        child: Icon(Icons.analytics),
                                      ),
                                      Text("Petrol"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 2),
                                        child: Icon(Icons.person),
                                      ),
                                      Text("${product["seats"]} Seats"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 2),
                                        child: Icon(Icons.directions_car),
                                      ),
                                      Text("${product["transmission"]}"),
                                    ],
                                  ),
                                  OutlinedButton(
                                    child: Text(
                                      "View",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      side: BorderSide(
                                        width: 2.0, // set the border weight to 2.0
                                        color: Colors.green,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      fixedSize: Size(100, 30),
                                    ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => view(product: product),
                                          ),
                                        );
                                      }
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }}