import 'package:flutter/material.dart';
import 'package:inventory_mgmt/screen/product_screen.dart';

import '../model/Item.dart';

class MainScreen extends StatefulWidget{
  _MainScreenState createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final String receivedData =
    ModalRoute.of(context)!.settings.arguments as String;

    final List<Item> items = [
      Item(1, '케이블', 15, 3,'프로젝트1'),
      Item(2, '케이블', 15, 3,'프로젝트1'),
      Item(3, '케이블', 15, 3,'프로젝트1'),
      Item(4, '케이블', 15, 3,'프로젝트1'),
      Item(5, '케이블', 15, 3,'프로젝트1'),
      Item(1, '케이블', 15, 3,'프로젝트1'),
      Item(2, '케이블', 15, 3,'프로젝트1'),
      Item(3, '케이블', 15, 3,'프로젝트1'),
      Item(4, '케이블', 15, 3,'프로젝트1'),
      Item(5, '케이블', 15, 3,'프로젝트1'),
      Item(1, '케이블', 15, 3,'프로젝트1'),
      Item(2, '케이블', 15, 3,'프로젝트1'),
      Item(3, '케이블', 15, 3,'프로젝트1'),
      Item(4, '케이블', 15, 3,'프로젝트1'),
      Item(5, '케이블', 15, 3,'프로젝트1'),
      Item(1, '케이블', 15, 3,'프로젝트1'),
      Item(2, '케이블', 15, 3,'프로젝트1'),
      Item(3, '케이블', 15, 3,'프로젝트1'),
      Item(4, '케이블', 15, 3,'프로젝트1'),
      Item(5, '케이블', 15, 3,'프로젝트1'),
    ];

    return MaterialApp(
      title: '재고관리 앱',
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
            children: [
              SizedBox(height: 60),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                  children: <Widget>[
                    Expanded(child: Text('No', style:  TextStyle(height: 3.0, fontSize: 16, fontWeight: FontWeight.bold,))),
                    Expanded(child: Text('품명', style:  TextStyle(height: 3.0, fontSize: 16, fontWeight: FontWeight.bold,))),
                    Expanded(child: Text('규격', style:  TextStyle(height: 3.0, fontSize: 16, fontWeight: FontWeight.bold,))),
                    Expanded(child: Text('갯수', style:  TextStyle(height: 3.0, fontSize: 16, fontWeight: FontWeight.bold,))),
                    Expanded(child: Text('프로젝트', style:  TextStyle(height: 3.0, fontSize: 16, fontWeight: FontWeight.bold,))),
                  ]
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 0),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return GestureDetector(
                      onTap:(){
                        Navigator.pushNamed(context, '/product', arguments: item);
                      },
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${item.number}'),
                            Text('${item.product}'),
                            Text('${item.specific}'),
                            Container(
                              width: 30,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: '${item.count}',
                                  isDense: true,
                                ),
                              ),
                            ),
                            Text('${item.project}'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}

