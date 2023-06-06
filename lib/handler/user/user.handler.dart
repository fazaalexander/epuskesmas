// import 'dart:ffi';
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';

Future<List<Map<String, dynamic>>> getAllDokter() async {
  Completer<List<Map<String, dynamic>>> completer = Completer();
  DatabaseReference dokterRef = FirebaseDatabase.instance.ref("dokter");

  List<Map<String, dynamic>> listDokter = [];

  dokterRef.onValue.listen((DatabaseEvent event) {
    DataSnapshot dokterSnapshot = event.snapshot;

    if (dokterSnapshot.value != null) {
      final dokterMap = dokterSnapshot.value as Map<dynamic, dynamic>;

      for (var entry in dokterMap.entries) {
        String dokterID = entry.key;
        Map<String, dynamic> dokterData =
            Map<String, dynamic>.from(entry.value as Map<dynamic, dynamic>);

        DatabaseReference namaDokterRef =
            FirebaseDatabase.instance.ref().child("users/$dokterID/fullName");

        namaDokterRef.onValue.listen((event) {
          String namaDokter = event.snapshot.value.toString();
          String spesialis = dokterData['spesialisasi'];
          // int harga = dokterData['harga'];

          Map<String, dynamic> dokterMap = {
            'id': dokterID.toString(),
            'nama': namaDokter,
            'spesialis': spesialis,
            // 'harga': harga,
          };
          listDokter.add(dokterMap);
          print(listDokter);
        });
      }
      if (!completer.isCompleted) {
        completer.complete(listDokter);
      }
    }
  });
  return completer.future;
}
