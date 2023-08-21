import 'package:flutter/material.dart';
import 'package:flutter_application_5/screens/AboutUs.dart';
import 'package:flutter_application_5/screens/DevNames.dart';
import 'package:flutter_application_5/screens/Logout.dart';
import 'package:flutter_application_5/screens/page1.dart';
import 'package:flutter_application_5/screens/page2.dart';
import 'package:flutter_application_5/screens/page3.dart';

class HomeScreen extends StatefulWidget {
  String email;
  HomeScreen({super.key, required this.email});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> pages = [
    Page1(), 
    Page2(),
    Page3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.blue, toolbarHeight: 30,
        title: Text(''),
        
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.pending),
              title: Text('About Us'),
              onTap: () {
                // Handle drawer item tap
                 Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  AboutUs() )) ;

              },
            ),
            ListTile(
              leading: Icon(Icons.people_sharp),
              title: Text('Developers names'),
              onTap: () {
                // Handle drawer item tap
                Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  DevelopersNames() )) ;
              },
            ),
            ListTile(
              leading: Icon(Icons.logout_rounded),
              title: Text('Log out'),
              onTap: () {
                // Handle drawer item tap
                Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  LogOut() )) ;
              },
        )
        ],
        ),
      ),
      body : pages[currentIndex] ,

      bottomNavigationBar: BottomNavigationBar(
        currentIndex : currentIndex ,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label:" Home" , backgroundColor: Colors.blueAccent ),
         BottomNavigationBarItem(icon: Icon(Icons.category), label:" Categories" , backgroundColor:  Colors.blueAccent ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label:" My Profile", backgroundColor: Colors.blueAccent  ),
           
          
      ],
      onTap: (value){
        currentIndex = value ;
        setState(() {});
        print(value);
      },

      ),
    );
  }
}