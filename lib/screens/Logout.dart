import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogOut extends StatefulWidget {
  const LogOut({super.key});

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Logout'),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Are you sure you want to logout?',
              style: TextStyle(color: Colors.brown , fontSize: 15 ),
            ),
            SizedBox(height: 20),
             CupertinoButton.filled(
              child: Text('Logout'),
              onPressed: () {
                Navigator.pop(context); 
              },
            ),
          ],
        ),
      ),
    );
  }
}