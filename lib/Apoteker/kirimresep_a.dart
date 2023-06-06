import 'package:flutter/material.dart';
import 'package:epuskesmas/Dokter/dashboard_d.dart';

class ResepA extends StatefulWidget {
  const ResepA({super.key});

  @override
  _ResepAState createState() => _ResepAState();
}

class _ResepAState extends State<ResepA> {
  final TextEditingController _patientNameController = TextEditingController();
  final List<String> _prescriptionList = [];
  final TextEditingController _medicineController = TextEditingController();

  void _addPrescription() {
    String medicine = _medicineController.text;

    setState(() {
      _prescriptionList.add(medicine);
      _medicineController.clear();
    });
  }

  void _sendPrescription() {
    String patientName = _patientNameController.text;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Resep Obat Terkirim',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          titlePadding: const EdgeInsets.only(top: 40.0),
          content: Text(
            'Resep obat untuk $patientName telah berhasil dikirim ke pasien.',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          contentPadding: const EdgeInsets.all(20.0),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const DashboardD()));
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(71, 181, 255, 1),
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 40,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: const Text('Ke Beranda',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                ),
              ],
            )
          ],
          actionsPadding: const EdgeInsets.only(bottom: 40.0),
        );
      },
    );
  }

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
              controller: _patientNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                hintText: 'Masukkan nama pasien',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
                labelText: 'Nama Pasien',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _medicineController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                hintText: 'Masukkan nama obat',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
                labelText: 'Nama Obat',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addPrescription,
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
                'Tambah Obat',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Resep Obat:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ListView.builder(
                  itemCount: _prescriptionList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(_prescriptionList[index]),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _sendPrescription,
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
                'Kirim Resep Obat',
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
  }
}
