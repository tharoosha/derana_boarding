import 'package:derana_boarding/services/auth.dart';
import 'package:derana_boarding/utils/app_styles.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../shared/constants.dart';
import '../../shared/loarding.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
        backgroundColor: Color(0xffeeedf2),
        // appBar: AppBar(
        //   // backgroundColor: Colors.brown[400],
        //   // elevation: 0.0,
        //   // title: Text('Sign in to brew crew'),
        //   actions: <Widget>[
        //     ElevatedButton(
        //       child: Text("Register"),
        //       // style: ElevatedButton.styleFrom(
        //       //   // primary: Colors.white,
        //       // ),
        //       onPressed: () {
        //         widget.toggleView();
        //       },
        //     )
        //   ],
        // ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          // child: ElevatedButton(
          //     child: Text('Sign in anon'),
          //     onPressed: () async {
          //       dynamic result = await _auth.signInAnon();
          //       if (result == null) {
          //         print("error signing in");
          //       } else {
          //         print("signed in");
          //         print(result);
          //       }
          //     }),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 100),
                  Text(
                    "🏠 Derana Boarding House",
                    style: Styles.headlineStyle3
                        .copyWith(fontSize: 22.0, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "Login to Your Profile",
                    style: Styles.headlineStyle2.copyWith(fontSize: 38),
                  ),
                  const SizedBox(
                    height: 44.0,
                  ),
                  TextFormField(
                      decoration: textInputDecoration,
                      validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      }),
                  SizedBox(height: 20),
                  TextFormField(
                      decoration: textInputDecoration.copyWith(
                          prefixIcon: Icon(
                            FluentSystemIcons.ic_fluent_lock_regular,
                            color: Colors.black,
                          ),
                          hintText: "Password"),
                      validator: (val) => val!.length < 6
                          ? 'Enter a password 6+ chars long'
                          : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password = val);
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Don't Remember your Password?",
                    style: TextStyle(color: Colors.blue),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    child: const Text(
                      "Sign in",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      // print(email);
                      // print(password);
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _auth.signInWithEmailAndPassword(
                            email, password);
                        if (result == null) {
                          setState(() {
                            error = 'Could not sign in with those credentials';
                            loading = false;
                          });
                        }
                      }
                    },
                    // Color: Colors.pink[400],
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                  Row(
                    children: [
                      Text("Have not registered yet ?"),
                      TextButton(
                        onPressed: () {
                          widget.toggleView();
                        },
                        child: Text('Register Now'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
