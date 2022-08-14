import 'package:flutter/material.dart';

import 'text_field.dart';
import 'form_button.dart';
import '../../models/auth_mode.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  AuthMode authMode = AuthMode.login;

  void switchMode() {
    setState(() {
      authMode = authMode == AuthMode.login ? AuthMode.signup : AuthMode.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          const SizedBox(height: 15),
          const InputTextField(title: 'Email'),
          const SizedBox(height: 15),
          const InputTextField(title: 'Password'),
          const SizedBox(height: 15),
          if (authMode == AuthMode.signup)
            Column(
              children: [
                const InputTextField(title: 'Confirm Password'),
                const SizedBox(height: 15),
              ],
            ),
          FormButton(
            title: authMode == AuthMode.login ? 'Login' : 'Sign Up',
            handler: () {},
          ),
          const SizedBox(height: 15),
          FormButton(
            title: authMode == AuthMode.login ? 'Create An Account' : 'Already have an account?',
            handler: switchMode,
          ),
        ],
      ),
    );
  }
}
