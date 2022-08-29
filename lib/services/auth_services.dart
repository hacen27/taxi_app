import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:taxi_app/services/database_service.dart';

import '../models/user_model.dart' as user;

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseService _db = DatabaseService();

  Future<bool> login({String? email, String? password}) async {
    if (kDebugMode) {
      print(email);
      print(password);
    }

    try {
      await _auth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }

      return false;
    }
  }

  Future<bool> createAccount({
    String? username,
    String? email,
    String? password,
  }) async {
    if (kDebugMode) {
      print(username);
      print(email);
      print(password);
    }

    try {
      UserCredential userData = await _auth.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      await _db.storeUser(
        user.User(
          id: userData.user!.uid,
          username: username,
          email: email,
        ),
      );

      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }

      return false;
    }
  }
}
