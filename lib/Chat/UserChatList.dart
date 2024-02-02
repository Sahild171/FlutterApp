import 'package:flutter/material.dart';
import 'package:flutter_app/Chat/ChatScreen.dart';
import 'package:flutter_app/Models/User1.dart';

class UsersList extends StatefulWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  List<User1> userslist = [
    User1(
        email: "test1@yopmail.com",
        name: "Test one",
        uid: "E9QAfgRkWNOWraG8GjACoUSxP1d2"),
    User1(
        email: "test2@yopmail.com",
        name: "Test two",
        uid: "XpSmrDHasmgllVaTWXIX1XYrosm1"),
    User1(
        email: "sunil@yopmail.com",
        name: "Sunil",
        uid: "kaQp5RbcmlWnZMyGmOIzthAwUg52")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: new ListView.builder(
            itemCount: userslist.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                    title:
                        Text(userslist[index].name, textAlign: TextAlign.start),
                    subtitle:
                        Text(userslist[index].email, textAlign: TextAlign.start),
                    leading: CircleAvatar(backgroundColor: Colors.green[200]),
                    trailing: IconButton(
                      color: Colors.green[200],
                      icon: const Icon(
                        Icons.star_outlined,
                        size: 20.0,
                      ),
                      onPressed: () {},
                    ),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChatScreen(
                        user: userslist[index]
                      )));
                }
                ),
              );
            }),
      ),
    );
  }
}

