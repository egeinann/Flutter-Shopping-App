import 'package:alisveris_provider_uyg/customs/animatedContainer_button.dart';
import 'package:alisveris_provider_uyg/customs/custom_snackBar.dart';
import 'package:alisveris_provider_uyg/customs/metin_stilleri.dart';
import 'package:alisveris_provider_uyg/customs/renkler.dart';
import 'package:alisveris_provider_uyg/StateManagement/provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class SepetSayfasi extends StatefulWidget {
  const SepetSayfasi({super.key});

  @override
  State<SepetSayfasi> createState() => _SepetSayfasiState();
}

class _SepetSayfasiState extends State<SepetSayfasi> {
  // button animated bools
  bool isPressed_backProducts = false; // geri dön tuşu ispressed
  bool isPressed_delete = false; // hepsini sil button
  bool isPressed_payment = false; // ödeme sayfasına git tuşu ispressed

  @override
  Widget build(BuildContext context) {
    var sepet = Provider.of<Sepet>(context); // providerdan bilgi alma işlemi
    return Scaffold(
      backgroundColor: CustomRenkler.siyahRenk,
      body: SafeArea(
        child: Stack(
          children: [
            renkliContainer(),
            Column(
              children: [
                // TOP EXPANDED İLERİ GERİ SAYFALAR BUTTONLARI İÇİN AYRILMIŞ ALAN
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // GERİ DÖN BUTTON
                        Listener(
                          onPointerUp: (_) => setState(() {
                            isPressed_backProducts = false;
                            Navigator.pushNamed(context, "/ikinciSayfa");
                            ScaffoldMessenger.of(context)
                                .hideCurrentSnackBar(); // eğer snackBar aktif ise kapat
                          }),
                          onPointerDown: (_) => setState(() {
                            isPressed_backProducts = true;
                          }),
                          child: shortAnimatedContainer(
                            isPressed_backProducts,
                            isPressed_backProducts,
                            const Icon(Icons.arrow_back_rounded),
                          ),
                        ),
                        // DELETE BUTTON
                        Listener(
                          onPointerUp: (_) => setState(() {
                            isPressed_delete = false;
                            if (!sepet.sepetUrunleri.isEmpty) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      'DELETE',
                                      style: kucukMetinStilleri(
                                          CustomRenkler.maviGriRenk, "Reddit"),
                                    ),
                                    content: Text(
                                      'Are you sure you want to delete?',
                                      style: kucukMetinStilleri(
                                          CustomRenkler.maviGriRenk, "Reddit"),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            sepet
                                                .tumUrunleriSil(); // tüm ürünleri sil
                                            Navigator.of(context)
                                                .pop(); // dialog penceresini kapat
                                          });
                                        },
                                        child: Text(
                                          'Delete',
                                          style: kucukMetinStilleri(
                                              const Color.fromARGB(
                                                  255, 255, 0, 0),
                                              "Reddit"),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          // NULL ÇÜNKÜ CANCEL BUTTON
                                          Navigator.of(context)
                                              .pop(); // Dialog penceresini kapat
                                        },
                                        child: Text(
                                          'Cancel',
                                          style: kucukMetinStilleri(
                                              CustomRenkler.maviGriRenk,
                                              "Reddit"),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {}
                          }),
                          onPointerDown: (_) => setState(() {
                            isPressed_delete = true;
                          }),
                          child: shortAnimatedContainer(
                            isPressed_delete,
                            isPressed_delete,
                            Center(
                                child: Icon(
                              Icons.delete,
                              color: const Color.fromARGB(255, 245, 16, 0),
                              size: 35,
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // MID EXPANDED SEPETTEKİ ÜRÜNLERİ SIRALA
                Expanded(
                  flex: 7,
                  child: ListView.builder(
                    itemCount: sepet.sepetUrunleri.length,
                    itemBuilder: (context, index) {
                      var urun = sepet.sepetUrunleri[index];
                      return ListTile(
                        leading: Image.asset(
                          urun.assetImage,
                          width: 50,
                          height: 50,
                        ),
                        title: Text(
                          urun.urunAd,
                          style:
                              metinStilleri(CustomRenkler.siyahRenk, "Roboto"),
                        ),
                        subtitle: Text(
                          '\$${urun.urunFiyat.toStringAsFixed(2)}',
                          style: kucukMetinStilleri(
                              CustomRenkler.griRenk, "Reddit"),
                        ),
                        trailing: Container(
                          width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // SAYAÇ EXPANDED
                              Expanded(
                                flex: 2,
                                child: Container(
                                  width: double.infinity,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: CustomRenkler.maviGriRenk,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${urun.urunCount}",
                                      style: kucukMetinStilleri(
                                          CustomRenkler.beyazRenk, "Roboto"),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              // ARTTIR AZALT EXPANDED
                              Expanded(
                                flex: 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // ARTI TUŞU EXPANDED
                                    Expanded(
                                      child: OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          padding: const EdgeInsets.all(0),
                                          side: const BorderSide(
                                              width: 2,
                                              color: CustomRenkler.maviGriRenk),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            urun.urunCount++;
                                          });
                                        },
                                        child: const Icon(
                                          Icons.add,
                                          size: 25,
                                          color: CustomRenkler.maviGriRenk,
                                        ),
                                      ),
                                    ),
                                    // EKSİ TUŞU EXPANDED
                                    Expanded(
                                      child: OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          padding: const EdgeInsets.all(0),
                                          side: const BorderSide(
                                              width: 2,
                                              color: CustomRenkler.maviGriRenk),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            if (urun.urunCount != 1) {
                                              urun.urunCount--;
                                            } else {
                                              sepet.urunCikar(urun);
                                              ScaffoldMessenger.of(context)
                                                  .hideCurrentSnackBar();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                      MySnackBars.sariSnackBar(
                                                baslik: 'Product removed.',
                                                mesaj: '',
                                              ));
                                            }
                                          });
                                        },
                                        child: const Icon(
                                          Icons.remove,
                                          size: 25,
                                          color: CustomRenkler.maviGriRenk,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              // ÜRÜN ÇIKAR BUTTON EXPANDED
                              Expanded(
                                flex: 5,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: CustomRenkler
                                        .beyazRenk, // Butonun arka plan rengi
                                    onPrimary: CustomRenkler
                                        .siyahRenk, // Buton metninin rengi
                                    elevation: 15,
                                    shape: RoundedRectangleBorder(
                                      // Butonun şekli
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                      horizontal: 12,
                                    ), // Buton içeriğinin iç boşluğu
                                  ),
                                  onPressed: () {
                                    sepet.urunCikar(urun);
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(MySnackBars.sariSnackBar(
                                      baslik: 'Product removed.',
                                      mesaj: '',
                                    ));
                                  },
                                  child: const Icon(
                                    Icons.remove_shopping_cart,
                                    size: 28,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // MID EXPANDED ÜCRET GÖSTER
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CustomRenkler.maviGriRenk,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Amount:",
                              style: metinStilleri(
                                  CustomRenkler.beyazRenk, "Reddit")),
                          Align(
                            child: Text(
                              "${sepet.toplamFiyatiHesapla().toStringAsFixed(2)} \$",
                              style: sepet.toplamFiyatiHesapla() == 0.00
                                  ? metinStilleri(Colors.grey, "Reddit")
                                  : metinStilleri(const Color.fromARGB(255, 236, 220, 0),"Reddit"),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // BOTTOM EXPANDED BUTTON
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Listener(
                      onPointerUp: (_) => setState(() {
                        isPressed_payment = false;
                        if (sepet.sepetUrunleri.isEmpty) {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context)
                              .showSnackBar(MySnackBars.sariSnackBar(
                            baslik: 'Please add product to cart !',
                            mesaj: '',
                          ));
                        } else {
                          Navigator.pushNamed(context, "/dorduncuSayfa");
                          ScaffoldMessenger.of(context)
                              .hideCurrentSnackBar(); // eğer snackBar aktif ise kapat
                        }
                      }),
                      onPointerDown: (_) => setState(() {
                        isPressed_payment = true;
                      }),
                      child: longAnimatedContainer(
                        isPressed_payment,
                        isPressed_payment,
                        // bu rowu yazdığım yer zaten bir child parametresi
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Payment",
                              style: metinStilleri(
                                  CustomRenkler.maviGriRenk, "Reddit"),
                            ),
                            const SizedBox(width: 20),
                            const Icon(
                              Icons.payment,
                              size: 30,
                              color: CustomRenkler.maviGriRenk,
                            ),
                            const Icon(
                              Icons.arrow_right_rounded,
                              size: 30,
                              color: CustomRenkler.maviGriRenk,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20)
              ],
            )
          ],
        ),
      ),
    );
  }
}
