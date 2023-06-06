import 'package:epuskesmas/handler/konsultasi/konsultasi.handler.dart';
import 'package:flutter/material.dart';

class RiwayatKonsultasiD extends StatefulWidget {
  const RiwayatKonsultasiD({super.key});

  @override
  _RiwayatKonsultasiDState createState() => _RiwayatKonsultasiDState();
}

class _RiwayatKonsultasiDState extends State<RiwayatKonsultasiD> {
  List<Map<String, dynamic>> riwayatKonsultasiList = [];

  @override
  void initState() {
    super.initState();
    getRiwayatKonsultasiDokter().then((rkList) {
      setState(() {
        riwayatKonsultasiList = rkList;
        print(riwayatKonsultasiList);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(223, 246, 255, 1),
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
      body: ListView.builder(
        itemCount: riwayatKonsultasiList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(
                riwayatKonsultasiList[index]['namaDokter'],
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                  'Diagnosa: ${riwayatKonsultasiList[index]['diagnosa']}\n'
                  'Tanggal Penginputan: ${DateTime.now().toString()}'),
            ),
          );
        },
      ),
    );
  }
}
