import 'dart:async';
import 'dart:math';
import 'package:cr_app/myaccount.dart';
import 'package:cr_app/paypal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

import 'package:cr_app/vehicles.dart';
import 'package:cr_app/viewvehicle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Initialize Firebase app
class home extends StatefulWidget {
  final Map<dynamic, dynamic> product;

  const home({Key? key, required this.product}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}




String txt = "2023/03/03";
String selectedDateTime = '';
String selectedDateTime2 = '';
TextEditingController _controller = TextEditingController(text: txt);
String _selectedLocationName = '';

List<String> imageList = [
  'assets/cr1.jpg',
  'assets/cr2.jpg',
  'assets/cr3.jpg',
];

final TextEditingController _locationController = TextEditingController();

class _HomeState extends State<home> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  //new added
  static const LatLng _initialCameraPosition = LatLng(6.927079, 79.861244);
  Set<Marker> _markers = Set<Marker>();
  late GoogleMapController _mapController;
  LatLng? _pickedLocation;

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    _mapController = controller;
  }

  void _pickLocation(LatLng position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark placemark = placemarks[0];
    String address = placemark.street! + ", " + placemark.subLocality! + ", " + placemark.locality! + ", " + placemark.administrativeArea! + ", " + placemark.country!;

    setState(() {
      _pickedLocation = position;
      _markers.clear();
      _markers.add(Marker(
        markerId: MarkerId('picked-location'),
        position: _pickedLocation!,
      ));
      _locationController.text = address;
    });
  }

  void _searchLocation() {
    if (_pickedLocation != null) {
      // Use the picked location for search
      print(
          'Search location: ${_pickedLocation!.latitude}, ${_pickedLocation!.longitude}');
    } else {
      // Use the initial location for search
      print(
          'Search location: ${_initialCameraPosition.latitude}, ${_initialCameraPosition.longitude}');
    }
  }

  //end new

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(6.927079, 79.861244),
    zoom: 10.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(6.902820, 79.861244),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(47, 114, 100, 1),
        elevation: 0.0,
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //select stsrt date
              Padding(
                padding:
                    EdgeInsets.only(top: 100, bottom: 8, left: 25, right: 5),
                child: Text(
                  "Select Pic-Up Date ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(3)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child:
                    TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: MediaQuery.of(context).size.height * 0.36,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Done'),
                                      ),
                                      Expanded(
                                        child: CupertinoDatePicker(
                                          mode: CupertinoDatePickerMode.dateAndTime,
                                          minimumDate: DateTime.now(),
                                          onDateTimeChanged: (DateTime dateTime) {
                                            setState(() {
                                              selectedDateTime =
                                                  DateFormat.yMd().add_Hm().format(dateTime).toString();
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        hintText: 'YYYY/MM/DD',
                      ),
                      controller: TextEditingController(text: selectedDateTime),
                    ),
                  ),
                ),
              ),

              //select END date
              Padding(
                padding:
                    EdgeInsets.only(top: 20, bottom: 8, left: 25, right: 5),
                child: Text(
                  "Select END Date ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(3)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      // controller: _controller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            // handle the tap event
                            print('Icon tapped!');
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.36,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Done'),
                                      ),
                                      Expanded(
                                        child: CupertinoDatePicker(
                                          mode: CupertinoDatePickerMode.dateAndTime,
                                          minimumDate: DateTime.now(),
                                          onDateTimeChanged: (DateTime dateTime) {
                                            setState(() {
                                              selectedDateTime2 = DateFormat.yMd().add_Hm().format(dateTime).toString();
                                            });
                                          },
                                        ),
                                      ),

                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        hintText: 'YYYY/MM/DD',
                      ),
                      controller: TextEditingController(text: selectedDateTime2),
                    ),
                  ),
                ),
              ),

              //location
              Padding(
                padding:
                    EdgeInsets.only(top: 20, bottom: 8, left: 25, right: 5),
                child: Text(
                  "Select Location ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(3)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _locationController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            // handle the tap event
                            print('Icon tapped!');
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.46,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Done'),
                                      ),
                                      Expanded(
                                        child: GoogleMap(
                                          onMapCreated: _onMapCreated,
                                          initialCameraPosition: CameraPosition(
                                            target: _initialCameraPosition,
                                            zoom: 11.0,
                                          ),
                                          markers: _markers,
                                          onTap: _pickLocation,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        hintText: 'Pic Address , ',
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: Center(
                      child: GestureDetector(
                        onTap: () async {
                          final user = FirebaseAuth.instance.currentUser;
                          final address = _locationController.text;

                          if (address.isEmpty || selectedDateTime.isEmpty || selectedDateTime2.isEmpty) {
                            // Show error message here (e.g., using a dialog)
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Error'),
                                content: Text('Fill all.'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            final ordersRef = FirebaseFirestore.instance.collection('orders');
                            final newOrder = await ordersRef.add({
                              'dateTime': selectedDateTime,
                              'dateTime2': selectedDateTime2,
                              'productModel': "${widget.product["model"] ?? ""}",
                              'user': user?.uid,
                              'address': address,
                            });

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyAccount()),
                            );
                          }
                        },
                        child: Container(
                          color: Color.fromRGBO(47, 114, 100, 1),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(60, 15, 63, 15),
                            child: Text(
                              "Order",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 10,),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: Center(
                      child: GestureDetector(
                        onTap: () async {
                          final user = FirebaseAuth.instance.currentUser;
                          final address = _locationController.text;

                          if (address.isEmpty || selectedDateTime.isEmpty || selectedDateTime2.isEmpty) {
                            // Show error message here (e.g., using a dialog)
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Error'),
                                content: Text('Fill all.'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            final ordersRef = FirebaseFirestore.instance.collection('orders');
                            final newOrder = await ordersRef.add({
                              'dateTime': selectedDateTime,
                              'dateTime2': selectedDateTime2,
                              'productModel': "${widget.product["model"] ?? ""}",
                              'user': user?.uid,
                              'address': address,
                            });

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => paypal(title: '',)),
                              // MaterialPageRoute(builder: (context) => MyAccount()),
                            );
                          }
                        },
                        child: Container(
                          color: Color.fromRGBO(0, 48, 135, 1),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(60, 15, 63, 15),
                            child: Text(
                              "PayPal",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),





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
                            boxShadow: [
                              BoxShadow(
                                color: Colors.green.withOpacity(0.6),
                                spreadRadius: 8,
                                blurRadius: 9,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.cover,
                            width: 430,
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

              Padding(
                padding:
                    EdgeInsets.only(top: 20, bottom: 8, left: 25, right: 5),
                child: Text(
                  "Hot Deals",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),

              Padding(
                padding:
                    EdgeInsets.only(top: 20, bottom: 8, left: 25, right: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Available Vehicles",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Text(
                              "Available Vehicles ",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            print("clicked");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductList()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 50,
                            width: 50,
                            child: Icon(Icons.arrow_forward),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
