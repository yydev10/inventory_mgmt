import 'package:flutter/material.dart';
import 'package:inventory_mgmt/models/Project.dart';

class SettingProjectScreen extends StatefulWidget {
  const SettingProjectScreen({Key? key}) : super(key: key);

  @override
  State<SettingProjectScreen> createState() => _SettingProjectScreenState();
}

class _SettingProjectScreenState extends State<SettingProjectScreen> {
  final List<Project> projectItems = [
    Project("공장", "구로"),
    Project("공장", "광명"),
    Project("공장", "대전"),
  ];

  TextEditingController _nameController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _openDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('프로젝트 정보 저장'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: '프로젝트명'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _locationController,
                decoration: InputDecoration(labelText: '위치'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                _nameController.clear();
                _locationController.clear();
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Save button logic
                String name = _nameController.text;
                String location = _locationController.text;

                Project newProject = Project(name,location);
                setState(() {
                  projectItems.add(newProject); // Add the new item to the list
                });

                _nameController.clear();
                _locationController.clear();
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: ListView.builder(
            itemCount: projectItems.length,
            itemBuilder: (context, index){
              final item = projectItems[index];
              return Column(
                children: [
                  ListTile(
                    title: Text('${item.location} - ${item.name}'),
                    onTap: () {
                      // Item click logic
                      String selectedItem = '${item}';
                      print('Selected item: $selectedItem');
                    },
                  ),
                  Divider(),
                ],
              );
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _openDialog(context);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
