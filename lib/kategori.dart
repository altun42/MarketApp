import 'package:flutter/material.dart';
import 'package:fmarket/urun_detay.dart';

class Kategori extends StatefulWidget {
  final String kategori;
  const Kategori({Key? key, required this.kategori}) : super(key: key);

  @override
  State<Kategori> createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  List<Widget> gosterilecekListe = [];
  @override
  void initState() {
    super.initState();
    if (widget.kategori == "temel gıda") {
      gosterilecekListe = [
        urunKarti(
          "Zeytinyağı",
          "23.50 TL",
          "https://st2.myideasoft.com/idea/bg/23/myassets/products/114/soguk-sikim-zeytinyagi-1-litre-0-80-asit.jpg?revision=1621432851",
          mevcut: true,
        ),
        urunKarti("Süt", "3.50 TL",
            "https://cdnntr1.img.sputniknews.com/img/07e5/01/0e/1043575412_0:73:2000:1198_1920x0_80_0_0_05b9dd3cbece22ff12dffac44f621da0.jpg.webp"),
        urunKarti(
          "Çay",
          "8.50 TL",
          "https://caykursatis.com/demlik-suzen-poset-cay-200gr-478-siyah-cay-caykur-siyah-cay-758-27-B.jpg",
          mevcut: true,
        ),
        urunKarti("Zeytin", "12.50 TL",
            "https://i0.wp.com/www.forazeytin.com.tr/blog/wp-content/uploads/2021/06/FORA_18_Bilgi-2.png?fit=800%2C490")
      ];
    } else if (widget.kategori == "şekerleme") {
      gosterilecekListe = [
        urunKarti("Jelibon", "6 TL",
            "https://blog.cereztabagi.com/wp-content/uploads/2018/10/jelibon-nasil-yapilir.jpg"),
        urunKarti("Çikolata", "13 TL",
            "https://i4.hurimg.com/i/hurriyet/75/750x0/5c1cbda10f25442768aa5a33.jpg"),
        urunKarti("Lokum", "19 TL",
            "https://www.haciserif.com/gul-aromali-lokum-5-kg-lokumlar-haci-serif-6186-10-B.jpg"),
      ];
    } else if (widget.kategori == "içecekler") {
      gosterilecekListe = [
        urunKarti(
            "Kola", "20 TL", "https://www.neoldu.com/d/other/kola-sisesi.jpg"),
        urunKarti("Portakal Suyu", "23 TL",
            "https://cdn.yemek.com/mnresize/940/940/uploads/2017/11/3-portakaldan-5-litre-portakal-suyu-tarifi.jpg"),
        urunKarti("Fanta", "17 TL",
            "https://www.coca-cola.com.tr/content/dam/one/tr/tr/brand-section-desktop/fanta_1600x700_v4.jpg"),
        urunKarti("Çikolatalı Süt", "5 TL",
            "https://yavuzmental.com/wp-content/uploads/2018/04/kakaolu-sut.jpg"),
      ];
    } else if (widget.kategori == "temizlik") {
      gosterilecekListe = [
        urunKarti("Domestos", "20 TL",
            "https://img.istegelsin.com/medium/8690637895838_8b.jpg"),
        urunKarti("Sabun", "12 TL",
            "https://kulturveyasam.com/wp-content/uploads/2018/01/sabun-09.jpg"),
        urunKarti("Deterjan", "30 TL",
            "https://www.aksugroup.com.tr/File_Uploadx/Sayfa/buyuk/aksu-group-olaa-toz-deterjan-45-kg-311666.JPG"),
      ];
    }
  }

  Widget urunKarti(String isim, String fiyat, String resimYolu,
      {bool mevcut = false}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => UrunDetay(
                      fiyat: fiyat,
                      isim: isim,
                      resimYolu: resimYolu,
                      mevcut: mevcut,
                    ))));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 4.0,
                spreadRadius: 2.0),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: resimYolu,
              child: Container(
                width: 120,
                height: 80,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(resimYolu), fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              isim,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              fiyat,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.red[400],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      padding: EdgeInsets.all(10.0),
      childAspectRatio: 1,
      children: gosterilecekListe,
    );
  }
}
