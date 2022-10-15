import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myflutter/firebase_options.dart';
import 'package:myflutter/screens/login.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
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
        title: const Text('Registration'),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Container(
                padding: const EdgeInsets.all(30),
                color: Colors.white,
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    const Text(
                      'Register A New Account',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      controller: email,
                      decoration: const InputDecoration(
                          hintText: 'Enter Your Email Address'),
                      enableSuggestions: false,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextField(
                      controller: pass,
                      decoration: const InputDecoration(
                          hintText: 'Enter Your Password'),
                      obscureText: true,
                    ),
                    ElevatedButton(
                        onPressed: register, child: const Text('Register')),
                    ElevatedButton(
                        onPressed: loginPage, child: const Text('Go To Login'))
                  ],
                ),
              );
            default:
              return const Text('Loading....');
          }
        },
      ),
    );
  }

  void register() async {
    final userMail = email.text;
    final userPass = pass.text;

    final res = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: userMail, password: userPass);

    print(res);
  }

  void loginPage() {
    Navigator.of(context).pop(MaterialPageRoute(builder: (context) {
       return const LoginView();
    },));
  }
}
