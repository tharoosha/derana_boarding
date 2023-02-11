import 'package:derana_boarding/shared/constants.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../services/auth.dart';
import '../../shared/loarding.dart';
import '../../utils/app_styles.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  const Register({required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  bool loading = false;

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Color(0xffeeedf2),
            // appBar: AppBar(
            //   backgroundColor: Colors.brown[400],
            //   elevation: 0.0,
            //   title: Text('Register in to brew crew'),
            //   actions: <Widget>[
            //     ElevatedButton(
            //       child: Text("Sign in"),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 50),
                      Text(
                        "🏠 Derana Boarding House",
                        style: Styles.headlineStyle3.copyWith(
                            fontSize: 18.0, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "Hello!  Register to get \nStarted",
                        style: Styles.headlineStyle2.copyWith(fontSize: 30),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                          decoration: textInputDecoration,
                          validator: (val) =>
                              val!.isEmpty ? 'Enter an email' : null,
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
                      SizedBox(height: 20),
                      ElevatedButton(
                        child: const Text(
                          "Sign up",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          // if (_formKey != null &&
                          //     _formKey.currentState != null &&
                          //     _formKey.currentState!.validate()) {
                          //   if (_auth != null ){
                          //     dynamic result =
                          //       await _auth.registerWithEmailAndPassword(email, password);
                          //       if (result == null) {
                          //           setState(() {
                          //             error = "Please supply a valid email";
                          //           });
                          //       }
                          //   }
                          //   else {
                          //     setState(() {
                          //       error = "Auth object is null";
                          //     });
                          //   }
                          // } else {
                          //   setState(() {
                          //     error = "Form validation failed";
                          //   });
                          // }
                          
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                loading = false;
                                error = 'Please supply a valid email';
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
                          Text(
                            "Already have an account? ",
                            style: TextStyle(
                              color: Color(0xff1e232c),
                              fontSize: 15,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  loading = true;
                                });
                                widget.toggleView();
                              },
                              child: Text("Login Now")),
                        ],
                      ),
                    ],
                  )),
            ),
          );
  }
}
