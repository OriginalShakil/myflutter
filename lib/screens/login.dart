import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/utills/constant.dart';
import '../firebase_options.dart';
import 'registration.dart';

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

      Navigator.of(context)
          .pushNamedAndRemoveUntil(noteRoute, (route) => false);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          showErrorDialog(context, 'User not Registered');

          break;

        case 'wrong-password':
          showErrorDialog(context, 'incorrect password');

          break;
        case 'invalid-email':
          showErrorDialog(context, 'Invalid Email');
          break;
        default:
          showErrorDialog(context, 'Error: ${e.code}');
      }

      print('Error msg ${e.code}');
    } catch (e) {
      showErrorDialog(context, e.toString());
    }
  }

  void registerPage() {
    Navigator.of(context).pushNamedAndRemoveUntil(regRoute, (route) => false);
  }
}

Future<void> showErrorDialog(BuildContext context, String msg) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Something Went Wrong'),
        content: Text(msg),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'))
        ],
      );
    },
  );
}
