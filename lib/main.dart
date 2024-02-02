import 'package:flutter/material.dart';
import 'package:flutter_app/Home/Home.dart';
import 'package:flutter_app/Home/HomeBinding.dart';
import 'package:get/get.dart';
import 'package:flutter_app/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';



// void main() => runApp(MyApp());
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      title: 'MyApplication',
      debugShowCheckedModeBanner: false,
     // getPages: [GetPage(name: '/home', page:()=> Home(),binding: HomeBinding())],
      home: const Splash(),
    );
  }

}






