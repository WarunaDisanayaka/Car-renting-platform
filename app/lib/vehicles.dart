import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: Padding(
        padding: EdgeInsets.only(top: 15, bottom: 2, left: 10, right: 10),
        child: Container(
          height: 220,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 15, bottom: 0, left: 10, right: 10),
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 15, bottom: 2, left: 10, right: 10),
                                child: Text("Toyota",
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    )),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 6, bottom: 2, left: 10, right: 10),
                                child: Text("Corolla 2018 G Grade",
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 6, bottom: 2, left: 10, right: 10),
                                child: Text("RS: 2500  | Per Day",
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
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

              //vehical info bar
              Padding(
                padding:
                    EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.add),
                          Text("test1"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.add),
                          Text("test1"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.add),
                          Text("test1"),
                        ],
                      ),
                      OutlinedButton(
                        child: Text(
                          "Book",
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
                          fixedSize: Size(100, 40),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
