import 'package:flutter/material.dart';
import 'package:flutter_app/Home/Detail/ItemDetail.dart';
import 'package:flutter_app/Home/HomeController.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _home();
}

class _home extends State<Home> {
  bool ispressed = false;
  int? selectedindex;
  var controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Container(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
              itemCount: controller.userlist.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                      title: Text("Name: " + controller.userlist[index].login),
                      subtitle:
                          Text("Node id: " + controller.userlist[index].nodeId),
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(controller.userlist[index].avatarUrl),
                        radius: 40,
                      ),
                      trailing: IconButton(
                        color: (selectedindex == index)
                            ? ((ispressed) ? Colors.orange : Colors.grey)
                            : null,
                        icon: const Icon(Icons.star_outlined, size: 20.0),
                        onPressed: () {
                          /* setState(() {
                                selectedindex = index;
                                if (ispressed) {
                                  ispressed = false;
                                } else {
                                  ispressed = true;
                                }
                              });*/
                        },
                      ),
                      onTap: () {
                      Get.to(ItemDetail(),arguments: controller.userlist[index]);
                      }),
                );
              });
        }),
      ),
    ));
  }
}
