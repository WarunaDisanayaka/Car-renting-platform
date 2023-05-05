import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cr_app/viewvehicle.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();

}

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
      backgroundColor: Color.fromRGBO(47, 114, 100, 1),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
      body: productList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: productList.length,
        itemBuilder: (BuildContext context, int index) {
          Map<dynamic, dynamic> product = productList[index];
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
            child: Container(
              height: 220,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 15, bottom: 0, left: 10, right: 10),
                    child: Column(
                      children: [
                        Container(
                          height: 150,
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
                                    top: 6, bottom: 5, left: 0, right: 0),
                                child: Flexible(
                                  child: Image(
                                    image: AssetImage(
                                      'assets/v1.png',
                                    ),
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
                              fixedSize: Size(100, 40),
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
    );
  }}