import 'package:flutter/material.dart';
import 'package:flutter_app/Search/MyController.dart';
import 'package:get/get.dart';


class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _search();
}

class TextController extends GetxController {
  final textEditController=TextEditingController();
}

class _search extends State<Search> {
  TextController _texteditcontroller = new TextController();
  var myController=Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onSubmitted: (value) {
                        //  filterbysearch(value);
                      },
                      controller: _texteditcontroller.textEditController,
                      decoration: InputDecoration(
                          hintText: "Add value",
                          prefixIcon: Icon(Icons.add),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)))),
                    ),
                  ),
                  Container(
                    width: 120.0,
                    margin: EdgeInsets.fromLTRB(15, 10, 5, 10),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {
                        buttonclick();
                      },
                      child: Text(
                        "Add",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: GetX<MyController>(
                  builder: (myController) => ListView.builder(
                    itemCount: myController.list.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.green[200]),
                        child: ListTile(
                            onTap: () {
                              showAlertDialog(context, index);
                            },
                            trailing: Container(
                              padding: EdgeInsets.all(20.0),
                              child: Icon(Icons.delete_forever),
                            ),
                            title: Container(
                              child: Text(myController.list.length > 0 ? myController.list[index] : ""),
                            )),
                      );
                    }))
            )
          ],
        ),
      ),
    );
  }

  void buttonclick() {
      if (_texteditcontroller.textEditController.text.isNotEmpty) {
        myController.additems(_texteditcontroller.textEditController.text);
        _texteditcontroller.textEditController.clear();

        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      } else {
        //  Fluttertoast.showToast(
        //     msg: "Please Enter some value",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.green,
        //     textColor: Colors.white,
        //     fontSize: 16.0
        // );
      }

  }

  void filterbysearch(String value) {
      myController.additems(value);
      _texteditcontroller.textEditController.clear();

  }

  void deleteitems(int index) {
    showSnackBar(context, index);
    myController.removeitems(index);
  }

  showAlertDialog(BuildContext context, int index) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {
        Navigator.pop(context);

        deleteitems(index);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text("Are you Sure you want to delete item"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void showSnackBar(BuildContext context, int index) {
    var deletedRecord = myController.list[index];

    SnackBar snackBar = SnackBar(
      content: Text('Deleted Item: $deletedRecord'),
      action: SnackBarAction(
        label: "UNDO",
        onPressed: () {
            myController.insertitemAfterDelete(index, deletedRecord);
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}


