import 'package:epuskesmas/Apoteker/aturjadwalobat.dart';
import 'package:epuskesmas/Apoteker/daftarObat.dart';
import 'package:epuskesmas/Apoteker/kirimresep_a.dart';
import 'package:epuskesmas/Apoteker/profile_a.dart';
import 'package:epuskesmas/Apoteker/resepobat.dart';
import 'package:flutter/material.dart';

class DashboardA extends StatefulWidget {
  const DashboardA({super.key});

  @override
  State<DashboardA> createState() => _DashboardAState();
}

class _DashboardAState extends State<DashboardA> {
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
                      'Hello, Apoteker',
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
                              builder: (context) => const ProfileA()),
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
                      'apoteker123@gmail.com',
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
                      title: 'Daftar Obat',
                      subtitle: 'Lihat daftar obat yang tersedia',
                      imagePath: 'assets/images/menu_chat.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DaftarObatPage()),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    buildMenuItem(
                      context: context,
                      title: 'Resep Obat',
                      subtitle: 'Daftar resep obat untuk pasien',
                      imagePath: 'assets/images/menu_chat.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ResepObatPage()),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    buildMenuItem(
                      context: context,
                      title: 'Kirim Resep Obat',
                      subtitle: 'Kirim resep obat dari dokter ke pasien',
                      imagePath: 'assets/images/menu_obat.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ResepA()),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    buildMenuItem(
                      context: context,
                      title: 'Atur Jadwal Minum Obat',
                      subtitle: 'Atur jadwal minum obat untuk pasien',
                      imagePath: 'assets/images/menu_konsultasi.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AturJadwalObatPage()),
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
