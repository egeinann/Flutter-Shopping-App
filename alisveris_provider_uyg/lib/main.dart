import 'package:alisveris_provider_uyg/screens/efektSayfasi.dart';
import 'package:alisveris_provider_uyg/StateManagement/provider.dart';
import 'package:alisveris_provider_uyg/screens/acilis_sayfasi.dart';
import 'package:alisveris_provider_uyg/screens/odeme_sayfasi.dart';
import 'package:alisveris_provider_uyg/screens/sepet_sayfasi.dart';
import 'package:alisveris_provider_uyg/screens/urunler_sayfasi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Sepet(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/gosterimSayfasi",
      routes: {
        "/gosterimSayfasi": (context) => const SplashScreen(),
        "/ilkSayfa": (context) => AcilisSayfasi(),
        "/ikinciSayfa": (context) => UrunlerSayfasi(),
        "/ucuncuSayfa": (context) => const SepetSayfasi(),
        "/dorduncuSayfa": (context) => const OdemeSayfasi(),
      },
    );
  }
}
