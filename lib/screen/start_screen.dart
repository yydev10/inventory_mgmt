import 'package:flutter/material.dart';
import 'package:inventory_mgmt/screen/setting_screen.dart';
import 'package:inventory_mgmt/screen/main_screen.dart';

class StartScreen extends StatefulWidget{
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>{
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
                    GestureDetector(
                      onTap: () {
                        // Perform page navigation here
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SettingScreen()),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Icon(
                            Icons.settings,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
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
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => MainScreen(type: '공장')
                              )
                          );
                        },
                        child: const Text('공장'),
                      ),
                    ),
                    SizedBox(height: 30),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ElevatedButton(
                        style: style,
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => MainScreen(type: '사무실',))
                          );
                        },
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