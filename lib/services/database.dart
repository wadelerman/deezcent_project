import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');

  Future updateUserData(String email, String password) async {
    return await userCollection.doc(uid).update({
      'first_name': email,
      'last_name': password,
    });
  }
}
