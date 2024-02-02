import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class Profile extends StatefulWidget {
  const Profile({Key ? key}): super(key: key);

  @override
  State<Profile> createState() => _profile();
}


class _profile extends State<Profile> {
    File? imageFile;
    @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 20.0),
          child: Column(
           children:<Widget> [
            GestureDetector(
              onTap: () {_showSelectionDialog(context);},
              child: CircleAvatar(
                radius: 100.0,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 100.0,
                  child: ClipOval(
                   child: (imageFile != null)
                       ? Image.file(imageFile!)
                       : Image.asset('assets/images/edit.png')
                  )
              ),
            ),
            ),
          ],

        )
        ),
      )
    );
  }

  /// Get from gallery
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }



  Future<void> _showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("From where do you want to take the photo?"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text("Gallery"),
                      onTap: () {
                        _getFromGallery();
                        Navigator.pop(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camera"),
                      onTap: () {
                        _getFromCamera();
                        Navigator.pop(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Cancel"),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ));
        });
  }



}


