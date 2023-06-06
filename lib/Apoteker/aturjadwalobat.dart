import 'package:flutter/material.dart';

class AturJadwalObatPage extends StatefulWidget {
  const AturJadwalObatPage({super.key});

  @override
  _AturJadwalObatPageState createState() => _AturJadwalObatPageState();
}

class _AturJadwalObatPageState extends State<AturJadwalObatPage> {
  List<String> obatList = [];
  List<DateTime> jadwalMinumList = [];

  void _tambahJadwalMinum() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String obat = '';
        DateTime jadwalMinum = DateTime.now();

        return AlertDialog(
          title: const Text('Tambah Jadwal Minum Obat'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Obat'),
                onChanged: (value) {
                  obat = value;
                },
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('Jadwal Minum'),
                subtitle: Text(jadwalMinum.toString()),
                onTap: () async {
                  final DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: jadwalMinum,
                    firstDate: DateTime(2021),
                    lastDate: DateTime(2025),
                  );
                  if (selectedDate != null) {
                    final TimeOfDay? selectedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(jadwalMinum),
                    );
                    if (selectedTime != null) {
                      setState(() {
                        jadwalMinum = DateTime(
                          selectedDate.year,
                          selectedDate.month,
                          selectedDate.day,
                          selectedTime.hour,
                          selectedTime.minute,
                        );
                      });
                    }
                  }
                },
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  obatList.add(obat);
                  jadwalMinumList.add(jadwalMinum);
                });
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                'Simpan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Batal',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
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
      floatingActionButton: FloatingActionButton(
        onPressed: _tambahJadwalMinum,
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
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
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    obatList.removeAt(index);
                    jadwalMinumList.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: AturJadwalObatPage(),
    debugShowCheckedModeBanner: false,
  ));
}
