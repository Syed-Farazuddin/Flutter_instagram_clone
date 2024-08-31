import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:instagram_clone/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;
  @override
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      // Register User
      UserCredential cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      debugPrint("Caught an Error : ${e.toString()}");
    }
  }

  @override
  Future<void> signUp({
    required String email,
    required String password,
    required String username,
    required Uint8List photo,
    required String bio,
  }) async {
    try {
      // Register User
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Store user data in the database
      await _store.collection("Users").doc(cred.user!.uid).set({
        "username": username,
        // "photo": photo,
        "followers": [],
        "uid": cred.user!.uid,
        "bio": bio,
      });
    } catch (e) {
      debugPrint("Caught an Error : ${e.toString()}");
    }
  }
}
