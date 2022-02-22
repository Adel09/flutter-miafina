import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:miafina/data/postmodel.dart';
import 'package:miafina/data/post_dao.dart';
import 'package:uuid/uuid.dart';


class AddConfession extends StatefulWidget {
  const AddConfession({Key? key}) : super(key: key);

  @override
  _AddConfessionState createState() => _AddConfessionState();
}

class _AddConfessionState extends State<AddConfession> {

  DatabaseReference ref = FirebaseDatabase.instance.reference().child("posts").push();

  final postCon = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        title: Text(
            "Post a Confession",
          style: TextStyle(
            color: Colors.black
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 30,),

            TextField(
              controller: postCon,
              decoration: InputDecoration(
                labelText: "Type your confession",
                border: OutlineInputBorder()
              ),
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              minLines: 10,
              maxLines: 10,
            ),
            SizedBox(height: 30,),
            Align(
              alignment: Alignment.center,
              child: Text(
                "All posts are strictly anonymous",
                style: TextStyle(
                  fontSize: 17
                ),
              ),
            ),
            SizedBox(height: 50,),

            ElevatedButton(
                onPressed: () async {
                  var uuid = Uuid();
                  await ref.set({
                    "id": uuid.v1(),
                    "confession": postCon.text,
                    "owner": user!.uid,
                    "image": 'https://upload.wikimedia.org/wikipedia/commons/b/b1/Beautiful-landscape.png'
                  });
                  print("It got here");
                  setState(() {

                  });
                  Navigator.pop(context);
                },
                child: Text("Post",
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent
                ),
            )

          ],
        ),
      ),


    );
  }
}
