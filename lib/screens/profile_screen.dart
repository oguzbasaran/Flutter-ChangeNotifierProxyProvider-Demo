import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/authenticator.dart';
import '../providers/user_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<UserProfile>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              context.read<Authenticator>().logout();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Username: ${profile.username}'),
            Text('Email: ${profile.email}'),
          ],
        ),
      ),
    );
  }
}
