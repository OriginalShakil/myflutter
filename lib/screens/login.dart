import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/utills/constant.dart';
import '../utills/show_error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController email;
  late TextEditingController pass;

  @override
  void initState() {
    email = TextEditingController();
    pass = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const Text(
              'Login To Your Account',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: email,
              decoration:
                  const InputDecoration(hintText: 'Enter Your Email Address'),
              enableSuggestions: false,
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: pass,
              decoration:
                  const InputDecoration(hintText: 'Enter Your Password'),
              obscureText: true,
            ),
            ElevatedButton(onPressed: login, child: const Text('Login')),
            ElevatedButton(
                onPressed: registerPage, child: const Text('Go To Register'))
          ],
        ),
      ),
    );
  }

  void login() async {
    final userMail = email.text;
    final userPass = pass.text;

    try {
      final res = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: userMail, password: userPass);
      print(res);

      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        if (user.emailVerified) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(noteRoute, (route) => false);
        } else {
          await user.sendEmailVerification();
          Navigator.of(context).pushNamed(verifyMailRoute);
        }
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          await showErrorDialog(context, 'User not Registered');

          break;

        case 'wrong-password':
          await showErrorDialog(context, 'incorrect password');

          break;
        case 'invalid-email':
          await showErrorDialog(context, 'Invalid Email');
          break;
        default:
          await showErrorDialog(context, 'Error: ${e.code}');
      }

      print('Error msg ${e.code}');
    } catch (e) {
      await showErrorDialog(context, e.toString());
    }
  }

  void registerPage() {
    Navigator.of(context).pushNamedAndRemoveUntil(regRoute, (route) => false);
  }
}
