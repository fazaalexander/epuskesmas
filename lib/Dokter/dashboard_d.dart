import 'package:epuskesmas/Dokter/kirimresep_d.dart';
import 'package:epuskesmas/Dokter/profile_d.dart';
import 'package:epuskesmas/Dokter/riwayatkonsultasi.dart';
import 'package:epuskesmas/handler/chat/chat.handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'chat_d.dart';

class DashboardD extends StatefulWidget {
  const DashboardD({super.key});

  @override
  State<DashboardD> createState() => _DashboardDState();
}

class _DashboardDState extends State<DashboardD> {
  String? conversationId;
  final idDokter = FirebaseAuth.instance.currentUser?.uid;
  void initState() {
    super.initState();
    getConversationIDByDokterID(idDokter.toString()).then((id) {
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
                    const Text(
                      'Hello, Dokter',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileD()),
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
                  children: const [
                    Text(
                      'dokter123@gmail.com',
                      style: TextStyle(
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
                      title: 'Chat Dengan Pasien',
                      subtitle:
                          'Kirim pesan melalui aplikasi ke pasien yang sudah dijadwalkan',
                      imagePath: 'assets/images/menu_chat.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatD(
                                    conversationId: conversationId.toString(),
                                    currentUserId: idDokter.toString(),
                                  )),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    buildMenuItem(
                      context: context,
                      title: 'Kirim Resep Obat',
                      subtitle: 'Kirim resep obat untuk pasien ke apoteker',
                      imagePath: 'assets/images/menu_obat.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ResepD()),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    buildMenuItem(
                      context: context,
                      title: 'Riwayat Konsultasi',
                      subtitle: 'Masukkan data riwayat konsultasi',
                      imagePath: 'assets/images/menu_konsultasi.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const InputRiwayatKonsultasiPage()),
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
