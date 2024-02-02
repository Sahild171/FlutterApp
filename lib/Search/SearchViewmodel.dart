import 'package:flutter/material.dart';


class Searchviewmodel extends ChangeNotifier {

  var items = <String>[];

  void additems(String text){
    items.add(text);
    notifyListeners();
  }

  void removeitems(int index){
    items.removeAt(index);
    notifyListeners();
  }

  void insertitemAfterDelete(int index,String text){
    items.insert(index, text);
    notifyListeners();
  }
}