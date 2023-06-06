import "package:firebase_database/firebase_database.dart";

void jadwalMinumObat(String nama, List<String> prescriptionList) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("jadwalMinumObat");

  DatabaseReference newRef = ref.push();

  await newRef.set({"created_at": DateTime.now().millisecondsSinceEpoch});
}
