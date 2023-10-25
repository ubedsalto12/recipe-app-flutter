import 'package:flutter/material.dart';

class DetailResepPage extends StatelessWidget {
  final Map<String, String> resep;

  DetailResepPage({required this.resep});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final double screenHeight = mediaQuery.size.height;
    final double screenWidth = mediaQuery.size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Resep'),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04), // Menggunakan 4% lebar layar sebagai padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Nama Resep: ${resep['nama']}',
              style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold), // Menggunakan 6% lebar layar sebagai ukuran font
            ),
            SizedBox(height: screenHeight * 0.02), // Menggunakan 2% tinggi layar sebagai jarak antar elemen
            Text(
              'Bahan-bahan: ${resep['bahan']}',
              style: TextStyle(fontSize: screenWidth * 0.04),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              'Instruksi: ${resep['instruksi']}',
              style: TextStyle(fontSize: screenWidth * 0.04),
            ),
          ],
        ),
      ),
    );
  }
}
