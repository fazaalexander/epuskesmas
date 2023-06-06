import 'package:epuskesmas/Pasien/jadwalminumobat.dart';
import 'package:epuskesmas/Pasien/profile_p.dart';
import 'package:epuskesmas/handler/chat/chat.handler.dart';
import 'package:flutter/material.dart';
import 'konsultasi.dart';
import 'obat.dart';
import 'chat_p.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DashboardP extends StatefulWidget {
  const DashboardP({super.key});

  @override
  State<DashboardP> createState() => _DashboardPState();
}

class _DashboardPState extends State<DashboardP> {
  String? conversationId;
  final idPasien = FirebaseAuth.instance.currentUser?.uid;
  void initState() {
    super.initState();
    getConversationIDByPasienID(idPasien.toString()).then((id) {
      setState(() {
        conversationId = id;
        print(conversationId);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, top: 30, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hello, ${FirebaseAuth.instance.currentUser?.displayName}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileP()),
                        );
                      },
                      child: Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(71, 181, 255, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.person),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, top: 5, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${FirebaseAuth.instance.currentUser?.email}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    buildMenuItem(
                      context: context,
                      title: 'Mulai Konsultasi',
                      subtitle: 'Pilih dokter spesialis sesuai keluhan pasien',
                      imagePath: 'assets/images/menu_konsultasi.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const KonsultasiPage()),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    buildMenuItem(
                      context: context,
                      title: 'Pesan Obat Racikan',
                      subtitle:
                          'Pilih obat racikan yang sudah dianjurkan oleh dokter',
                      imagePath: 'assets/images/menu_obat.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ObatPage()),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    buildMenuItem(
                      context: context,
                      title: 'Chat Dengan Dokter',
                      subtitle:
                          'Kirim pesan melalui aplikasi ke dokter yang sudah dijadwalkan',
                      imagePath: 'assets/images/menu_chat.png',
                      onTap: () {
                        if (conversationId != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatP(
                                      conversationId: conversationId.toString(),
                                      currentUserId: idPasien.toString(),
                                    )),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                titlePadding:
                                    const EdgeInsets.fromLTRB(24, 24, 24, 0),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(24, 12, 24, 24),
                                title: const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                  size: 40,
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text(
                                      'Gagal',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Anda belum mendaftar sesi konsultasi, silahkan mendaftar terlebih dahulu.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                actions: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
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
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    buildMenuItem(
                      context: context,
                      title: 'Jadwal Minum Obat',
                      subtitle: 'Lihat jadwal minum obat yang telah diberikan',
                      imagePath: 'assets/images/menu_obat.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const JadwalMinumObatPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 325,
          height: 149,
          padding:
              const EdgeInsets.only(top: 16, left: 16, right: 0, bottom: 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subtitle,
                      style: const TextStyle(fontSize: 12),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  imagePath,
                  width: 132,
                  height: 98,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
