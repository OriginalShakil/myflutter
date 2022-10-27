import 'package:flutter/material.dart';

class TestWed extends StatefulWidget {
  const TestWed({super.key});

  @override
  State<TestWed> createState() => _TestWedState();
}

class _TestWedState extends State<TestWed> {
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context)?.settings.arguments as Map;

    String txt = args['name'];
    String ase = args['else'];

    if (args != null) {}
    return Scaffold(
      appBar: AppBar(
        title: const Text('text'),
      ),
      body: Container(
        color: Colors.white,
        child: Text('$txt $ase'),
      ),
    );
  }
}
