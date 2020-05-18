import 'package:flutter/material.dart';

Widget account(nameController) {
  return TextFormField(
    controller: nameController,
    textAlign: TextAlign.center,
    validator: (value) {
      if (value.isEmpty) {
        return 'Por favor digite su usuario';
      }
    },
    decoration: InputDecoration(hintText: 'Cuenta '),
  );
}

Widget password(passController) {
  return TextFormField(
    controller: passController,
    obscureText: true,
    textAlign: TextAlign.center,
    validator: (value) {
      if (value.isEmpty) {
        return 'Por favor digite su contraseña';
      }
    },
    decoration: InputDecoration(hintText: 'Contraseña '),
  );
}

Widget email(emailController) {
  return TextFormField(
    controller: emailController,
    textAlign: TextAlign.center,
    validator: (value) {
      if (value.isEmpty) {
        return 'Por favor digite su email';
      }
    },
    decoration: InputDecoration(hintText: 'Email '),
  );
}
