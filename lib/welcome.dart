import 'package:epuskesmas/login.dart';

import 'registrasi.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'ePuskesmas',
            style: TextStyle(
              fontSize: screenWidth * 0.08,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Image.asset(
            'assets/images/epuskesmas_logo.png',
            height: screenHeight * 0.3,
            width: screenHeight * 0.3,
          ),
          SizedBox(height: screenHeight * 0.03),
          Container(
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Text(
              'Konsultasi puskesmas berbasis Mobile Apps, kini mudah hanya dengan aplikasi ePuskesmas',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(71, 181, 255, 1),
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.1,
                vertical: screenHeight * 0.025,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(screenHeight * 0.02),
              ),
            ),
            child: Text(
              'GET STARTED',
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
