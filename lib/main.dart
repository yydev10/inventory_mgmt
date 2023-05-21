import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/widgets.dart';
import 'package:inventory_mgmt/screen/home_screen.dart';
import 'package:inventory_mgmt/screen/search_screen.dart';
import 'package:inventory_mgmt/widget/Bottom.dart';
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
  late TabController controller;
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 28),
        minimumSize: Size(200, 80));

    return MaterialApp(
        title : '재고 관리',
        home: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Icon(
                          Icons.settings,
                          size: 30,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 80),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.inventory,
                      size:100,
                      color:Colors.green,
                    ),
                    SizedBox(height: 50),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:ElevatedButton(
                        style: style,
                        onPressed: null,
                        child: const Text('공장'),
                      ),
                    ),
                    SizedBox(height: 30),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ElevatedButton(
                        style: style,
                        onPressed: null,
                        child: const Text('사무실'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}