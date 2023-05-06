import 'package:cr_app/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  late User _user;

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser!;
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(47, 114, 100, 1),
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {
              _signOut();
            },
            icon: Icon(Icons.logout),
          ),
        ],
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
                  color: Colors.black,
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
      body: Column(
        children: [
          SizedBox(height: 130),
          Container(
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Welcome, ${_user.displayName ?? 'User'}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  CircleAvatar(
                    backgroundImage: NetworkImage(_user.photoURL ?? ''),
                    radius: 50,
                  ),
                  SizedBox(height: 10),
                  Text(
                    _user.email ?? '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),


          // Padding(
          //   padding: const EdgeInsets.only(top: 20),
          //   child: Center(
          //     child: Card(
          //       child: SizedBox(
          //         width: 320,
          //         height: 300,
          //         child: Center(
          //           child: Text('Elevated Card'),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
