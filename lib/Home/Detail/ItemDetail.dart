import 'package:flutter/material.dart';
import 'package:flutter_app/Models/UserModel.dart';
import 'package:get/get.dart';

class ItemDetail extends StatefulWidget {


  const ItemDetail({Key? key}) : super(key: key);

  @override
  State<ItemDetail> createState() => _ItemDetail();
}

class TextController extends GetxController {
  var valuereturn = "Item 1".obs;

  void updatevalues(String text) {
    valuereturn.value = text;
  }
}

class _ItemDetail extends State<ItemDetail> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(TextController());
    UserModel user = Get.arguments;
    var items = [
      'Item 1',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(user.login),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image.network(user.avatarUrl),
          SizedBox(
            height: 10,
          ),
          Text(
            "Node id: " + user.nodeId,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          DropdownButton(
            value: controller.valuereturn.value,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: items.map((String items) {
              return DropdownMenuItem(value: items, child: Text(items));
            }).toList(),
            onChanged: (String? newvalue) {
              controller.updatevalues(newvalue!);
              //   tetcontroller.valuereturn.value = newvalue;
            },
          ),
          GetX<TextController>(
            builder: (controller) => Text(
              controller.valuereturn.value,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}
