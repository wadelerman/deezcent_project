import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');

  Future updateUserData(
      String first_name, String last_name, Char jenis_kelamin) async {
    return await userCollection.doc(uid).update({
      'first_name': first_name,
      'last_name': last_name,
      'jenis_kelamin': jenis_kelamin,
    });
  }
}
