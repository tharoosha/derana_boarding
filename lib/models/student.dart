import 'package:cloud_firestore/cloud_firestore.dart';

class Student {
  final String email;
  final String uid;
  final String username;

  Student({required this.uid, required this.username, required this.email});

  static Student fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Student(
        uid: snapshot['uid'],
        username: snapshot['username'],
        email: snapshot['email']);
  }

  Map<String, dynamic> toJson() =>
      {"username": username, "uid": uid, "email": email};
}

 