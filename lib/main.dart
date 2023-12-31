import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'controllers/match_list_controller.dart';
import 'package:get/get.dart';
import 'screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Module 16 Assignment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const MyHomePage(),
      initialBinding: ControllerBindings(),
    );
  }
}

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MatchListController());
  }

}
