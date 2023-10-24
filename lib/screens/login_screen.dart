import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/authenticator.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<Authenticator>().login('example_token');
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
