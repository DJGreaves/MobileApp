import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_app/authentication_service.dart';

class SignInPage extends StatefulWidget {
  @override
  SignInPageState createState() => new SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context) {
    final ScrollController _ScrollController = ScrollController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Sign In"),
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
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.teal)),
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
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.teal)),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.teal),
                    hintText: 'Enter your secure password'),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/reset_password_page');
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.teal, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.teal, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () async {
                  if (emailController.text.trim() == "") {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text("Error"),
                              content: Text("Please enter email address"),
                            ));
                  } else {
                    if (passwordController.text.trim() == "") {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text("Error"),
                                content: Text("Please enter password"),
                              ));
                    } else {
                      context
                          .read<AuthenticationService>()
                          .signIn(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          )
                          .then((value) => {
                                if (value == 'Signed in')
                                  {
                                    Navigator.of(context)
                                        .pushNamed('/home_page')
                                  }
                                else
                                  {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              title: Text("Error"),
                                              content: Text(value),
                                            ))
                                  }
                              });
                    }
                  }
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
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/sign_up_page');
              },
              child: Text('New User? Create Account',
                  style: TextStyle(color: Colors.teal)),
            ),
          ],
        ),
      ),
    );
  }
}
