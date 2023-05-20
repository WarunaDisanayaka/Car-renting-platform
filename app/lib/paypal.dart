import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cr_app/myaccount.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';

class Paypal extends StatelessWidget {
  const Paypal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Paypal',
      theme: ThemeData(),
      home: const paypal(title: 'PayPal'),
    );
  }
}

class paypal extends StatefulWidget {
  const paypal({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<paypal> createState() => _paypalState();
}

class _paypalState extends State<paypal> {
  final databaseReference = FirebaseFirestore.instance;

  List<Map<dynamic, dynamic>> productList = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final QuerySnapshot snapshot =
    await databaseReference.collection("products").get();
    setState(() {
      productList = snapshot.docs
          .map((DocumentSnapshot document) => document.data() as Map<dynamic, dynamic>)
          .toList();
    });
  }

  void redirectToMyAccount() {
    // Perform the redirection to myaccount() here
    // Replace this code with your actual redirection logic
    MyAccount();
    print('Redirecting to myaccount()');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(47, 114, 100, 1),
        title: Text(widget.title),
      ),
      body: productList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Icon(
            Icons.paypal,
            size: 120,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "TOTAL| RS: ${productList[0]["price"] ?? ""}",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => UsePaypal(
                      sandboxMode: true,
                      clientId:
                      "AYVv_a07kA5gci4uV4KVMWthAu-is9z2tfWVtdomEhUZOj62SUzMeqlwC-m97CaBZvc8Se6ifliKQtBS",
                      secretKey:
                      "ENKPY5NucYYlfDLKJhMiGnCBlKbUuhFz4QCn7EMvEGeO5DoryTFsSHct708N3qz5ysHlJzd5Qox5jUHd",
                      returnURL: "https://samplesite.com/return",
                      cancelURL: "https://samplesite.com/cancel",
                      transactions: const [
                        {
                          "amount": {
                            "total": '10.12',
                            "currency": "USD",
                            "details": {
                              "subtotal": '10.12',
                              "shipping": '0',
                              "shipping_discount": 0
                            }
                          },
                          "description":
                          "The payment transaction description.",
                          "item_list": {
                            "items": [
                              {
                                "name": "A demo product",
                                "quantity": 1,
                                "price": '10.12',
                                "currency": "USD"
                              }
                            ],
                            "shipping_address": {
                              "recipient_name": "Jane Foster",
                              "line1": "Travis County",
                              "line2": "",
                              "city": "Austin",
                              "country_code": "US",
                              "postal_code": "73301",
                              "phone": "+00000000",
                              "state": "Texas"
                            },
                          }
                        }
                      ],
                      note: "Contact us for any questions on your order.",
                      onSuccess: (Map params) async {
                        print("onSuccess: $params");
                        redirectToMyAccount(); // Redirect after successful payment
                      },
                      onError: (error) {
                        print("onError: $error");
                      },
                      onCancel: (params) {
                        print('cancelled: $params');
                      },
                    ),
                  ),
                );
              },
              child: Container(
                color: Color.fromRGBO(47, 114, 100, 1),
                height: 50,
                width: 120,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      "Make Payment",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
