import 'dart:ffi';
import 'dart:typed_data';

import 'package:derana_boarding/shared/constants.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';

import '../../services/auth.dart';
import '../../shared/loarding.dart';
import '../../utils/app_styles.dart';
import '../../utils/utils.dart';

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
  Uint8List? _image;

  String email = '';
  String password = '';
  String userName = '';
  String fullName = '';
  String phoneNumber = '';

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Color(0xffeeedf2),
            // appBar: AppBar(
            //   backgroundColor: Color(0xffeeedf2),
            //   elevation: 0.0,
            //   title: Text(
            //           "🏠 Derana Boarding House",
            //           style: Styles.headlineStyle3.copyWith(
            //               fontSize: 18.0, fontWeight: FontWeight.w300, ),
            //           textAlign: TextAlign.center,
            //         ),
              // actions: <Widget>[
              //   // ElevatedButton(
              //   //   child: Text("Sign in"),
              //   //   // style: ElevatedButton.styleFrom(
              //   //   //   // primary: Colors.white,
              //   //   // ),
              //   //   onPressed: () {
              //   //     widget.toggleView();
              //   //   },
              //   // )
              //   Text(
              //         "Hello!  Register to get \nStarted",
              //         style: Styles.headlineStyle2.copyWith(fontSize: 30),
              //       ),
              // ],
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
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 50),
                    Text(
                      "🏠 Derana Boarding House                              ",
                      style: Styles.headlineStyle3.copyWith(
                          fontSize: 18.0, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      "Hello!  Register to get \nStarted",
                      style: Styles.headlineStyle2.copyWith(fontSize: 30),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        _image != null
                            ? CircleAvatar(
                                radius: 64,
                                backgroundImage: MemoryImage(_image!),
                                backgroundColor: Colors.red,
                              )
                            : const CircleAvatar(
                                radius: 64,
                                backgroundImage: NetworkImage(
                                    'https://i.stack.imgur.com/l60Hf.png'),
                                backgroundColor: Colors.red,
                              ),
                        Positioned(
                          bottom: -10,
                          left: 80,
                          child: IconButton(
                            onPressed: selectImage,
                            icon: const Icon(Icons.add_a_photo),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 24,
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
                    TextFormField(
                        decoration: textInputDecoration.copyWith(
                            prefixIcon: Icon(
                              FluentSystemIcons.ic_fluent_person_regular,
                              color: Colors.black,
                            ),
                            hintText: "User Name"),
                        validator: (val) =>
                            val!.isEmpty ? 'Enter user name' : null,
                        onChanged: (val) {
                          setState(() => userName = val);
                        }),
                    SizedBox(height: 20),
                    TextFormField(
                        decoration: textInputDecoration.copyWith(
                            prefixIcon: Icon(
                              FluentSystemIcons.ic_fluent_person_filled,
                              color: Colors.black,
                            ),
                            hintText: "Full Name"),
                        validator: (val) =>
                            val!.isEmpty ? 'Enter full name' : null,
                        onChanged: (val) {
                          setState(() => fullName = val);
                        }),
                    SizedBox(height: 20),
                    TextFormField(
                        decoration: textInputDecoration.copyWith(
                            prefixIcon: Icon(
                              FluentSystemIcons.ic_fluent_phone_regular,
                              color: Colors.black,
                            ),
                            hintText: "Phone Number"),
                        validator: (val) =>
                            val!.isEmpty ? 'Enter phone number' : null,
                        onChanged: (val) {
                          setState(() => phoneNumber = val);
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
                          dynamic result =
                              await _auth.registerWithEmailAndPassword(
                                  email: email,
                                  password: password,
                                  userName: userName,
                                  fullName: fullName,
                                  phoneNumber: phoneNumber);
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
            ),
          );
  }
}
