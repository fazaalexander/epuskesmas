// import 'dart:ffi';
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';

void kirimResepObat(String nama, List<String> prescriptionList) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("resepObat");

  DatabaseReference newRef = ref.push();

  await newRef.set({
    "name": nama,
    "daftarResepObat": prescriptionList,
    "created_at": DateTime.now().millisecondsSinceEpoch
  });
}

Future<List<Map<String, dynamic>>> getResepDokter() async {
  Completer<List<Map<String, dynamic>>> completer = Completer();
  DatabaseReference ref = FirebaseDatabase.instance.ref("resepObat");

  List<Map<String, dynamic>> listResepObat = [];

  // ro = resep obat
  ref.onValue.listen((DatabaseEvent event) {
    DataSnapshot roSnapshot = event.snapshot;

    if (roSnapshot.value != null) {
      final roMap = roSnapshot.value as Map<dynamic, dynamic>;

      for (var entry in roMap.entries) {
        Map<String, dynamic> roData =
            Map<String, dynamic>.from(entry.value as Map<dynamic, dynamic>);
        String namaPasien = roData['name'];
        List<Object?> resep = roData['daftarResepObat'];
        Map<String, dynamic> resepObat = {
          'namaPasien': namaPasien,
          'resepObat': resep,
        };
        listResepObat.add(resepObat);
        print(listResepObat);
      }
      if (!completer.isCompleted) {
        completer.complete(listResepObat);
      }
    }
  });
  return completer.future;
}
