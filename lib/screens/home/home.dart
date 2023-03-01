import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:derana_boarding/screens/home/Student_list.dart';
// import 'package:derana_boarding/models/User.dart';
import 'package:derana_boarding/services/auth.dart';
import 'package:derana_boarding/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  // String uid = FirebaseFirestore.instance.collection('student').doc(uid) as String;
  late String uid;

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    print(uid);

    // return StreamProvider<QuerySnapshot?>.value(
    //     value: DatabaseService(uid: uid).student,
    //     initialData: null,
    return Scaffold(
      // child: SingleChildScrollView(
      // child: Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('🏠 Derana Boarding House $uid'),
        backgroundColor: Colors.black,
        elevation: 1.0,
        actions: <Widget>[
          TextButton.icon(
            icon: const Icon(Icons.person),
            label: const Text(
              'logout',
            ),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          SizedBox(
            height: 40,
          ),
          Text("Welcome to Derana boarding house"),
          StudentList()
        ],
      ),
    );
    // ),
    // );
  }
}
