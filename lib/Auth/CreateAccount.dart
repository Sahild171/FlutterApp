import 'package:flutter/material.dart';
import 'package:flutter_app/Home/BaseHome.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_app/Auth/AuthenticationHelper.dart';
import 'package:flutter_app/SharedPrefrence/Prefrences.dart';
import 'dart:developer';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  var space = SizedBox(height: 10);
  String? email;
  String? password;
  String? name;
  bool _obscureText = false;
  final pass_controller = new TextEditingController();
  final c_pass_controller = new TextEditingController();
  final email_controller = new TextEditingController();
  final name_controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        const Radius.circular(100.0),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView (
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 50, 10, 10),
              child:
                  Text("Create your Account", style: TextStyle(fontSize: 20.0)),
            ),
            Lottie.asset('assets/lottie/login.json',
                width: 200, height: 200, fit: BoxFit.fill),

            // email
            Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: TextFormField(
                controller: email_controller,
                decoration: InputDecoration (
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: 'Email',
                    border: border),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (val) {
                  email = val;
                },
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            space,

            // password
            Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: TextFormField(
                controller: pass_controller,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock_outline),
                  border: border,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
                onSaved: (val) {
                  password = val;
                },
                obscureText: !_obscureText,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            space,
            // confirm passwords
            Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: Icon(Icons.lock_outline),
                  border: border,
                ),
                obscureText: true,
                validator: (value) {
                  if (value != pass_controller.text) {
                    return 'password not match';
                  }
                  return null;
                },
              ),
            ),
            space,
            // name
            Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: TextFormField(
                controller: name_controller,
                decoration: InputDecoration(
                  labelText: 'Full name',
                  prefixIcon: Icon(Icons.account_circle),
                  border: border,
                ),
                onSaved: (val) {
                  name = val;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some name';
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: FloatingActionButton.extended(
                label: Text('Signup'), // <-- Text
                backgroundColor: Colors.green[200],
                icon: Icon(
                  // <-- Icon
                  Icons.app_registration,
                  size: 24.0,
                ),
                onPressed: () {
                  if(email_controller.text.isNotEmpty && pass_controller.text.isNotEmpty && name_controller.text.isNotEmpty){
          /*          AuthenticationHelper().signUp(email: email_controller.text, password: pass_controller.text).then((value) {
                      if (value == null) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => BaseHome()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            value,
                            style: TextStyle(fontSize: 16),
                          ),
                        ));
                      }
                    });*/



                  }
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
