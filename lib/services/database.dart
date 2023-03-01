import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:derana_boarding/models/student.dart';
import 'package:derana_boarding/models/student.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference studentCollection =
      FirebaseFirestore.instance.collection("student");

  Future updateUserData(
      {required String email,
      required String userName,
      required String fullName,
      required String phoneNumber}) 
      async {
    return await studentCollection
        .doc(uid)
        .set({
          "name": userName, 
          "email": email, 
          "phone_number": phoneNumber, 
          "fullname": fullName});
  }

  //studnet list from snapshot
  // List<Student> _studnetListFromSnaphots(QuerySnapshot snapshot) {
  //   return snapshot.docs.map((document){
  //     return Student(
  //       name: document.data['name'] ?? ' ',
  //       phone_number: document.data('phone_number') ?? ' ',
  //       email: document.data('email') ?? ' '
  //     )
  //   }).toList();
  // }

  // get user stream
  // Stream<QuerySnapshot> get student {
  //   return studentCollection.snapshots();
  //   // return studentCollection.snapshots();
  // }
  Future<Student> getUserDetails() async {
    DocumentSnapshot documentSnapshot = await studentCollection.doc(uid).get();
    return Student.fromSnap(documentSnapshot);
  }
}
