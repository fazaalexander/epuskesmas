import 'package:epuskesmas/Dokter/profile_d.dart';
import 'package:epuskesmas/handler/user/profile.handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TambahSpesialisasi extends StatefulWidget {
  const TambahSpesialisasi({super.key});

  @override
  _TambahSpesialisasiState createState() => _TambahSpesialisasiState();
}

class _TambahSpesialisasiState extends State<TambahSpesialisasi> {
  TextEditingController _spesialisasi = TextEditingController();

  final idDokter = (FirebaseAuth.instance.currentUser?.uid).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'ePuskesmas',
          style: TextStyle(
            color: Colors.lightBlue,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.lightBlue,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            TextField(
              controller: _spesialisasi,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                hintText: 'Masukkan spesialisasi',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
                labelText: 'Spesialisasi',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                tambahSpesialisasi(idDokter, _spesialisasi.text);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                      contentPadding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
                      title: const Icon(
                        Icons.check,
                        color: Colors.green,
                        size: 40,
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'Berhasil menambahkan spesialisasi',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ProfileD()),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                ),
                                child: const Text('OK'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(71, 181, 255, 1),
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 15.0),
                minimumSize: const Size(161.0, 39.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                'SUBMIT',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
