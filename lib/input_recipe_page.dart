import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class InputResepPage extends StatefulWidget {
  final Map<String, String>? initialData;

  InputResepPage({Key? key, this.initialData}) : super(key: key);

  @override
  _InputResepPageState createState() => _InputResepPageState();
}

class _InputResepPageState extends State<InputResepPage> {
  late TextEditingController _namaController;
  late TextEditingController _bahanController;
  late TextEditingController _instruksiController;

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: widget.initialData?['nama'] ?? '');
    _bahanController = TextEditingController(text: widget.initialData?['bahan'] ?? '');
    _instruksiController = TextEditingController(text: widget.initialData?['instruksi'] ?? '');
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final double screenHeight = mediaQuery.size.height;
    final double screenWidth = mediaQuery.size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Resep Baru'),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04), // Menggunakan 4% lebar layar sebagai padding
        child: Column(
          children: <Widget>[
            CupertinoTextField(
              controller: _namaController,
              placeholder: 'Nama Resep',
              padding: EdgeInsets.all(screenWidth * 0.03), // Menggunakan 3% lebar layar sebagai padding
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(screenWidth * 0.02), // Menggunakan 2% lebar layar sebagai radius border
              ),
            ),
            SizedBox(height: screenHeight * 0.02), // Menggunakan 2% tinggi layar sebagai jarak antar elemen
            CupertinoTextField(
              controller: _bahanController,
              placeholder: 'Bahan-bahan',
              maxLines: 3,
              padding: EdgeInsets.all(screenWidth * 0.03),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            CupertinoTextField(
              controller: _instruksiController,
              placeholder: 'Instruksi',
              maxLines: 3,
              padding: EdgeInsets.all(screenWidth * 0.03),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
            CupertinoButton(
              onPressed: () {
                _simpanResep();
              },
              child: Text('Simpan Resep'),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }


  void _simpanResep() {
    String namaResep = _namaController.text;
    String bahanResep = _bahanController.text;
    String instruksiResep = _instruksiController.text;

    // Validasi input
    if (namaResep.isEmpty || bahanResep.isEmpty || instruksiResep.isEmpty) {
      // Tampilkan pesan error jika ada input yang kosong
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Harap isi semua kolom.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      // Jika semua input valid, kirim data resep ke halaman sebelumnya
      Map<String, String> resepData = {
        'nama': namaResep,
        'bahan': bahanResep,
        'instruksi': instruksiResep,
      };
      Navigator.pop(context, resepData);

      // Tampilkan Snackbar 'Berhasil Tersimpan'
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Berhasil Tersimpan'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
