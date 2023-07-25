<<<<<<< HEAD
<<<<<<< HEAD
// <<<<<<< HEAD
// import 'dart:ui';
//
// import 'package:cr_app/home.dart';
// import 'package:cr_app/myaccount.dart';
// import 'package:cr_app/vehicles.dart';
// import 'package:flutter/material.dart';
//
// class view extends StatefulWidget {
//   final Map<dynamic, dynamic> product;
//
//   const view({Key? key, required this.product}) : super(key: key);
//
//   @override
//   _ViewState createState() => _ViewState();
// }
//
// class _ViewState extends State<view> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(47, 114, 100, 1),
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Color.fromRGBO(47, 114, 100, 1),
//         elevation: 0.0,
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Color.fromRGBO(47, 114, 100, 1),
//               ),
//               child: Text(
//                 'Menu',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text('My Account'),
//               onTap: () {
//                 // Handle navigation to the home screen
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (context) =>  MyAccount()));
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text('Settings'),
//               onTap: () {
//                 // Handle navigation to the settings screen
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Stack(
//         children: [
//           SizedBox(
//             width: double.infinity,
//             child:  Image.network(
//               widget.product["image"] ?? "", // Assuming "model" contains a valid image URL
//               width: 200, // Adjust the width as per your requirement
//               height: 200, // Adjust the height as per your requirement
//             ),
//             height: 390,
//           ),
//
//           scroll(),
//         ],
//       ),
//     );
//   }
//
//   scroll() {
//     return DraggableScrollableSheet(
//         initialChildSize: 0.6,
//         maxChildSize: 1.0,
//         minChildSize: 0.6,
//         builder: (context, scrollController) {
//           return Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             clipBehavior: Clip.hardEdge,
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                   topLeft: const Radius.circular(20),
//                   topRight: const Radius.circular(20)),
//             ),
//             child: SingleChildScrollView(
//               controller: scrollController,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 10, bottom: 25),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           height: 5,
//                           width: 35,
//                           color: Colors.black12,
//                         ),
//                       ],
//                     ),
//                   ),
//                   Text(
//                     "INFO",
//                     style: TextStyle(
//                       color: Color.fromRGBO(47, 114, 100, 1),
//                       fontWeight: FontWeight.w400,
//                       fontSize: 18,
//                     ),
//                   ),
//                   SizedBox(height: 10,),
//                   Text(
//                     widget.product["model"] ?? "",
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "RS: ${widget.product["price"] ?? ""}  | Per Day",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "Fuel Type: ${widget.product["fuelType"] ?? ""}",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.normal,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     "Seats: ${widget.product["seats"] ?? ""}",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.normal,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     "Transmission: ${widget.product["transmission"] ?? ""}",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.normal,
//                     ),
//                   ),
//
//                   SizedBox(height: 20,),
//
//                   Text(
//                     "Discription",
//                     style: TextStyle(
//                       color: Color.fromRGBO(47, 114, 100, 1),
//                       fontWeight: FontWeight.w400,
//                       fontSize: 18,
//                     ),
//                   ),
//
//                   SizedBox(height: 10,),
//
//                   Text(
//                     "${widget.product["discription"] ?? ""}",
//                     style: TextStyle(
//                       color: Colors.blueGrey,
//                       fontWeight: FontWeight.w400,
//                       fontSize: 15,
//                     ),
//                   ),
//
//                  Padding(
//                    padding: const EdgeInsets.only(top: 20),
//                    child: Container(
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: [
//                          GestureDetector(
//                            onTap: () {
//                              Navigator.push(
//                                  context, MaterialPageRoute(builder: (context) =>  ProductList()));
//                            },
//
//                            child: Container(
//                              color: Color.fromRGBO(47, 114, 100, 1),
//                              child: Padding(
//                                padding: const EdgeInsets.fromLTRB(75, 15, 63, 10),
//                                child: Text("Back",
//                                style: TextStyle(
//                                  color: Colors.white,
//                                ),),
//                              ),
//                            ),
//                          ),
//
//
//                    GestureDetector(
//                      onTap: () {
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(builder: (context) => home(product: widget.product)),
//                        );
//                      },
//                      child: Container(
//                        color: Color.fromRGBO(47, 114, 100, 1),
//                        child: Padding(
//                          padding: const EdgeInsets.fromLTRB(50, 15, 63, 15),
//                          child: Text(
//                            "Next",
//                            style: TextStyle(
//                              color: Colors.white,
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//
//
//                        ],
//                      ),
//                    ),
//                  )
//
//                 ],
//               ),
//             ),
//           );
//         });
//   }
//
//   steps(BuildContext context, int index) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 20),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           CircleAvatar(
//             backgroundColor: Colors.green,
//             radius: 12,
//             child: Text("${index + 1}"),
//           ),
//           Column(
//             children: [
//               SizedBox(
//                 width: 270,
//                 child: Text(
//                   "Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your",
//                   maxLines: 3,
//                   style: Theme.of(context)
//                       .textTheme
//                       .bodyText2!
//                       .copyWith(color: Colors.green),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Image.asset(
//                 "assets/imges/Rectangle 219.png",
//                 height: 155,
//                 width: 270,
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
// =======
// import 'dart:ui';
//
// import 'package:cr_app/home.dart';
// import 'package:cr_app/myaccount.dart';
// import 'package:cr_app/vehicles.dart';
// import 'package:flutter/material.dart';
//
// class view extends StatefulWidget {
//   final Map<dynamic, dynamic> product;
//
//   const view({Key? key, required this.product}) : super(key: key);
//
//   @override
//   _ViewState createState() => _ViewState();
// }
//
// class _ViewState extends State<view> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(47, 114, 100, 1),
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Color.fromRGBO(47, 114, 100, 1),
//         elevation: 0.0,
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Color.fromRGBO(47, 114, 100, 1),
//               ),
//               child: Text(
//                 'Menu',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text('My Account'),
//               onTap: () {
//                 // Handle navigation to the home screen
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (context) =>  MyAccount()));
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text('Settings'),
//               onTap: () {
//                 // Handle navigation to the settings screen
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Stack(
//         children: [
//           SizedBox(
//             width: double.infinity,
//             child: Image.asset('assets/cr4.jpeg'),
//             height: 390,
//           ),
//           // Image.network(
//           //   widget.product["model"] ?? "", // Assuming "model" contains a valid image URL
//           //   width: 200, // Adjust the width as per your requirement
//           //   height: 200, // Adjust the height as per your requirement
//           // )
//           scroll(),
//         ],
//       ),
//     );
//   }
//
//   scroll() {
//     return DraggableScrollableSheet(
//         initialChildSize: 0.6,
//         maxChildSize: 1.0,
//         minChildSize: 0.6,
//         builder: (context, scrollController) {
//           return Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             clipBehavior: Clip.hardEdge,
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                   topLeft: const Radius.circular(20),
//                   topRight: const Radius.circular(20)),
//             ),
//             child: SingleChildScrollView(
//               controller: scrollController,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 10, bottom: 25),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           height: 5,
//                           width: 35,
//                           color: Colors.black12,
//                         ),
//                       ],
//                     ),
//                   ),
//                   Text(
//                     "INFO",
//                     style: TextStyle(
//                       color: Color.fromRGBO(47, 114, 100, 1),
//                       fontWeight: FontWeight.w400,
//                       fontSize: 18,
//                     ),
//                   ),
//                   SizedBox(height: 10,),
//                   Text(
//                     widget.product["model"] ?? "",
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "RS: ${widget.product["price"] ?? ""}  | Per Day",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "Fuel Type: ${widget.product["fuelType"] ?? ""}",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.normal,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     "Seats: ${widget.product["seats"] ?? ""}",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.normal,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     "Transmission: ${widget.product["transmission"] ?? ""}",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.normal,
//                     ),
//                   ),
//
//                   SizedBox(height: 20,),
//
//                   Text(
//                     "Discription",
//                     style: TextStyle(
//                       color: Color.fromRGBO(47, 114, 100, 1),
//                       fontWeight: FontWeight.w400,
//                       fontSize: 18,
//                     ),
//                   ),
//
//                   SizedBox(height: 10,),
//
//                   Text(
//                     "${widget.product["discription"] ?? ""}",
//                     style: TextStyle(
//                       color: Colors.blueGrey,
//                       fontWeight: FontWeight.w400,
//                       fontSize: 15,
//                     ),
//                   ),
//
//                  Padding(
//                    padding: const EdgeInsets.only(top: 20),
//                    child: Container(
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: [
//                          GestureDetector(
//                            onTap: () {
//                              Navigator.push(
//                                  context, MaterialPageRoute(builder: (context) =>  ProductList()));
//                            },
//
//                            child: Container(
//                              color: Color.fromRGBO(47, 114, 100, 1),
//                              child: Padding(
//                                padding: const EdgeInsets.fromLTRB(75, 15, 63, 10),
//                                child: Text("Back",
//                                style: TextStyle(
//                                  color: Colors.white,
//                                ),),
//                              ),
//                            ),
//                          ),
//
//
//                    GestureDetector(
//                      onTap: () {
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(builder: (context) => home(product: widget.product)),
//                        );
//                      },
//                      child: Container(
//                        color: Color.fromRGBO(47, 114, 100, 1),
//                        child: Padding(
//                          padding: const EdgeInsets.fromLTRB(50, 15, 63, 15),
//                          child: Text(
//                            "Next",
//                            style: TextStyle(
//                              color: Colors.white,
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//
//
//                        ],
//                      ),
//                    ),
//                  )
//
//                 ],
//               ),
//             ),
//           );
//         });
//   }
//
//   steps(BuildContext context, int index) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 20),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           CircleAvatar(
//             backgroundColor: Colors.green,
//             radius: 12,
//             child: Text("${index + 1}"),
//           ),
//           Column(
//             children: [
//               SizedBox(
//                 width: 270,
//                 child: Text(
//                   "Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your",
//                   maxLines: 3,
//                   style: Theme.of(context)
//                       .textTheme
//                       .bodyText2!
//                       .copyWith(color: Colors.green),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Image.asset(
//                 "assets/imges/Rectangle 219.png",
//                 height: 155,
//                 width: 270,
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
// >>>>>>> parent of d50424b (car image fetch from db)
=======
=======
>>>>>>> parent of 1955279 (n c)
import 'dart:ui';

import 'package:cr_app/home.dart';
import 'package:cr_app/myaccount.dart';
import 'package:cr_app/vehicles.dart';
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
      backgroundColor: Color.fromRGBO(47, 114, 100, 1),
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
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
<<<<<<< HEAD
            child: Image.asset('assets/cr4.jpeg'),
            height: 390,
          ),
          // Image.network(
          //   widget.product["model"] ?? "", // Assuming "model" contains a valid image URL
          //   width: 200, // Adjust the width as per your requirement
          //   height: 200, // Adjust the height as per your requirement
          // )
=======
            child:  Image.network(
              widget.product["image"] ?? "", // Assuming "model" contains a valid image URL
              width: 200, // Adjust the width as per your requirement
              height: 200, // Adjust the height as per your requirement
            ),
            height: 390,
          ),

>>>>>>> parent of 1955279 (n c)
          scroll(),
        ],
      ),
    );
  }

  scroll() {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 1.0,
        minChildSize: 0.6,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 5,
                          width: 35,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "INFO",
                    style: TextStyle(
                      color: Color.fromRGBO(47, 114, 100, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10,),
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

                  SizedBox(height: 20,),

                  Text(
                    "Discription",
                    style: TextStyle(
                      color: Color.fromRGBO(47, 114, 100, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),

                  SizedBox(height: 10,),

                  Text(
                    "${widget.product["discription"] ?? ""}",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),

                 Padding(
                   padding: const EdgeInsets.only(top: 20),
                   child: Container(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         GestureDetector(
                           onTap: () {
                             Navigator.push(
                                 context, MaterialPageRoute(builder: (context) =>  ProductList()));
                           },

                           child: Container(
                             color: Color.fromRGBO(47, 114, 100, 1),
                             child: Padding(
                               padding: const EdgeInsets.fromLTRB(75, 15, 63, 10),
                               child: Text("Back",
                               style: TextStyle(
                                 color: Colors.white,
                               ),),
                             ),
                           ),
                         ),


                   GestureDetector(
                     onTap: () {
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => home(product: widget.product)),
                       );
                     },
                     child: Container(
                       color: Color.fromRGBO(47, 114, 100, 1),
                       child: Padding(
                         padding: const EdgeInsets.fromLTRB(50, 15, 63, 15),
                         child: Text(
                           "Next",
                           style: TextStyle(
                             color: Colors.white,
                           ),
                         ),
                       ),
                     ),
                   ),


                       ],
                     ),
                   ),
                 )

                ],
              ),
            ),
          );
        });
  }

  steps(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundColor: Colors.green,
            radius: 12,
            child: Text("${index + 1}"),
          ),
          Column(
            children: [
              SizedBox(
                width: 270,
                child: Text(
                  "Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your",
                  maxLines: 3,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Colors.green),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                "assets/imges/Rectangle 219.png",
                height: 155,
                width: 270,
              )
            ],
          )
        ],
      ),
    );
  }
}
<<<<<<< HEAD
>>>>>>> parent of d50424b (car image fetch from db)
=======
>>>>>>> parent of 1955279 (n c)
