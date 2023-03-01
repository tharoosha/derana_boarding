import 'dart:async';
import 'dart:typed_data';

import 'package:derana_boarding/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // // create user obj based on firebase user
  // User? userFromFirebaseUser(User user) {
  //   return user;
  // }

  //auth change user stream
  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential credential = await _auth.signInAnonymously();
      User? user = credential.user;
      // print("Signed in with temporary account");

      // final User user = (await _auth.signInAnonymously()).user;
      // return (userCredential);
      // final User user = userCredential;
      return user?.uid;
    } catch (e) {
      // switch (e) {

      // case "operation-not-allowed":
      //   print("Anonymous auth hasn't been enabled for this project.");
      //   break;
      // default:
      //   print("Unknown error.");
      // }
      print(e.toString());
      return null;
    }
  }

  // sign in with email with password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register with email and password
  Future<String> registerWithEmailAndPassword(
      {required String email,
      required String password,
      required String userName,
      required String fullName,
      required String phoneNumber,
      required Uint8List file}) async {
    String res = "Some error occured";
    try {
      // ignore: unnecessary_null_comparison
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          userName.isNotEmpty ||
          fullName.isNotEmpty ||
          phoneNumber.isNotEmpty ||
          file != null) {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);

        // create a new document for the user with the uid
        await DatabaseService(uid: userCredential.user!.uid).updateUserData(
            userName: userName,
            email: email,
            phoneNumber: phoneNumber,
            fullName: fullName);

        res = "sucess";

      }

      // User? user = userCredential.user;

      // return (user);
    } catch (error) {
      res = error.toString();
      // print(error.toString());
      // return null;
    }
    return res;
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
