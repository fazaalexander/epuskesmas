import 'package:epuskesmas/Pasien/chat_p.dart';
import 'package:epuskesmas/Pasien/dashboard_p.dart';
import 'package:epuskesmas/Pasien/profile_p.dart';
import 'package:epuskesmas/handler/chat/chat.handler.dart';
import 'package:epuskesmas/handler/user/user.handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class KonsultasiPage extends StatefulWidget {
  const KonsultasiPage({super.key});

  @override
  _KonsultasiPageState createState() => _KonsultasiPageState();
}

class _KonsultasiPageState extends State<KonsultasiPage> {
  List<Map<String, dynamic>> listDokter = [];

  @override
  void initState() {
    super.initState();
    getAllDokter().then((dokterList) {
      setState(() {
        listDokter = dokterList;
        print(listDokter);
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
                      '${FirebaseAuth.instance.currentUser?.displayName}',
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
                margin: const EdgeInsets.only(left: 40, top: 20, right: 20),
                alignment: Alignment.topLeft,
                child: const Text(
                  'Pilih Dokter Spesialis',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listDokter.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: 325,
                          height: 180,
                          padding: const EdgeInsets.only(
                            top: 16,
                            left: 16,
                            right: 0,
                            bottom: 0,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Spesialis ${listDokter[index]['spesialis']}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Dr. ${listDokter[index]['nama']}',
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
                                  'assets/images/dr_nora.png',
                                  width: 132,
                                  height: 160,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 16,
                          left: 16,
                          child: ElevatedButton(
                            onPressed: () {
                              createNewConversation(listDokter[index]["id"],
                                  (String status) {
                                if (status == "success") {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text(
                                          'Konsultasi Berhasil',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        titlePadding:
                                            const EdgeInsets.only(top: 40.0),
                                        content: Text(
                                          'Berhasil memulai konsultasi dengan dokter ${listDokter[index]['nama']}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                        contentPadding:
                                            const EdgeInsets.all(20.0),
                                        actions: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          DashboardP(),
                                                    ),
                                                  );
                                                },
                                                style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.lightBlue,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 20,
                                                    horizontal: 40,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                                child: const Text(
                                                  'Mulai Chat',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                        actionsPadding:
                                            const EdgeInsets.only(bottom: 40.0),
                                      );
                                    },
                                  );
                                } else if (status == "failed") {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        titlePadding: const EdgeInsets.fromLTRB(
                                            24, 24, 24, 0),
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                24, 12, 24, 24),
                                        title: const Icon(
                                          Icons.error,
                                          color: Colors.red,
                                          size: 40,
                                        ),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: const [
                                            Text(
                                              'Gagal Melakukan Konsultasi',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              'Mohon selesaikan sesi konsultasi anda terlebih dahulu sebelum memulai konsultasi baru.',
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: ElevatedButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.red,
                                                    foregroundColor:
                                                        Colors.white,
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
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(71, 181, 255, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              minimumSize: const Size(112, 34),
                            ),
                            child: const Text(
                              'Konsultasi',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
