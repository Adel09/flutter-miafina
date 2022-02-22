import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {

  Query _ref = FirebaseDatabase.instance.reference().child('posts');


  @override
  Widget build(BuildContext context) {
    return FirebaseAnimatedList(
        query: _ref,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
        Animation<double> animation, int index){
         // Map<String, dynamic> stuff =  snapshot.value as Map<String, dynamic>;

         Map stuff =  snapshot.value;
         return PostTile(stuff);
        }
    );
  }
}

Widget PostTile(Map post){
  return Container(
    height: 270,
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(post['image']),
        fit: BoxFit.cover,
      ),
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          Colors.black,
          Colors.black,
          Colors.black,
          Colors.black
        ]
      )

    ),
    child: Center(
      child: Text(
        post['confession'],
        style: TextStyle(
          fontSize: 25,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
        textAlign: TextAlign.center,
      ),
    )

  );

}

