import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_app/Auth/AuthenticationHelper.dart';
import 'package:flutter_app/Auth/CreateAccount.dart';
import 'package:flutter_app/Home/BaseHome.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}


class _LoginState extends State<Login> {

  String error="";
  String error1="";
  TextEditingController _texteditcontroller = new TextEditingController();
  TextEditingController _texteditcontroller1 = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Login'),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: Center (
              child: SingleChildScrollView (
                child:Column (
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 50, 10, 20),
                      child: Text("Welcome to the App",
                          style: TextStyle(fontSize: 20.0)),
                    ),
                    Lottie.asset('assets/lottie/login.json',
                        width: 300, height: 300, fit: BoxFit.fill),
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                      child: TextField (
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.start,
                        controller: _texteditcontroller,
                        decoration: InputDecoration (
                            errorText: error,
                            hintText: "Enter email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                      child: TextField (
                        keyboardType: TextInputType.visiblePassword,
                        textAlign: TextAlign.start,
                        controller: _texteditcontroller1,
                        decoration: InputDecoration (
                            errorText: error1,
                            hintText: "Enter Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    FloatingActionButton.extended(
                      label: Text('Login'), // <-- Text
                      backgroundColor: Colors.green[200],
                      icon: Icon(
                        // <-- Icon
                        Icons.login,
                        size: 24.0,
                      ),
                      onPressed: () {
                        if(_texteditcontroller.text.isNotEmpty && _texteditcontroller1.text.isNotEmpty) {
                          AuthenticationHelper().signIn(email: _texteditcontroller.text,password: _texteditcontroller1.text).then((value) {
                            if(value == null){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> BaseHome()));
                            } else {
                              print("Exception"+value);
                          //    Navigator.push(context, MaterialPageRoute(builder: (context)=> BaseHome()));
                            }
                          });
                        }
                      },
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateAccount()));
                      },
                      child: const Text('Create Account'),
                    ),
                  ],
                ),
              )
          ),
      ),
    );

  }

   bool  validations(){
    if(_texteditcontroller.text.isEmpty){
      setState(() {
        error="Please enter email";
        // lists.insert(index, deletedRecord);
      });
      return false;
    } else if(_texteditcontroller1.text.isEmpty){
      setState(() {
        error1="Please enter Password";
        // lists.insert(index, deletedRecord);
      });
      return false;
    }
      return true;

   }
}
