import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authentication_service.dart';

class PasswordResetPage extends StatefulWidget {

  @override
  PasswordResetPageState createState() => new PasswordResetPageState();
}

class PasswordResetPageState extends State<PasswordResetPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context) {
    final ScrollController _ScrollController = ScrollController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Reset Password"),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        controller: _ScrollController,
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
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.teal, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  context.read<AuthenticationService>().resetPassword(
                    email: emailController.text.trim(),
                  );
                },
                child: Text(
                  'Send Email',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
          ],
        ),
      ),
    );
  }
}