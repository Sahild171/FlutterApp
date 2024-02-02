import 'package:flutter/material.dart';
import 'package:flutter_app/Models/User1.dart';

class ChatScreen extends StatefulWidget {
  final User1 user;

  const ChatScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String error = "";
  TextEditingController _msgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.name),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Hii'),
                    );
                  })),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: _msgController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      hintText: 'Type your Message...'),
                )),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.green),
                  onPressed: () {
                    if (_msgController.text.isNotEmpty) {

                      _msgController.clear();
                    }
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
