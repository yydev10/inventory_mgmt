import 'package:flutter/material.dart';

class Item {
  final int number;
  final String product;
  final int specific;
  final int count;
  final String project;

  Item(this.number, this.product, this.specific, this.count, this.project);
}

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
              const SizedBox(
                height: 40,
              ),
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
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Container(
                      padding: EdgeInsets.all(15.0),
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
                          Text('${item.count}'),
                          Text('${item.project}'),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Plus button logic
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}

