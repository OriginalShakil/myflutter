import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/screens/login.dart';
import 'package:myflutter/screens/notesview.dart';
import 'package:myflutter/screens/verifyemail.dart';
import '../firebase_options.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;

            if (user != null) {
              if (user.emailVerified) {
                print('You are verified user');
                return const NotesView();
              } else {
                print('You are non verified user');

                // return const VerifyEmailView();
              }
            }
            return const LoginView();

          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
