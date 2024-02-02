import 'package:flutter/material.dart';
import 'package:flutter_app/Home/Home.dart';
import 'package:flutter_app/Search/Search.dart';
import 'package:flutter_app/Profile/Profile.dart';
import 'package:flutter_app/Settings/Setting.dart';
import 'package:flutter_app/Chat/UserChatList.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';


class BaseHome extends StatefulWidget {
  const BaseHome({Key? key}) : super(key: key);

  @override
  State<BaseHome> createState() => _basehome();
}

class _basehome extends State<BaseHome> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
    Text('Search', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
    Text('Chat', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
    Text('Profile', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
  ];

  static const List<String> titles=<String>["Home","Search","Chat","Profile"];




  static const List<Widget> _widgetOptions1 = <Widget> [
    const Home(),
    const Search(),
    const UsersList(),
    const Profile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: _widgetOptions.elementAt(_selectedIndex),
          backgroundColor: Colors.green,
          centerTitle: true),
      body: _widgetOptions1.elementAt(_selectedIndex),
      bottomNavigationBar: MotionTabBar (
        labels: titles,
        initialSelectedTab: "Home",
        tabIconColor: Colors.green,
        tabSelectedColor: Colors.green,
        onTabItemSelected: (int value) {
          print(value);
          setState(() {
            _selectedIndex = value;
          });
        },
        icons: [Icons.home,Icons.search,Icons.chat,Icons.person],
        textStyle: TextStyle(color: Colors.green),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Sahil'),
              accountEmail: Text('sahil@yopmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text(
                  'S',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              subtitle: Text('User'),
              onTap: () {
                Navigator.pop(context);
                _showSelectionDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Logout Alert!"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text("Are you sure you want to Logout?")
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel")),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Logout")),
              ]);
        });
  }
}
