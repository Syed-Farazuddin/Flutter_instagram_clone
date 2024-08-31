import 'dart:typed_data';

abstract class AuthRepository {
  Future<void> signUp({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List photo,
  });

  Future<void> signIn({
    required String email,
    required String password,
  });
}
