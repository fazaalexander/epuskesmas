import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

//Fungsi untuk menambah jadwal konsultasi
void tambahJadwalKonsultasi(
    String dokterID,
    String pasienID,
    String namaDokter,
    String namaPasien,
    String tanggal,
    String jamMulai,
    String jamSelesai) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("konsultasi");
  Map<String, dynamic> jadwal = {
    "tanggal": tanggal,
    "jamMulai": jamMulai,
    "jamSelesai": jamSelesai
  };

  Map<String, dynamic> konsultasi = {
    "namaPasien": namaPasien,
    "namaDokter": namaDokter,
    "pasienID": pasienID,
    "dokterID": dokterID,
    "jadwal": jadwal
  };

  await ref.set(konsultasi);
}

// Fungsi untuk menambah riwayat konsultasi
void tambahRiwayatKonsultasi(String namaPasien, String diagnosa) async {
  String? dokterID = FirebaseAuth.instance.currentUser?.uid;
  String? namaDokter = FirebaseAuth.instance.currentUser?.displayName;

  DatabaseReference ref = FirebaseDatabase.instance.ref("riwayatKonsultasi");

  DatabaseReference newRef = ref.push();

  await newRef.set({
    "namaPasien": namaPasien,
    "namaDokter": namaDokter,
    "diagnosa": diagnosa,
    "created_at": DateTime.now().millisecondsSinceEpoch,
    "dokterID": dokterID.toString()
  });
}

// Fungsi untuk melihat riwayat konsultasi sebagai pasien
Future<List<Map<String, dynamic>>> getRiwayatKonsultasiPasien() async {
  Completer<List<Map<String, dynamic>>> completer = Completer();
  DatabaseReference ref = FirebaseDatabase.instance.ref("riwayatKonsultasi");

  List<Map<String, dynamic>> listRiwayatKonsultasi = [];
  String? namaPasien = FirebaseAuth.instance.currentUser?.displayName;

  // rk = riwayat konsultasi
  ref.onValue.listen((DatabaseEvent event) {
    DataSnapshot rkSnapshot = event.snapshot;

    if (rkSnapshot.value != null) {
      final rkMap = rkSnapshot.value as Map<dynamic, dynamic>;

      for (var entry in rkMap.entries) {
        Map<String, dynamic> rkData =
            Map<String, dynamic>.from(entry.value as Map<dynamic, dynamic>);

        String namaPasienEntry = rkData['namaPasien'];
        if (namaPasienEntry == namaPasien.toString()) {
          // String namaDokter = rkData['namaDokter'];
          String diagnosa = rkData['diagnosa'];
          Map<String, dynamic> riwayatKonsultasi = {
            'namaPasien': namaPasienEntry,
            // 'namaDokter': namaDokter,
            'diagnosa': diagnosa,
          };
          listRiwayatKonsultasi.add(riwayatKonsultasi);
          print(listRiwayatKonsultasi);
        }
      }
      if (!completer.isCompleted) {
        completer.complete(listRiwayatKonsultasi);
      }
    }
  });
  return completer.future;
}

// Fungsi untuk melihat riwayat konsultasi sebagai dokter
Future<List<Map<String, dynamic>>> getRiwayatKonsultasiDokter() async {
  Completer<List<Map<String, dynamic>>> completer = Completer();
  DatabaseReference ref = FirebaseDatabase.instance.ref("riwayatKonsultasi");

  List<Map<String, dynamic>> listRiwayatKonsultasi = [];
  String? namaDokter = FirebaseAuth.instance.currentUser?.displayName;

  // rk = riwayat konsultasi
  ref.onValue.listen((DatabaseEvent event) {
    DataSnapshot rkSnapshot = event.snapshot;

    if (rkSnapshot.value != null) {
      final rkMap = rkSnapshot.value as Map<dynamic, dynamic>;

      for (var entry in rkMap.entries) {
        Map<String, dynamic> rkData =
            Map<String, dynamic>.from(entry.value as Map<dynamic, dynamic>);

        String namaDokterEntry = rkData['namaDokter'];
        if (namaDokterEntry == namaDokter.toString()) {
          String diagnosa = rkData['diagnosa'];
          Map<String, dynamic> riwayatKonsultasi = {
            'namaDokter': namaDokterEntry,
            'diagnosa': diagnosa,
          };
          listRiwayatKonsultasi.add(riwayatKonsultasi);
          print(listRiwayatKonsultasi);
        }
      }
      if (!completer.isCompleted) {
        completer.complete(listRiwayatKonsultasi);
      }
    }
  });
  return completer.future;
}
