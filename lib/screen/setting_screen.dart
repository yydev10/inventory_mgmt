import 'package:flutter/material.dart';
import 'package:inventory_mgmt/screen/setting_project_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  List<String> settingList = [
    '프로젝트 설정',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            Text(
              '설정',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            Divider(color: Colors.grey,),
            Expanded(
              child: ListView.separated(
                  padding: EdgeInsets.only(top: 0),
                  itemCount: settingList.length,
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.grey,
                  ),
                  itemBuilder: (context,index){
                    return ListTile(
                      title: Text(settingList[index]),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SettingProjectScreen(),
                          ),
                        );
                      },
                    );
                }),
            )
          ],
        ),
      ),
    );
  }
}
