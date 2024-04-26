import 'dart:ui';
import 'package:alisveris_provider_uyg/customs/animatedContainer_button.dart';
import 'package:alisveris_provider_uyg/customs/custom_snackBar.dart';
import 'package:alisveris_provider_uyg/customs/metin_stilleri.dart';
import 'package:alisveris_provider_uyg/customs/renkler.dart';
import 'package:alisveris_provider_uyg/textFields/text_fields.dart';
import 'package:flutter/material.dart';

class OdemeSayfasi extends StatefulWidget {
  const OdemeSayfasi({super.key});

  @override
  State<OdemeSayfasi> createState() => _OdemeSayfasiState();
}

class _OdemeSayfasiState extends State<OdemeSayfasi> {
  // aşağıdaki 3 kod düğmeler ile ilgili
  bool isPressed_geriDon = false;
  bool isPressed_pay = false;
  bool isPressed_security = false;
  // aşağıdaki 3 değişken blurlu kredikartı ile ilgili
  double startDragY = 0.0;
  double currentDragY = 0.0;
  double rotation = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomRenkler.siyahRenk,
      body: SafeArea(
        child: Stack(
          children: [
            renkliContainer(),
            SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height,
                ),
                child: Column(
                  children: [
                    // GERİ DÖN DÜĞME EXPANDED
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Listener(
                              onPointerUp: (_) => setState(() {
                                isPressed_geriDon = false;
                                Navigator.pushNamed(context, "/ucuncuSayfa");
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar(); // eğer snackBar aktif ise kapat
                              }),
                              onPointerDown: (_) => setState(() {
                                isPressed_geriDon = true;
                              }),
                              child: shortAnimatedContainer(
                                isPressed_geriDon,
                                isPressed_geriDon,
                                const Icon(Icons.arrow_back_rounded),
                              ),
                            ),
                            Listener(
                              onPointerUp: (_) => setState(() {
                                isPressed_security = false;
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("TO INFORM !"),
                                      content: const Text(
                                          "This application is not a licensed application. And it does not save personal information. It has no connection to any database."),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("Accept"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }),
                              onPointerDown: (_) => setState(() {
                                isPressed_security = true;
                              }),
                              child: shortAnimatedContainer(
                                isPressed_security,
                                isPressed_security,
                                const Icon(Icons.security),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // KREDİ KARTI EXPANDED***
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onVerticalDragStart: (details) {
                            startDragY = details.globalPosition.dy;
                          },
                          onVerticalDragUpdate: (details) {
                            currentDragY = details.globalPosition.dy;
                            setState(() {
                              rotation = (currentDragY - startDragY) / 100;
                            });
                          },
                          onVerticalDragEnd: (details) {
                            setState(() {
                              rotation = 0.0;
                            });
                          },
                          child: Stack(
                            children: [
                              // ARKAPLAN: KREDİ KARTI
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: CustomRenkler.siyahRenk,
                                ),
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    // ÜST SİYAH ALAN
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          color: CustomRenkler.siyahRenk,
                                        ),
                                      ),
                                    ),
                                    // ORTA BEYAZ ALAN
                                    Expanded(
                                      flex: 1,
                                      child: Stack(
                                        children: [
                                          Container(
                                            color: CustomRenkler.beyazRenk,
                                          ),
                                          TextField(
                                            textAlign: TextAlign.center,
                                            controller: kontrollerKullan
                                                .textFieldControllerKartNo,
                                            style: metinStilleri(
                                                CustomRenkler.siyahRenk,
                                                "Reddit"),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // ALT SİYAH ALAN
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Stack(
                                          children: [
                                            Row(
                                              children: [
                                                const Expanded(
                                                  flex: 3,
                                                  child: Row(
                                                    children: [
                                                      Image(
                                                        image: AssetImage(
                                                          'assets/pictures/icons8-mastercard-128.png',
                                                        ),
                                                      ),
                                                      SizedBox(width: 15),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(10),
                                                        child: Image(
                                                          image: AssetImage(
                                                            'assets/pictures/icons8-credit-card-contactless-96.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: TextField(
                                                          decoration:
                                                              const InputDecoration(
                                                                  filled: true,
                                                                  fillColor:
                                                                      CustomRenkler
                                                                          .griRenk),
                                                          controller:
                                                              kontrollerKullan
                                                                  .textFieldControllerCvc,
                                                          style:
                                                              kucukMetinStilleri(
                                                                  CustomRenkler
                                                                      .beyazRenk,
                                                                  "Reddit"),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: TextField(
                                                          controller:
                                                              kontrollerKullan
                                                                  .textFieldControllerTarih,
                                                          style:
                                                              kucukMetinStilleri(
                                                                  CustomRenkler
                                                                      .beyazRenk,
                                                                  "Reddit"),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // ÖN PLAN: DÖNEN CONTAİNER
                              Center(
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  transform: Matrix4.rotationZ(rotation),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 2, sigmaY: 8),
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        color: const Color.fromARGB(255, 124, 11, 181)
                                            .withOpacity(0.2), // Yarı saydamlık
                                        child: Center(
                                          child: rotation != 0.0
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "View",
                                                      style: metinStilleri(
                                                          CustomRenkler
                                                              .beyazRenk,
                                                          "Reddit"),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    const Icon(
                                                      Icons.remove_red_eye,
                                                      size: 40,
                                                      color: CustomRenkler
                                                          .beyazRenk,
                                                    ),
                                                  ],
                                                )
                                              : Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Drag to view",
                                                      style: metinStilleri(
                                                          CustomRenkler
                                                              .beyazRenk,
                                                          "Reddit"),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    const Icon(
                                                      Icons.swipe_up_rounded,
                                                      size: 40,
                                                      color: CustomRenkler
                                                          .beyazRenk,
                                                    ),
                                                  ],
                                                ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // TEXTFİELDS EXPANDED***
                    Expanded(
                      flex: 6,
                      child: PageView(
                        children: [
                          Container(
                            color: CustomRenkler.maviGriRenk,
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "PERSONAL INFORMATION",
                                    style: kucukMetinStilleri(
                                        CustomRenkler.beyazRenk, "Reddit"),
                                  ),
                                  // AD SOYAD TEXTFİELD
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: adSoyadTextField(),
                                    ),
                                  ),
                                  // GSM TEXTFİELD
                                  Expanded(
                                    child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: gsmTextField()),
                                  ),
                                  // ADRES TEXTFİELD
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: adresTextField(),
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "scroll",
                                          style: kucukMetinStilleri(
                                              const Color.fromARGB(
                                                  255, 138, 138, 138),
                                              "Reddit"),
                                        ),
                                        const Icon(
                                          Icons.arrow_right,
                                          size: 20,
                                          color: Color.fromARGB(
                                              255, 138, 138, 138),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            color: CustomRenkler.maviGriRenk,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    "CARD INFORMATION",
                                    style: kucukMetinStilleri(
                                      CustomRenkler.beyazRenk,
                                      "Reddit",
                                    ),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: Column(
                                      children: [
                                        kartNoTextField(),
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: tarihTextField(),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: cvcTextField(),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.arrow_left,
                                          size: 20,
                                          color: Color.fromARGB(
                                              255, 138, 138, 138),
                                        ),
                                        Text(
                                          "scroll",
                                          style: kucukMetinStilleri(
                                            const Color.fromARGB(
                                                255, 138, 138, 138),
                                            "Reddit",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // ÖDEMEYİ TAMAMLA DÜĞME EXPANDED***
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Listener(
                          onPointerUp: (_) => setState(() {
                            isPressed_pay = false;
                            // controllers boş mu diye kontrol ediyoruz (yani tüm textField'lar)
                            if (kontrollerKullan
                                    .textFieldControllerAdsoyad.text.isEmpty ||
                                kontrollerKullan
                                    .textFieldControllerGsm.text.isEmpty ||
                                kontrollerKullan
                                    .textFieldControllerAdres.text.isEmpty ||
                                kontrollerKullan
                                    .textFieldControllerKartNo.text.isEmpty ||
                                kontrollerKullan
                                    .textFieldControllerTarih.text.isEmpty ||
                                kontrollerKullan
                                    .textFieldControllerCvc.text.isEmpty) {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(MySnackBars.sariSnackBar(
                                baslik: 'Error !!!',
                                mesaj: 'Please fill in all fields.',
                              ));
                            } else {
                              // TextField doluysa
                              kontrollerKullan.clearTextFields();
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(MySnackBars.yesilSnackBar(
                                baslik: 'ORDER COMPLETED',
                                mesaj: 'Estimated delivery 30 min',
                              ));
                            }
                            FocusScope.of(context).unfocus();
                          }),
                          onPointerDown: (_) => setState(() {
                            isPressed_pay = true;
                          }),
                          child: longAnimatedContainer(
                            isPressed_pay,
                            isPressed_pay,
                            Center(
                              child: Text(
                                "Complete the order",
                                style: metinStilleri(
                                    CustomRenkler.maviGriRenk, "Reddit"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
