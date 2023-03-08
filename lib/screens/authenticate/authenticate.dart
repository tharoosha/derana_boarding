import "package:derana_boarding/screens/authenticate/register.dart";
import "package:derana_boarding/screens/authenticate/sign_in.dart";
import "package:flutter/material.dart";

class Authenticate extends StatefulWidget {
  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //     // child: SignIn(),
    //     child: Register());
    if (showSignIn) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
