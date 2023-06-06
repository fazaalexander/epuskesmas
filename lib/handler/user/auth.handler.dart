import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

// Fungsi untuk login
void login(
    String email, String password, Function(String) onLoginResult) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    if (credential.user != null) {
      String uid = credential.user!.uid;

      DatabaseReference ref =
          FirebaseDatabase.instance.ref().child("users/$uid/role");

      ref.onValue.listen((event) {
        if (event.snapshot.value == "Pasien") {
          onLoginResult("success-pasien");
        } else if (event.snapshot.value == "Dokter") {
          onLoginResult("success-dokter");
        } else if (event.snapshot.value == "Apoteker") {
          onLoginResult("success-apoteker");
        } else {
          onLoginResult("user-not-found");
        }
      });
    }

    onLoginResult("success");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      onLoginResult("user-not-found");
    } else if (e.code == 'wrong-password') {
      onLoginResult("wrong-password");
    }
  }
}

// Fungsi untuk logout
void logout() async {
  await FirebaseAuth.instance.signOut();
}
