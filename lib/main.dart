import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:inventory_mgmt/screen/main_screen.dart';
import 'package:inventory_mgmt/screen/product_screen.dart';
import 'package:inventory_mgmt/screen/start_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : '재고 관리',
      home : StartScreen(),
      routes: {
        '/main':(context) => MainScreen(),
        '/product' : (context) => ProductScreen(),
      },
    );
  }
}