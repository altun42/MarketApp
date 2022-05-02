import 'package:flutter/material.dart';

class UrunDetay extends StatelessWidget {
  final String isim;
  final String fiyat;
  final String resimYolu;
  final bool mevcut;
  const UrunDetay(
      {Key? key,
      required this.isim,
      required this.fiyat,
      required this.resimYolu,
      required this.mevcut})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Hero(
                tag: resimYolu,
                child: Image.network(
                  resimYolu,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.red[400],
                  size: 40,
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                isim,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                fiyat,
                style: TextStyle(
                  color: Colors.red[400],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "Bu bölümde ürün açıklaması bulunacak. Ürünün nre kadar kaliteli olduğu hakkında bilgiler verilecek.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                height: 50,
                decoration: BoxDecoration(
                  color: mevcut ? Colors.red[400] : Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    mevcut ? "Sepete ekle" : "stokta yok",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
