import 'package:flutter/material.dart';
import 'package:fmarket/sepetim.dart';
import 'package:fmarket/urunler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projem',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  late List<Widget> _icerikler;
  int _aktifIcerikNo = 0;

  @override
  void initState() {
    super.initState();
    _icerikler = [
      Urunler(),
      Sepetim(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.red[400]),
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Uçarak Gelsin",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ),
      body: _icerikler[_aktifIcerikNo],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Kerim"),
              accountEmail: Text("ahmetkerimaltun@gmail.com"),
              currentAccountPicture:Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://www.teknobh.com/wp-content/uploads/2022/01/en-guzel-whatsapp-profil-fotograflari-2022-31-scaled.jpg"),
                    fit: BoxFit.cover,
                    
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              ) ,
              decoration:BoxDecoration(color: Colors.red[400]) ,
            ),
            ListTile(title: Text("Siparişlerim"),onTap: (){},),
            ListTile(title: Text("İndirimlerim"),onTap: (){},),
            ListTile(title: Text("Ayarlar"),onTap: (){},),
            ListTile(title: Text("Çıkış Yap"),onTap: (){
              Navigator.pop(context);
            },),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red[400],
        unselectedItemColor: Colors.grey[600],
        currentIndex: _aktifIcerikNo,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Ürübler"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              label: "Sepetim"),
        ],
        onTap: (int tiklananButonPozisyonNo) {
          setState(() {
            _aktifIcerikNo = tiklananButonPozisyonNo;
          });
        },
      ),
    );
  }
}
