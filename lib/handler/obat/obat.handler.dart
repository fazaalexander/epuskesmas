import 'package:firebase_database/firebase_database.dart';

// Menambahkan data obat
void tambahObat(String nama, double harga, String deskripsi, int stok) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("obat");

  await ref.set({
    "name": nama,
    "deskripsi": deskripsi,
    "stock": stok,
    "harga": harga,
    "created_at": DateTime.now().millisecondsSinceEpoch
  });
}

// Mengambil semua data obat
Future<void> getAllObat() async {
  FirebaseDatabase.instance
      .ref()
      .child("obat")
      .once()
      .then((DatabaseEvent event) {
    print(event.snapshot.value);
  });
}

// Mengupdate detail obat
Future<void> editObat(String? obatId, String? nama, double? harga,
    String? deskripsi, int? stok) async {
  final dataObat = {
    "name": nama!,
    "deskripsi": deskripsi!,
    "stock": stok!,
    "harga": harga!,
  };

  final newObatKey =
      FirebaseDatabase.instance.ref('obat').child(obatId!).update(dataObat);

  return await newObatKey;
}

// Menghapus data obat
Future<void> deleteObat(String? obatId) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("obat");
  return ref.child(obatId!).remove();
}
