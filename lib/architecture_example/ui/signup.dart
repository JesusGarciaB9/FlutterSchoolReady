import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:f_202010_provider_get_it/architecture_example/components/widgetsbasicos.dart'; 
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'dart:async';

class SignUp extends StatelessWidget {
  final nameController = TextEditingController();
  final passController = TextEditingController();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              account(nameController),
              password(passController),
              email(emailController),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: RaisedButton(
                  onPressed: () async {
                    String nombre = nameController.text.trim();
                    String passw = passController.text.trim();
                    String email = emailController.text.trim();
                 var value = await signUp(nombre, passw, email, nombre);
             
                    Navigator.pop(context);
                  },
                  child: Text('Crear Cuenta'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
Future signUp(
    String name, String password, String email, String username) async {
  final http.Response response = await http.post(
    'https://movil-api.herokuapp.com/signup',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
      'username': username,
      'name': name
    }),
  );

  print('${response.body}');
  print('${response.statusCode}');
  if (response.statusCode == 200) {
    print('registro exitoso ' + '${response.body}');
    return true;
  } else {
    print("signup failed");
    print('${response.body}');
    
    return false;
  }
}


