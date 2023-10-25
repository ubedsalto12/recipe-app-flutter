import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final double screenHeight = mediaQuery.size.height;
    final double screenWidth = mediaQuery.size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: screenWidth * 0.15, // Gunakan 15% lebar layar sebagai radius avatar
              backgroundImage: AssetImage('assets/profile_picture.jpg'),
            ),
            SizedBox(height: screenHeight * 0.02), // Gunakan 2% tinggi layar sebagai jarak antara elemen
            Text(
              'Nama: Muhammad Reza Ubaidillah',
              style: TextStyle(fontSize: screenWidth * 0.05), // Gunakan 5% lebar layar sebagai ukuran font
            ),
            Text(
              'Kelas: B21 Informatika',
              style: TextStyle(fontSize: screenWidth * 0.04), // Gunakan 4% lebar layar sebagai ukuran font
            ),
            Text(
              'NIM: 2109106084',
              style: TextStyle(fontSize: screenWidth * 0.04), // Gunakan 4% lebar layar sebagai ukuran font
            ),
          ],
        ),
      ),
    );
  }
}
