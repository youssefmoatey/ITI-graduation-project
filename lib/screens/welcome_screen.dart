import 'dart:async';

import 'package:digits_store/screens/Signup.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 10), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SignUp()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          width: 120,
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'FLA',
                    style: TextStyle(fontSize: 30, fontFamily: 'Overpass'),
                  ),
                  Text(
                    '⚡',
                    style: TextStyle(color: Colors.red, fontSize: 40),
                  ),
                  Text(
                    'H',
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
              Column(
                children: [
                  Text('Your'),
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text('Smart'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Text('World'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}



// Center(
//           child: Card(
//             clipBehavior: Clip.antiAlias,
//         shape: RoundedRectangleBorder(
//           // side: const BorderSide(color: Colors.white70, width: 1),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         shadowColor: Colors.blue,
//         elevation: 20,
//         child: Image.asset('assets/images/splash-logo/flash_logo.jpg',
//             width: MediaQuery.sizeOf(context).width / 2),
//       ))