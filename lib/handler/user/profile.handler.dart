import 'package:firebase_database/firebase_database.dart';

void tambahSpesialisasi(String? dokterID, String? spesialisasi) async {
  final dataDokter = {"spesialisasi": spesialisasi!};

  final newDokterKey = FirebaseDatabase.instance
      .ref('dokter')
      .child(dokterID!)
      .update(dataDokter);

  return await newDokterKey;
}

void updateProfilePasien(String? pasienID, String? alamat) async {
  final dataPasien = {"alamat": alamat!};

  final newPasienKey = FirebaseDatabase.instance
      .ref('pasien')
      .child(pasienID!)
      .update(dataPasien);

  return await newPasienKey;
}
