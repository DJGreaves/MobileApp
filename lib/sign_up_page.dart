import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authentication_service.dart';

class SignUpPage extends StatefulWidget {

  @override
  SignUpPageState createState() => new SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Sign Up"),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/images/teal_logo.png')),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:  BorderRadius.circular(5.0),
                        borderSide:  BorderSide(color: Colors.teal )),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.teal),
                    hintText: 'Enter your email address'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:  BorderRadius.circular(5.0),
                        borderSide:  BorderSide(color: Colors.teal )),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.teal),
                    hintText: 'Enter your secure password'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: passwordConfirmationController,
                obscureText: true,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:  BorderRadius.circular(5.0),
                        borderSide:  BorderSide(color: Colors.teal )),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.teal),
                    hintText: 'Re-enter your secure password'),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.teal, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  context.read<AuthenticationService>().signIn(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
            Text(
                'New User? Create Account',
                style: TextStyle(color: Colors.teal)),
          ],
        ),
      ),
    );
  }
}