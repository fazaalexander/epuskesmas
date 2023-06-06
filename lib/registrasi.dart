import 'login.dart';
import 'handler/user/register.handler.dart';
import 'package:flutter/material.dart';

class RegistrasiPage extends StatefulWidget {
  const RegistrasiPage({super.key});

  @override
  _RegistrasiPageState createState() => _RegistrasiPageState();
}

class _RegistrasiPageState extends State<RegistrasiPage> {
  final List<String> roles = ['Pasien', 'Dokter', 'Apoteker'];
  late String selectedRole = 'Pasien';

  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _nik = TextEditingController();
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
                  'Daftarkan Sekarang!',
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
                        SizedBox(height: screenHeight * 0.03),
                        buildTextField(
                          hintText: 'Nama lengkap',
                          screenWidth: screenWidth,
                          controller: _fullName,
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        buildTextField(
                          hintText: 'NIK / No. Registrasi',
                          screenWidth: screenWidth,
                          controller: _nik,
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        buildTextField(
                          hintText: 'Email',
                          screenWidth: screenWidth,
                          controller: _email,
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        buildTextField(
                          hintText: 'Password',
                          screenWidth: screenWidth,
                          obscureText: true,
                          controller: _password,
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        buildDropdownField(screenWidth),
                        SizedBox(height: screenHeight * 0.04),
                        ElevatedButton(
                          onPressed: () {
                            registerAccount(
                                _fullName.text,
                                _nik.text,
                                _email.text,
                                _password.text,
                                selectedRole, (String status) {
                              if (status == "success") {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      titlePadding:
                                          const EdgeInsets.fromLTRB(24, 24, 24, 0),
                                      contentPadding:
                                          const EdgeInsets.fromLTRB(24, 12, 24, 24),
                                      title: const Icon(
                                        Icons.check,
                                        color: Colors.green,
                                        size: 40,
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Text(
                                            'Registrasi Berhasil',
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
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LoginPage()),
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
                              } else if (status == "weak-password") {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      titlePadding:
                                          const EdgeInsets.fromLTRB(24, 24, 24, 0),
                                      contentPadding:
                                          const EdgeInsets.fromLTRB(24, 12, 24, 24),
                                      title: const Icon(
                                        Icons.error,
                                        color: Colors.red,
                                        size: 40,
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Text(
                                            'Registrasi Gagal',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Password terlalu lemah',
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
                              } else if (status == "email-already-in-use") {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      titlePadding:
                                          const EdgeInsets.fromLTRB(24, 24, 24, 0),
                                      contentPadding:
                                          const EdgeInsets.fromLTRB(24, 12, 24, 24),
                                      title: const Icon(
                                        Icons.error,
                                        color: Colors.red,
                                        size: 40,
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Text(
                                            'Registrasi Gagal',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Email sudah terdaftar',
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
                              } else if (status == "error") {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      titlePadding:
                                          const EdgeInsets.fromLTRB(24, 24, 24, 0),
                                      contentPadding:
                                          const EdgeInsets.fromLTRB(24, 12, 24, 24),
                                      title: const Icon(
                                        Icons.error,
                                        color: Colors.red,
                                        size: 40,
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Text(
                                            'Registrasi Gagal',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Terjadi error, tolong periksa kembali data yang anda masukkan',
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
                            backgroundColor: const Color.fromRGBO(71, 181, 255, 1),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 15.0,
                            ),
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
                        buildAccountSignInRow(
                          screenWidth: screenWidth,
                          context: context,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField({
    required String hintText,
    required double screenWidth,
    TextEditingController? controller,
    bool obscureText = false,
  }) {
    return SizedBox(
      width: screenWidth * 0.8,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: screenWidth * 0.04,
            color: const Color.fromARGB(255, 182, 182, 182),
          ),
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget buildDropdownField(double screenWidth) {
    return SizedBox(
      width: screenWidth * 0.8,
      child: DropdownButtonFormField<String>(
        value: selectedRole,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
        items: roles.map((role) {
          return DropdownMenuItem<String>(
            value: role,
            child: Text(role),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedRole = value!;
          });
        },
      ),
    );
  }

  Widget buildAccountSignInRow({
    required double screenWidth,
    required BuildContext context,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Sudah mempunyai akun? ',
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
                builder: (context) => LoginPage(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
              vertical: 5.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.blue,
          ),
          child: Text(
            'Sign in',
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
