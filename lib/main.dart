import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:miafina/screens/login.dart';
import 'package:miafina/screens/signup.dart';
import 'package:miafina/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  User? user = FirebaseAuth.instance.currentUser;
  runApp(
    MaterialApp(
      title: "Miafina",
      debugShowCheckedModeBanner: false,
      home: (user == null ? MyApp() : HomePage()),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orangeAccent,
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "Share your deepest confessions anonymously",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Image(
                  image: NetworkImage("https://www.dictionary.com/e/wp-content/uploads/2018/10/shushing-face-emoji-300x300.png"),
                  width: 130,
                  height: 130,
                ),
                SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    child: Text("Get Started")
                ),
                ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text("Already have an account? Login")
                ),
              ],
            ),
          ),
        ),
      );
  }
}

