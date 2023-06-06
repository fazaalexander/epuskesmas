import 'package:flutter/material.dart';
import 'package:epuskesmas/handler/resep/resepObat.handler.dart';

class ResepObatPage extends StatefulWidget {
  const ResepObatPage({super.key});

  @override
  _ResepObatPageState createState() => _ResepObatPageState();
}

class _ResepObatPageState extends State<ResepObatPage> {
  List<Map<String, dynamic>> listResepObat = [];

  @override
  void initState() {
    super.initState();
    getResepDokter().then((resepList) {
      setState(() {
        listResepObat = resepList;
        print(listResepObat);
      });
    });
  }

  final List<String> prescriptionList = [
    'Resep Obat Pasien A',
    'Resep Obat Pasien B',
    'Resep Obat Pasien C',
    'Resep Obat Pasien D',
    'Resep Obat Pasien E',
  ];

  void _showPrescriptionInfo(BuildContext context, String prescription) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(width: 8),
                    Text(
                      'Daftar Obat',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: listResepObat.length, // Jumlah resep obat
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text('${listResepObat[index]['resepObat']}'),
                    );
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(71, 181, 255, 1),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 40,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Tutup',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
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
        itemCount: listResepObat.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const Icon(
                Icons.description,
                color: Colors.blue,
              ),
              title: Text(
                "Resep Obat ${listResepObat[index]['namaPasien']}",
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
              onTap: () {
                _showPrescriptionInfo(context, prescriptionList[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
