import 'package:flutter/material.dart';
import 'detail_resep_page.dart';
import 'input_recipe_page.dart';

class ResepkuPage extends StatefulWidget {
  @override
  _ResepkuPageState createState() => _ResepkuPageState();
}

class _ResepkuPageState extends State<ResepkuPage> {
  List<Map<String, String>> resepList = [];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final double screenHeight = mediaQuery.size.height;
    final double screenWidth = mediaQuery.size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Resepku'),
      ),
      body: ListView.builder(
        itemCount: resepList.length,
        itemBuilder: (context, index) {
          var resep = resepList[index];
          return Container(
            height: screenHeight * 0.1, // Misalnya, menggunakan 10% tinggi layar
            width: screenWidth, // Menggunakan lebar layar
            child: ListTile(
              title: Text(resep['nama'] ?? ''),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      _editResep(index);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _deleteResep(index);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.visibility),
                    onPressed: () {
                      _navigateToDetailResepPage(resep);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToInputResepPage();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _navigateToInputResepPage() async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InputResepPage()),
    );

    if (result != null && result is Map<String, String>) {
      setState(() {
        resepList.add(result);
      });
    }
  }

  void _editResep(int index) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InputResepPage(
          initialData: resepList[index],
        ),
      ),
    );

    if (result != null && result is Map<String, String>) {
      setState(() {
        resepList[index] = result;
      });
    }
  }

  void _deleteResep(int index) {
    setState(() {
      resepList.removeAt(index);
    });
  }

  void _navigateToDetailResepPage(Map<String, String> resep) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailResepPage(resep: resep)),
    );
  }
}

void main() => runApp(MaterialApp(home: ResepkuPage()));
