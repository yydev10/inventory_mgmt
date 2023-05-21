import 'package:flutter/material.dart';

class Bottom extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        height: 50,
        child: TabBar(
          labelColor : Colors.blue,
          unselectedLabelColor: Colors.lightBlueAccent,
          tabs: <Widget>[
            Tab(
              icon: Icon(
                Icons.home,
                size:18,
              ),
              child: Text(
                '홈',
                style: TextStyle(fontSize: 9),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.search,
                size:18,
              ),
              child: Text(
                '검색',
                style: TextStyle(fontSize: 9),
              ),
            )
          ],

        ),
      ),
    );
  }
}