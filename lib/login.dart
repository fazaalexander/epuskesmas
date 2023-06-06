import 'package:epuskesmas/handler/user/auth.handler.dart';
import 'package:epuskesmas/Pasien/dashboard_p.dart';
import 'package:epuskesmas/Dokter/dashboard_d.dart';
import 'package:epuskesmas/Apoteker/dashboard_a.dart';
import 'registrasi.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(
            width: screenWidth,
            height: screenHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: screenHeight * 0.1),
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.03),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                      horizontal: screenWidth * 0.05,
                    ),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(223, 246, 255, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/dokter_login.png',
                          height: screenHeight * 0.2,
                          width: screenHeight * 0.2,
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        SizedBox(
                          width: screenWidth * 0.8,
                          height: screenHeight * 0.06,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Masukkan email',
                              hintStyle: TextStyle(
                                fontSize: screenWidth * 0.04,
                                color: const Color.fromARGB(255, 182, 182, 182),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              ),
                            ),
                            controller: _email,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        SizedBox(
                          width: screenWidth * 0.8,
                          height: screenHeight * 0.06,
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Masukkan password',
                              hintStyle: TextStyle(
                                fontSize: screenWidth * 0.04,
                                color: const Color.fromARGB(255, 182, 182, 182),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              ),
                            ),
                            controller: _password,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.04),
                        ElevatedButton(
                          onPressed: () {
                            login(_email.text, _password.text, (String status) {
                              if (status == "success-pasien") {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      titlePadding: const EdgeInsets.fromLTRB(
                                          24, 24, 24, 0),
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          24, 12, 24, 24),
                                      title: const Icon(
                                        Icons.check,
                                        color: Colors.green,
                                        size: 40,
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Text(
                                            'Login Berhasil',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
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
                                                onPressed: () => Navigator.push(
                                                  // Arahkan ke homepage pasien...
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const DashboardP()),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.green,
                                                  foregroundColor: Colors.white,
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
                              } else if (status == "success-dokter") {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      titlePadding: const EdgeInsets.fromLTRB(
                                          24, 24, 24, 0),
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          24, 12, 24, 24),
                                      title: const Icon(
                                        Icons.check,
                                        color: Colors.green,
                                        size: 40,
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Text(
                                            'Login Berhasil',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
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
                                                // Arahkan ke homepage dokter...
                                                onPressed: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const DashboardD()),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.green,
                                                  foregroundColor: Colors.white,
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
                              } else if (status == "success-apoteker") {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      titlePadding: const EdgeInsets.fromLTRB(
                                          24, 24, 24, 0),
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          24, 12, 24, 24),
                                      title: const Icon(
                                        Icons.check,
                                        color: Colors.green,
                                        size: 40,
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Text(
                                            'Login Berhasil',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
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
                                                onPressed: () => Navigator.push(
                                                  // Arahkan ke homepage apoteker...
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const DashboardA()),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.green,
                                                  foregroundColor: Colors.white,
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
                              } else if (status == "user-not-found") {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      titlePadding: const EdgeInsets.fromLTRB(
                                          24, 24, 24, 0),
                                      contentPadding: const EdgeInsets.fromLTRB(
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
                                            'Login Gagal',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Email yang Anda masukkan salah atau belum terdaftar.',
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
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.red,
                                                  foregroundColor: Colors.white,
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
                              } else if (status == "wrong-password") {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      titlePadding: const EdgeInsets.fromLTRB(
                                          24, 24, 24, 0),
                                      contentPadding: const EdgeInsets.fromLTRB(
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
                                            'Login Gagal',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Password yang anda masukkan salah.',
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
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.red,
                                                  foregroundColor: Colors.white,
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 15.0),
                            minimumSize: const Size(161.0, 39.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text(
                            'SUBMIT',
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.04),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Do not have an account? ',
                              style: TextStyle(
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegistrasiPage()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0,
                                  vertical: 5.0,
                                ),
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 0,
                              ),
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.04,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: IgnorePointer(
                child: Image.asset(
                  'assets/images/wave.png',
                  fit: BoxFit.fitWidth,
                  height: screenHeight * 0.4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
