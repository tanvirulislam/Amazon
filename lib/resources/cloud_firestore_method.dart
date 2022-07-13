import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CloudFirestoreClass {
  Future uploadUserData({
    required String userName,
    required String userAddress,
  }) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
          'Name': userName,
          'Address': userAddress,
        });
  }
}
