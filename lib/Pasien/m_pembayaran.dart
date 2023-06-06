import 's_pembayaran.dart';
import 'package:flutter/material.dart';

class MPembayaranPage extends StatefulWidget {
  const MPembayaranPage({super.key});

  @override
  _MPembayaranPageState createState() => _MPembayaranPageState();
}

class _MPembayaranPageState extends State<MPembayaranPage> {
  String metodePembayaran = '';
  String metodePengiriman = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Pembayaran',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Metode Pembayaran:',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      metodePembayaran = 'Dana';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: metodePembayaran == 'Dana'
                          ? Colors.blue
                          : Colors.grey[200],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.account_balance_wallet,
                          color: metodePembayaran == 'Dana'
                              ? Colors.white
                              : Colors.black,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Dana',
                          style: TextStyle(
                            color: metodePembayaran == 'Dana'
                                ? Colors.white
                                : Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    setState(() {
                      metodePembayaran = 'Gopay';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: metodePembayaran == 'Gopay'
                          ? Colors.blue
                          : Colors.grey[200],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.account_balance_wallet,
                          color: metodePembayaran == 'Gopay'
                              ? Colors.white
                              : Colors.black,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Gopay',
                          style: TextStyle(
                            color: metodePembayaran == 'Gopay'
                                ? Colors.white
                                : Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    setState(() {
                      metodePembayaran = 'PayPal';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: metodePembayaran == 'PayPal'
                          ? Colors.blue
                          : Colors.grey[200],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.payment,
                          color: metodePembayaran == 'PayPal'
                              ? Colors.white
                              : Colors.black,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'PayPal',
                          style: TextStyle(
                            color: metodePembayaran == 'PayPal'
                                ? Colors.white
                                : Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    setState(() {
                      metodePembayaran = 'Visa';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: metodePembayaran == 'Visa'
                          ? Colors.blue
                          : Colors.grey[200],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.credit_card,
                          color: metodePembayaran == 'Visa'
                              ? Colors.white
                              : Colors.black,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Visa',
                          style: TextStyle(
                            color: metodePembayaran == 'Visa'
                                ? Colors.white
                                : Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Metode Pengiriman:',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      metodePengiriman = 'Grab';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: metodePengiriman == 'Grab'
                          ? Colors.blue
                          : Colors.grey[200],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.motorcycle,
                          color: metodePengiriman == 'Grab'
                              ? Colors.white
                              : Colors.black,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Grab',
                          style: TextStyle(
                            color: metodePengiriman == 'Grab'
                                ? Colors.white
                                : Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    setState(() {
                      metodePengiriman = 'Gojek';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: metodePengiriman == 'Gojek'
                          ? Colors.blue
                          : Colors.grey[200],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.motorcycle,
                          color: metodePengiriman == 'Gojek'
                              ? Colors.white
                              : Colors.black,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Gojek',
                          style: TextStyle(
                            color: metodePengiriman == 'Gojek'
                                ? Colors.white
                                : Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    setState(() {
                      metodePengiriman = 'JNE';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: metodePengiriman == 'JNE'
                          ? Colors.blue
                          : Colors.grey[200],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.local_shipping,
                          color: metodePengiriman == 'JNE'
                              ? Colors.white
                              : Colors.black,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'JNE',
                          style: TextStyle(
                            color: metodePengiriman == 'JNE'
                                ? Colors.white
                                : Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    setState(() {
                      metodePengiriman = 'AnterAja';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: metodePengiriman == 'AnterAja'
                          ? Colors.blue
                          : Colors.grey[200],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.local_shipping,
                          color: metodePengiriman == 'AnterAja'
                              ? Colors.white
                              : Colors.black,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Anteraja',
                          style: TextStyle(
                            color: metodePengiriman == 'AnterAja'
                                ? Colors.white
                                : Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                            'Kode Pembayaran',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          titlePadding: const EdgeInsets.only(top: 40.0),
                          content: const Text(
                            '829863780',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(20.0),
                          actions: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const SPembayaranPage()),
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.lightBlue,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 20,
                                        horizontal: 40,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                  child: const Text('Selesai',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15)),
                                ),
                              ],
                            )
                          ],
                          actionsPadding: const EdgeInsets.only(bottom: 40.0),
                        );
                      });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(19, 99, 223, 1),
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 40,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Bayar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomRadioButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomRadioButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? Colors.blue : Colors.grey[200],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.black,
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
