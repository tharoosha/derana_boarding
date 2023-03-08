import 'package:derana_boarding/screens/wrapper.dart';
import 'package:derana_boarding/services/auth.dart';
import 'package:derana_boarding/utils/app_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  /*
  use this method to initialize the futter widgets
  otherwise we get a null error because firebase app 
  initialize before flutter widget comes.
  */
  WidgetsFlutterBinding.ensureInitialized(); 
  /*
  initialize the firebase app 
  */
  await Firebase.initializeApp(); 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
