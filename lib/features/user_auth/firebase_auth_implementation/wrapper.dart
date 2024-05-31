import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studtech/features/user_auth/presentation/pages/home_page.dart';
import 'package:studtech/features/user_auth/presentation/pages/login_page.dart';
import 'package:studtech/features/user_auth/presentation/pages/verification_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            } else {
              if (snapshot.data == null) {
                return const LoginPage();
              } else {
                if (snapshot.data?.emailVerified == true) {
                  return const HomePage();
                }
              }
              return VerificationScreen();
            }
          }),
    );
  }
}
