import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:miafina/main.dart';
import 'add_confession.dart';
import 'explore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
            "Miafina Home",
          style: TextStyle(
            color: Colors.black
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.black,
          onPressed: (){

          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            color: Colors.black,
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              });
            },
          ),
        ]
      ),
      body: ExplorePage(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.black87,
        elevation: 0,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          // Respond to item press.
        },
        items: [
          BottomNavigationBarItem(
            label: "Explore",
            icon: Icon(Icons.explore),
          ),
          BottomNavigationBarItem(
            label: 'Favorites',
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            label: 'Messages',
            icon: Icon(Icons.message),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        foregroundColor: Colors.black,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddConfession()),
          );
        },
        child: Icon(Icons.post_add),
      ),
    );
  }
}
