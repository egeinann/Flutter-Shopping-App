import 'package:alisveris_provider_uyg/customs/animatedContainer_button.dart';
import 'package:alisveris_provider_uyg/customs/renkler.dart';
import 'package:alisveris_provider_uyg/StateManagement/provider.dart';
import 'package:alisveris_provider_uyg/StateManagement/urun_kart_widgeti.dart';
import 'package:alisveris_provider_uyg/StateManagement/urunler.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class UrunlerSayfasi extends StatefulWidget {
  @override
  _UrunlerSayfasiState createState() => _UrunlerSayfasiState();
}

// ÜRÜNLER LİSTESİ FARKLI BİR DOSYADA TANIMLANDI

class _UrunlerSayfasiState extends State<UrunlerSayfasi> {
  bool isPressed_goCart = false; // sepete git tuşu ispressed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomRenkler.siyahRenk,
      body: SafeArea(
        child: Stack(
          children: [
            renkliContainer(),
            Column(
              children: [
                // TOP EXPANDED TEXT VE BUTTON
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(28, 0, 0, 0),
                        child: Text(
                          "Add product to cart",
                          style:TextStyle(color: CustomRenkler.maviGriRenk,fontFamily: "Reddit",fontWeight: FontWeight.bold,fontSize: 24)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Listener(
                            onPointerUp: (_) => setState(() {
                              isPressed_goCart = false;
                              Navigator.pushNamed(context, "/ucuncuSayfa");
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar(); // eğer snackBar aktif ise kapat
                            }),
                            onPointerDown: (_) => setState(() {
                              isPressed_goCart = true;
                            }),
                            child: shortAnimatedContainer(
                              // düğme method customs/animatedContainer_button.dart
                              isPressed_goCart,
                              isPressed_goCart,
                              const Icon(Icons.shopping_basket),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // MAİN EXPANDED ÜRÜNLERİ SERGİLE
                Expanded(
                  flex: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Consumer<Sepet>(
                      builder: (context, sepet, child) {
                        return ListView.builder(
                          itemCount: urunListesi.length,
                          itemBuilder: (context, index) {
                            return UrunKarti(
                              urun: urunListesi[index],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
