import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailCon = TextEditingController();
  final passCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orangeAccent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.orangeAccent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                    "Welcome back!",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,

                    ),
                    textAlign: TextAlign.center
                ),
              ),

              SizedBox(height: 30,),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: emailCon,

                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    border: OutlineInputBorder(),

                    prefix: Icon(Icons.email),

                  ),
                ),
              ),

              SizedBox(height: 12,),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: passCon,

                  decoration: InputDecoration(
                    labelText: 'Enter Password',
                    border: OutlineInputBorder(),
                    prefix: Icon(Icons.password),

                  ),
                  obscureText: true,
                ),
              ),

              SizedBox(height: 32,),

              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  child: Text("Log in"),
                  onPressed: () async {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailCon.text,
                        password: passCon.text
                    );
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    });


                  },
                ),
              )
            ],
          ),
        )

    );
  }
}
