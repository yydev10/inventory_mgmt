import 'package:flutter/material.dart';
import '../models/Item.dart';

class ProductScreen extends StatefulWidget{
  final String product,specific,project;
  final int count;

  const ProductScreen({
    super.key,
    required this.product,
    required this.specific,
    required this.count,
    required this.project,
  });

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
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            color: Colors.black45,
            icon:Icon(Icons.arrow_back_ios),
            onPressed: (){
              Navigator.pop(context);
            },
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
            horizontal: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '재고 관리',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
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
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              TextFormField(
                initialValue: '${widget.product}' != "" ? '${widget.product}' : '',
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Text(
                '규격',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              TextFormField(
                initialValue: '${widget.specific}' != "" ? '${widget.specific}' : '',
                onChanged: (value) {
                  setState(() {
                    projectText = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Text(
                '갯수',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              TextFormField(
                initialValue: '${widget.count}' != 0 ? '${widget.count}' : '',
                onChanged: (value) {
                  setState(() {
                    projectText = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Text(
                '프로젝트',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold
                ),
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
