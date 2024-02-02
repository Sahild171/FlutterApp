import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _settings();
}

class _settings extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Get.back()
            // Navigator.of(context).pop(),
            ),
        title: Text('Settings'),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Container(
        child: Column(children: [
          Image.asset("assets/images/banner.jpeg",
              width: 600, height: 200, fit: BoxFit.cover),
          titleSection,
          buttonsSection(context),
          textSection
        ]),
      ),
    );
  }
}

Widget titleSection = Container(
  padding: EdgeInsets.all(20.0),
  child: Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.only(bottom: 8.0),
                child: const Text('Oeschinen Lake Campground',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black))),
            Container(
                child: const Text('Kandersteg, Switzerland',
                    style: TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.black26)))
          ],
        ),
      ),
      Icon(Icons.star, color: Colors.orange[400]),
      const Text('41'),
    ],
  ),
);

Row buttonsSection(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      InkWell(
          onTap: () {
           //  _showToast(context, 'CALL');
            _bottomSheet(context);
          },
          child: _builButtonColumn(Colors.cyan, Icons.phone, "CALL")),
      InkWell(
        onTap: () {
          //  _showToast(context, 'ROUTE');
          _bottomSheet(context);
        },
        child: _builButtonColumn(Colors.cyan, Icons.near_me, "ROUTE"),
      ),
      InkWell(
          onTap: () {
            //     _showToast(context, 'SHARE');
            _bottomSheet(context);
          },
          child: _builButtonColumn(Colors.cyan, Icons.share, "SHARE"))
    ],
  );
}

Column _builButtonColumn(Color colors, IconData icons, String text) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icons, color: colors),
      Container(
        padding: EdgeInsets.only(top: 8.0),
        child: Text(text, style: TextStyle(color: colors)),
      ),
    ],
  );
}

Widget textSection = Container(
  padding: EdgeInsets.all(20.0),
  child: const Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
    'Alps. Situated 1,578 meters above sea level, it is one of the '
    'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
    'half-hour walk through pastures and pine forest, leads you to the '
    'lake, which warms to 20 degrees Celsius in the summer. Activities '
    'enjoyed here include rowing, and riding the summer toboggan run.',
    style: TextStyle(fontSize: 15.0),
  ),
);

void _showToast(BuildContext context, String text) {
  SnackBar snackBar = SnackBar(
    content: Text(text),
    action: SnackBarAction(
      label: "OK",
      onPressed: () {
        _bottomSheet(context);
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}


void _bottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.green[400],
          child: Center(
            child: Text(
              'BottomSheet',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      });
}
