import 'package:get/get.dart';

class SearchController extends GetxController {

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

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }


}