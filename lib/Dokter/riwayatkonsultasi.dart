import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:epuskesmas/handler/konsultasi/konsultasi.handler.dart';

class InputRiwayatKonsultasiPage extends StatefulWidget {
  const InputRiwayatKonsultasiPage({super.key});

  @override
  _InputRiwayatKonsultasiPageState createState() =>
      _InputRiwayatKonsultasiPageState();
}

class _InputRiwayatKonsultasiPageState
    extends State<InputRiwayatKonsultasiPage> {
  final TextEditingController _namaPasienController = TextEditingController();
  final TextEditingController _diagnosaController = TextEditingController();
  late String _tanggalPenginputan;

  @override
  void initState() {
    super.initState();
    _tanggalPenginputan = DateFormat('dd/MM/yyyy').format(DateTime.now());
  }

  @override
  void dispose() {
    _namaPasienController.dispose();
    _diagnosaController.dispose();
    super.dispose();
  }

  void _submitForm() {
    String namaPasien = _namaPasienController.text;
    String diagnosa = _diagnosaController.text;

    // Perform actions with the input data
    tambahRiwayatKonsultasi(namaPasien, diagnosa);

    // After performing actions, clear the input form
    _namaPasienController.clear();
    _diagnosaController.clear();
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
            TextFormField(
              controller: _namaPasienController,
              decoration: InputDecoration(
                labelText: 'Nama Pasien',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _diagnosaController,
              decoration: InputDecoration(
                labelText: 'Diagnosa',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Tanggal Penginputan: $_tanggalPenginputan',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitForm,
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
                'Submit',
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
