import 'package:get/get.dart';


class MyController extends GetxController{

  var list = <String>[].obs;

  void additems(String text){
    list.add(text);
  }

  void removeitems(int index){
    list.removeAt(index);
  }

  void insertitemAfterDelete(int index,String text){
    list.insert(index, text);
  }


}