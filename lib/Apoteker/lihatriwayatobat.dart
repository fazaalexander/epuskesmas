import 'package:flutter/material.dart';

class RiwayatPengirimanResep extends StatefulWidget {
  const RiwayatPengirimanResep({super.key});

  @override
  _RiwayatPengirimanResepState createState() =>
      _RiwayatPengirimanResepState();
}

class _RiwayatPengirimanResepState extends State<RiwayatPengirimanResep> {
  List<RiwayatPengirimanObat> riwayatList = [];

  @override
  void initState() {
    super.initState();
    // Simulate data received from apoteker
    riwayatList = [
      RiwayatPengirimanObat(
        namaPasien: 'Pasien A',
        obat: ['Obat A', 'Obat B'],
        tanggalPengiriman: DateTime.now().add(const Duration(days: -3)),
      ),
      RiwayatPengirimanObat(
        namaPasien: 'Pasien B',
        obat: ['Obat C', 'Obat D'],
        tanggalPengiriman: DateTime.now().add(const Duration(days: -2)),
      ),
      RiwayatPengirimanObat(
        namaPasien: 'Pasien C',
        obat: ['Obat E', 'Obat F'],
        tanggalPengiriman: DateTime.now().add(const Duration(days: -1)),
      ),
    ];
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
        itemCount: riwayatList.length,
        itemBuilder: (BuildContext context, int index) {
          RiwayatPengirimanObat riwayat = riwayatList[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(
                riwayat.namaPasien,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Obat:'),
                  const SizedBox(height: 4),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: riwayat.obat.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text('- ${riwayat.obat[index]}');
                    },
                  ),
                  const SizedBox(height: 4),
                  Text('Tanggal Pengiriman: ${riwayat.tanggalPengiriman.toString()}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class RiwayatPengirimanObat {
  final String namaPasien;
  final List<String> obat;
  final DateTime tanggalPengiriman;

  RiwayatPengirimanObat({
    required this.namaPasien,
    required this.obat,
    required this.tanggalPengiriman,
  });
}

void main() {
  runApp(const MaterialApp(
    home: RiwayatPengirimanResep(),
    debugShowCheckedModeBanner: false,
  ));
}
