import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:snapy/firebase_options.dart';
import 'package:snapy/src/controllers/authController.dart';
import 'package:snapy/src/pages/auth/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:snapy/src/pages/homepage/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthController());
  runApp(MyApp());
}


ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme(
    primary: Colors.blue, // 주 색상
    // primaryVariant: Colors.blue[700], // 주 색상의 변형
    secondary: Colors.grey.shade700, // 보조 색상
    // secondaryVariant: Colors.grey[600], // 보조 색상의 변형
    surface: Colors.black, // 표면 색상
    background: Color.fromARGB(255, 23, 22, 22), // 배경색
    error: Colors.red, // 오류 메시지 색상
    onPrimary: Colors.black, // 주 색상 위의 텍스트 색상
    onSecondary: Colors.black, // 보조 색상 위의 텍스트 색상
    onSurface: Colors.white, // 표면 위의 텍스트 색상
    onBackground: Colors.white, // 배경 위의 텍스트 색상
    onError: Colors.white, // 오류 색상 위의 텍스트 색상
    brightness: Brightness.light, // 전체적인 밝기 (light/dark)
  ),
  // 나머지 ThemeData 설정...
);

class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: Obx(() {
        return Get.find<AuthController>().user != null ? HomePage() : LoginPage();
      }),
    );
  }
}
