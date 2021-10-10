import 'package:flutter/material.dart';
import 'package:flutter_application_2/page/person.dart';
import 'package:flutter_application_2/page/user.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int indexnumber = 0;
  List<Widget> page = [
    Person(),
    Userpage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Prsone',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_saver_on),
            label: 'Data',
          ),
        ],
        currentIndex: indexnumber,
        onTap: (index) {
          setState(() {
            indexnumber = index;
          });
        },
      ),
      body: page[indexnumber],
    );
  }
}
