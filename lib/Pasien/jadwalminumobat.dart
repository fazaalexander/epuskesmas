import 'package:flutter/material.dart';

class JadwalMinumObatPage extends StatefulWidget {
  const JadwalMinumObatPage({super.key});

  @override
  _JadwalMinumObatPageState createState() => _JadwalMinumObatPageState();
}

class _JadwalMinumObatPageState extends State<JadwalMinumObatPage> {
  List<String> obatList = [];
  List<DateTime> jadwalMinumList = [];

  @override
  void initState() {
    super.initState();
    obatList = ['Obat A', 'Obat B', 'Obat C'];
    jadwalMinumList = [
      DateTime.now().add(const Duration(days: 1)),
      DateTime.now().add(const Duration(days: 2)),
      DateTime.now().add(const Duration(days: 3)),
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
        itemCount: obatList.length,
        itemBuilder: (BuildContext context, int index) {
          String obat = obatList[index];
          DateTime jadwalMinum = jadwalMinumList[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.medical_services),
              title: Text(
                obat,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('Jadwal Minum: ${jadwalMinum.toString()}'),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: JadwalMinumObatPage(),
    debugShowCheckedModeBanner: false,
  ));
}
