import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

String txt = "2023/03/03";
TextEditingController _controller = TextEditingController(text: txt);

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Select'),
      ),
      backgroundColor: Colors.yellow[800],
      body: Container(
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

            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 8, left: 150, right: 5),
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

            Text("test"),

            CarouselSlider(
              items: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.red,
                    child: Center(
                      child: Text("Item 1", style: TextStyle(color: Colors.white, fontSize: 24)),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.blue,
                    child: Center(
                      child: Text("Item 2", style: TextStyle(color: Colors.white, fontSize: 24)),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.green,
                    child: Center(
                      child: Text("Item 3", style: TextStyle(color: Colors.white, fontSize: 24)),
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(
                height: 200,
                aspectRatio: 16/9,
                viewportFraction: 0.9,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                  });
                },
                scrollDirection: Axis.horizontal,
              ),
            )

          ],
        ),
      ),
    );
  }
}
