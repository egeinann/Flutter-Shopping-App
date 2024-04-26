import 'package:alisveris_provider_uyg/StateManagement/urun_kart_widgeti.dart';
import 'package:flutter/foundation.dart';

// provider sayesinde urunlerSayfasi 'ndan seçilen ürünleri içerideki _sepetUrunleri listesine ekleniyor
// ürün ekleme ve çıkarma işlemleri providerin içinde :)
class Sepet with ChangeNotifier {
  final List<Urun> _sepetUrunleri = []; // sepetimiz liste
  List<Urun> get sepetUrunleri => _sepetUrunleri;
  late final Urun urun;
  // sepete ürün ekleme fonksiyonu
  void urunEkle(Urun urun) {
    if (urun.urunCount == 0) {
      urun.urunCount++;
      _sepetUrunleri.add(urun);
    } else {
      urun.urunCount++;
    }
    notifyListeners();
  }

  // sepetten ürün çıkarma fonksiyonu
  void urunCikar(Urun urun) {
    // ürün çıkarma işlemi
    _sepetUrunleri.remove(urun);
    urun.urunCount = 0;
    notifyListeners();
  }

  // Toplam fiyatı hesaplayan fonksiyon
  double toplamFiyatiHesapla() {
    double toplamFiyat = 0;
    for (var urun in _sepetUrunleri) {
      toplamFiyat += urun.urunFiyat *
          urun.urunCount; // toplam fiyatı, ürünfiyat çarpı adet ile hesapladık
    }
    return toplamFiyat;
  }
  
  // sepet içindeki tüm ürünleri temizler
  void tumUrunleriSil() {
    _sepetUrunleri.clear();
  }
}
