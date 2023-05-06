import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _usernameController = TextEditingController();
final TextEditingController _telNoController = TextEditingController();
final TextEditingController _addressController = TextEditingController();
String errorMessage = '';

Future<void> registerWithEmailAndPassword(String email, String password ,String uname, String telNo, String address) async {
  try {
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
    String uid = _auth.currentUser!.uid; // get the user id
    // Create a new document for the user with the uid as the document id
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'username': uname,
      'telephone': telNo,
      'address': address,
    });
    // Navigate to the next screen after successful registration
  } catch (e) {
    print('Error: $e');
  }
}





class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        backgroundColor: Color.fromRGBO(47, 114, 100, 1),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(400)),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: SizedBox(),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Image(
                    image: AssetImage(
                      'assets/15.png',
                    ),
                    height: 100,
                  ),
                ),
                //email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!EmailValidator.validate(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                //email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Pssword',
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                //user name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'User Name',
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                //tel no
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _telNoController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Tel-No',
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                //address
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _addressController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Address',
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: OutlinedButton(
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        width: 2.0, // set the border weight to 2.0
                        color: Colors.green,
                      ),
                      fixedSize: Size(150, 50),
                    ),
                    onPressed: () async {
                      final String email = _emailController.text.trim();
                      final String password = _passwordController.text.trim();
                      final String uname = _usernameController.text.trim();
                      final String telNo = _telNoController.text.trim();
                      final String address = _addressController.text.trim();
                      await registerWithEmailAndPassword(email, password, uname, telNo, address);
                    },
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Alrady Member"),
                      Text(
                        " .Login nor",
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      )
                    ],
                  ),
                ),

                if (errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      errorMessage!,
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
