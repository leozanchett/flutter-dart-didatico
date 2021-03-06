import 'package:apicomgetx/https/request.dart';
import 'package:apicomgetx/https/url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailTextController;
  TextEditingController passwordTextController;

  @override
  void onInit() {
    emailTextController = TextEditingController(text: 'leo@gmail.com');
    passwordTextController = TextEditingController(text: '123');
    super.onInit();
  }

  void apiLogin() async {
    Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);
    Requests request = Requests(
      url: urlLogin,
      body: {
        'email': emailTextController.text,
        'password': passwordTextController.text,
      },
    );
    request.post().then((value) {
      Get.back();
      Get.offNamed(
        '/homeView',
        arguments: value,
      );
    }).catchError((onError) {});
  }

  @override
  void onClose() {
    emailTextController?.dispose();
    passwordTextController?.dispose();
    super.onClose();
  }
}
