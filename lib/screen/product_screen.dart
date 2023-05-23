import 'package:flutter/material.dart';
import '../model/Item.dart';

class ProductScreen extends StatefulWidget{
  ProductScreen({super.key});

  _ProductScreenState createState() => _ProductScreenState();
}
class _ProductScreenState extends State<ProductScreen> {
  String title = '';
  String projectText = '';
  String selectedOption = '';
  String _selectedItem = '구로';
  List<String> projects = ['구로', '가산', '광명', '부산', '제주'];

  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context)!);
    final recvItem = ModalRoute.of(context)!.settings.arguments as Item;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
              '재고 관리',
              style: TextStyle(color: Colors.black)
          ),
          actions: [
            IconButton(
              color: Colors.black45,
              icon: Icon(Icons.done),
              onPressed: () {
                // Implement done button functionality
              },
            ),
            IconButton(
              color: Colors.black45,
              icon: Icon(Icons.delete),
              onPressed: () {
                // Implement delete button functionality
              },
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: null,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Icon(Icons.camera_enhance),
                        SizedBox(height: 20,),
                        Text("camera")
                      ],
                    ),
                  ),
              ),
              SizedBox(height: 30.0),
              Text(
                '품명',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                initialValue: recvItem == null ? '${recvItem.product}' : '',
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Text(
                '규격',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                initialValue: recvItem == null ? '${recvItem.specific}' : '',
                onChanged: (value) {
                  setState(() {
                    projectText = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Text(
                '갯수',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                initialValue: recvItem == null ? '${recvItem.count}' : '',
                onChanged: (value) {
                  setState(() {
                    projectText = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Text(
                '프로젝트',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              DropdownButton<String>(
                value: _selectedItem,
                onChanged: (newValue) {
                  setState(() {
                    _selectedItem = newValue!;
                  });
                },
                items: projects.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
