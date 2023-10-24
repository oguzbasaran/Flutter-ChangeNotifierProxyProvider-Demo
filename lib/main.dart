import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/authenticator.dart';
import 'providers/user_profile.dart';
import 'screens/login_screen.dart';
import 'screens/profile_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Authenticator()),
        ChangeNotifierProxyProvider<Authenticator, UserProfile>(
          create: (_) => UserProfile(),
          update: (context, auth, profile) {
            if (auth.isLoggedIn) {
              // Fake API response for simplicity
              profile!.updateProfile("John Doe", "john.doe@example.com");
            }
            return profile!;
          },
        ),
      ],
      child: MaterialApp(
        title: 'ProxyProvider Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Consumer<Authenticator>(
          builder: (context, auth, _) =>
              auth.isLoggedIn ? const ProfileScreen() : const LoginScreen(),
        ),
      ),
    );
  }
}
