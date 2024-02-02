import 'package:flutter/material.dart';
import 'package:flutter_app/Auth/Login.dart';
import 'package:flutter_app/Home/BaseHome.dart';
import 'package:flutter_app/SharedPrefrence/Prefrences.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _splash();
}

class _splash extends State<Splash> {
  void initState() {
    super.initState();

    final prefs = new Prefrences();

    if (prefs.getUserId() == null) {
      new Future.delayed(const Duration(seconds: 3), () => Get.to(Login()));
    } else {
      new Future.delayed(const Duration(seconds: 3), () => Get.to(BaseHome()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Splash Screen',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
