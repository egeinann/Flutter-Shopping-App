import 'package:alisveris_provider_uyg/customs/metin_stilleri.dart';
import 'package:alisveris_provider_uyg/customs/renkler.dart';
import 'package:flutter/material.dart';

class AcilisSayfasi extends StatefulWidget {
  @override
  State<AcilisSayfasi> createState() => _AcilisSayfasiState();
}

class _AcilisSayfasiState extends State<AcilisSayfasi> {
  bool selected = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomRenkler.beyazRenk,
      body: SafeArea(
        child: Stack(
          children: [
            renkliContainer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // TOP IMAGE
                Image.asset("assets/pictures/icons8-express-shopping-64.png"),
                // MID TEXT 
                Center(
                  child: Text(
                    "   Shopping application\nusing State Management\n             (Provider)",
                    style: metinStilleri(CustomRenkler.maviGriRenk, "Roboto"),
                  ),
                ),
                // BOTTOM GO SHOPPING BUTTON ***
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = !selected;
                      // Süre dolduğunda ikinci sayfaya geçiş
                      if (selected) {
                        Future.delayed(const Duration(milliseconds: 1600), () {
                          Navigator.pushNamed(context, "/ikinciSayfa");
                        });
                      }
                    });
                  },
                  child: Center(
                    child: AnimatedContainer(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: selected
                            ? CustomRenkler.beyazRenk
                            : CustomRenkler.maviGriRenk,
                      ),
                      duration: const Duration(milliseconds: 1500),
                      width: selected ? 380.0 : 300.0,
                      height: selected ? 130.0 : 300.0,
                      alignment: selected
                          ? Alignment.center
                          : AlignmentDirectional.topCenter,
                      curve: Curves.fastOutSlowIn,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: !selected,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: CustomRenkler.beyazRenk,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "GO SHOPPING",
                                  style: metinStilleri(
                                      CustomRenkler.siyahRenk, "Roboto"),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: selected,
                            child: Text(
                              "READY",
                              style: metinStilleri(
                                  CustomRenkler.maviGriRenk, "Reddit"),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Icon(
                            selected
                                ? Icons.done_outline_sharp
                                : Icons.touch_app_sharp,
                            color: selected
                                ? CustomRenkler.maviGriRenk
                                : CustomRenkler.beyazRenk,
                            size: 70,
                          ),
                          Visibility(
                            visible: !selected,
                            child: Text(
                              "Touch the screen",
                              style: kucukMetinStilleri(
                                  CustomRenkler.beyazRenk, "Reddit"),
                            ),
                          ),
                        ],
                      ),
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
