import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

// Fungsi untuk registrasi akun
void registerAccount(String fullName, String nik, String email, String password,
    String role, Function(String) onRegisterResult) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await FirebaseAuth.instance.currentUser!.updateDisplayName(fullName);

    if (credential.user != null) {
      DatabaseReference ref = FirebaseDatabase.instance.ref().child("users");

      String uid = credential.user!.uid;
      await ref.child(uid).set({
        'uid': uid,
        'fullName': fullName,
        'nik': nik,
        'email': email,
        'role': role,
        'created_at': DateTime.now().microsecondsSinceEpoch,
      });
    }

    onRegisterResult("success");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      onRegisterResult("weak-password");
    } else if (e.code == 'email-already-in-use') {
      onRegisterResult("email-already-in-use");
    }
  } catch (e) {
    onRegisterResult("error");
  }
}
