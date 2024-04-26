import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class MySnackBars {
  static SnackBar yesilSnackBar({required String baslik, required String mesaj}) {
    return SnackBar(
      duration: const Duration(seconds: 2),
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: baslik,
        message: mesaj,
        contentType: ContentType.success,
      ),
    );
  }

  static SnackBar sariSnackBar({required String baslik, required String mesaj}) {
    return SnackBar(
      duration: const Duration(seconds: 2),
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: baslik,
        message: mesaj,
        contentType: ContentType.warning,
      ),
    );
  }
}

/* çağarmak için ilgili yerde bunu kullanıcam
ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(MySnackBars.yesilSnackBar(
              baslik: '',
              mesaj: '',
            ));
 */