import 'package:alisveris_provider_uyg/controllers/controllers.dart';

import 'package:alisveris_provider_uyg/customs/renkler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final Kontroller kontrollerKullan = Kontroller();

// AD SOYAD TEXT FİELD
TextField adSoyadTextField() {
  return TextField(
    controller:
        kontrollerKullan.textFieldControllerAdsoyad, // CONTROLLERİ ÇAĞARDIK
    maxLength: 25,
    style: const TextStyle(color: Colors.white), // Yazı rengi beyaz
    decoration: const InputDecoration(
      hintText: 'Name Surname',
      hintStyle: TextStyle(
        color: Color.fromARGB(255, 138, 138, 138),
      ), // Hint yazısı rengi beyaz
    ),
  );
}


// GSM TEXT FİELD
TextField gsmTextField() {
  return TextField(
    controller: kontrollerKullan.textFieldControllerGsm, // CONTROLLERİ ÇAĞARDIK
    keyboardType: TextInputType.phone,
    maxLength: 10,
    style: const TextStyle(
      color: Colors.white,
    ),
    decoration: const InputDecoration(
      hintText: 'GSM (XXX)(XXX-XXXX)',
      hintStyle: TextStyle(
        color: Color.fromARGB(255, 138, 138, 138),
      ), // Hint yazısı rengi beyaz
    ),
  );
}


// ADRES TEXT FİELD
TextField adresTextField() {
  return TextField(
    controller:
        kontrollerKullan.textFieldControllerAdres, // CONTROLLERİ ÇAĞARDIK
    style: const TextStyle(color: CustomRenkler.beyazRenk), // Yazı rengi beyaz
    decoration: const InputDecoration(
      hintText: 'Address',
      hintStyle: TextStyle(
        color: Color.fromARGB(255, 138, 138, 138),
      ), // Hint yazısı rengi beyaz
    ),
  );
}


// KART NO TEXT FİELD
TextFormField kartNoTextField() {
  return TextFormField(
    controller: kontrollerKullan.textFieldControllerKartNo, // CONTROLLERİ ÇAĞARDIK
    keyboardType: TextInputType.number, // Klavyenin sayı girişini tetiklemesi için
    maxLength: 19, // Maksimum giriş uzunluğu 19 karakter (boşluklar dahil)
    style: const TextStyle(
      color: Colors.white, // Metin rengi beyaz olarak ayarlandı
    ),
    inputFormatters: [
      FilteringTextInputFormatter.digitsOnly,
      _KartNoFormatter(),
    ],
    obscureText: true, // Girilen metni gizlemek için
    decoration: const InputDecoration(
      hintText: 'Card number', // Boş iken gösterilecek metin
      hintStyle: TextStyle(
        color: Color.fromARGB(255, 138, 138, 138), // İpucu yazısı rengi belirlendi
      ), // Hint yazısı rengi beyaz
    ),
  );
}
class _KartNoFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String formatted = newValue.text.replaceAllMapped(
      RegExp(r'(\d{4})(?=\d)'),
      (Match match) => '${match[0]} ',
    );
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}


// TARİH TEXT FİELD
TextField tarihTextField() {
  return TextField(
    style: const TextStyle(
      color: Colors.white,
    ),
    controller: kontrollerKullan.textFieldControllerTarih,
    decoration: const InputDecoration(
      hintText: 'Date (e.g. 04/24)',
      hintStyle: TextStyle(
        color: Color.fromARGB(255, 138, 138, 138),
      ),
    ),
    keyboardType: TextInputType.number,
    maxLength: 5, // Örn. "12/34" formatında 5 karakter
    onChanged: (text) {
      if (text.length == 2) {
        kontrollerKullan.textFieldControllerTarih.text = text + "/"; // Cursor'ı metin sonuna taşı
      }
    },
  );
}


// CVC TEXT FİELD
TextField cvcTextField() {
  return TextField(
    controller: kontrollerKullan.textFieldControllerCvc, // CONTROLLERİ ÇAĞARDIK
    keyboardType: TextInputType.number,
    maxLength: 3,
    obscureText: true, // Girilen metni gizlemek için
    style: const TextStyle(
      color: Colors.white,
    ),
    decoration: const InputDecoration(
      hintText: 'CVV',
      hintStyle: TextStyle(
        color: Color.fromARGB(255, 138, 138, 138),
      ), // Hint yazısı rengi beyaz
    ),
  );
}
