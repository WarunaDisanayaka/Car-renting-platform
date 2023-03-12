import 'package:cr_app/vehicles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

String txt = "2023/03/03";
TextEditingController _controller = TextEditingController(text: txt);

List<String> imageList = [

  'assets/cr1.jpg',
  'assets/cr2.jpg',
  'assets/cr3.jpg',
];







class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Select'),
      ),
      backgroundColor: Colors.orangeAccent,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //select stsrt date
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 8, left: 25, right: 5),
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
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(3)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _controller,
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
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40.0),
                                      topRight: Radius.circular(40.0),
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
                                          onDateTimeChanged: (date) {},
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        hintText: '2023/03/20',
                      ),
                    ),
                  ),
                ),
              ),

              //select END date
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 8, left: 25, right: 5),
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
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(3)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _controller,
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
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40.0),
                                      topRight: Radius.circular(40.0),
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
                                          onDateTimeChanged: (date) {},
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        hintText: '2023/03/20',
                      ),
                    ),
                  ),
                ),
              ),


              //location
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 8, left: 25, right: 5),
                child: Text(
                  "Select location ",
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
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(3)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _controller,
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
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40.0),
                                      topRight: Radius.circular(40.0),
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
                                          onDateTimeChanged: (date) {},
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        hintText: '2023/03/20',
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 8, left: 100, right: 10),
                child: OutlinedButton(
                  child: Text(
                    "Filter",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      width: 5.0, // set the border weight to 2.0
                      color: Colors.green,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fixedSize: Size(150, 50),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => home()));
                  },
                ),
              ),



              //CarouselSlider

              CarouselSlider(
                items: imageList.map((imagePath) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      width: 400.0,
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 16/9,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                ),
              ),








              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 8, left: 25, right: 5),
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
                padding: EdgeInsets.only(top: 20, bottom: 8, left: 25, right: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
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
                  onTap: (){
                    print("clicked");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => vehicles()));
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
