import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:alisveris_provider_uyg/StateManagement/provider.dart';
import 'package:alisveris_provider_uyg/customs/custom_snackBar.dart';
import 'package:alisveris_provider_uyg/customs/renkler.dart';
import 'package:alisveris_provider_uyg/customs/metin_stilleri.dart';
import 'package:alisveris_provider_uyg/customs/animatedContainer_button.dart';

class Urun {
  final String urunID;
  final String urunAd;
  final double urunFiyat;
  final String assetImage;
  int urunCount;

  Urun({
    required this.urunID,
    required this.urunAd,
    required this.urunFiyat,
    required this.assetImage,
    this.urunCount=0,
  });
}

class UrunKarti extends StatefulWidget {
  final Urun urun;

  UrunKarti({required this.urun});

  @override
  State<UrunKarti> createState() => _UrunKartiState();
}

class _UrunKartiState extends State<UrunKarti> {
  bool isPressed_addProduct = false; // button durum değişken safya başlangıcında her zaman false
  bool isLoading = false; // yükleme durumu

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          widget.urun.assetImage,
          width: 60,
          height: 100,
        ),
        title: Text(
          widget.urun.urunAd,
          style: kucukMetinStilleri(CustomRenkler.siyahRenk, "Roboto"),
        ),
        subtitle: Text(
          '\$${widget.urun.urunFiyat.toStringAsFixed(2)}',
          style: const TextStyle(
              color: CustomRenkler.griRenk,
              fontSize: 14,
              fontFamily: "Reddit",
              fontWeight: FontWeight.w600),
        ),
        trailing: Stack(
          children: [
            Listener(
              onPointerUp: (_) async {
                setState(() {
                  isPressed_addProduct = false;
                  isLoading = true; // yükleniyor durumunu aktifleştir
                });
                // Yapılacak asenkron işlem
                await Future.delayed(const Duration(milliseconds: 700));

                Provider.of<Sepet>(context, listen: false).urunEkle(widget.urun);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(MySnackBars.yesilSnackBar(
                  baslik: 'Product added to card',
                  mesaj: 'use icon to go to cart.',
                ));
                setState(() {
                  isLoading = false; // yükleniyor durumunu kapat
                });
              },
              onPointerDown: (_) => setState(() {
                isPressed_addProduct = true;
              }),
              child: shortAnimatedContainer(isPressed_addProduct,
                  isPressed_addProduct, const Icon(Icons.add_shopping_cart)),
            ),
            if (isLoading)
              const Positioned.fill(
                child: Center(
                  child: CircularProgressIndicator(), // Yükleme çubuğu
                ),
              ),
          ],
        ),
      ),
    );
  }
}
