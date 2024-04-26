import 'package:flutter/material.dart';

// textfieldlar boş mu değil mi controlleri
class Kontroller {
  final TextEditingController textFieldControllerAdsoyad =
      TextEditingController();
  final TextEditingController textFieldControllerGsm = TextEditingController();
  final TextEditingController textFieldControllerAdres =
      TextEditingController();
  final TextEditingController textFieldControllerKartNo =
      TextEditingController();
  final TextEditingController textFieldControllerTarih =
      TextEditingController();
  final TextEditingController textFieldControllerCvc = TextEditingController();
// her bir text'i kontrol ediyoruz boş mu değil mi diye
  void dispose() {
    textFieldControllerAdsoyad.dispose();
    textFieldControllerGsm.dispose();
    textFieldControllerAdres.dispose();
    textFieldControllerKartNo.dispose();
    textFieldControllerTarih.dispose();
    textFieldControllerCvc.dispose();
  }
  // textField ların hepsini temizler
  void clearTextFields() {
    textFieldControllerAdsoyad.clear();
    textFieldControllerGsm.clear();
    textFieldControllerAdres.clear();
    textFieldControllerKartNo.clear();
    textFieldControllerTarih.clear();
    textFieldControllerCvc.clear();
  }
}
