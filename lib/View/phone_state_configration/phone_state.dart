import 'package:flutter/material.dart';

class PhoneState extends StatefulWidget {
  const PhoneState({super.key});

  @override
  State<PhoneState> createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<PhoneState> {
  @override
  void initState() {
    super.initState();

    // here we will listen for lock/unlock events
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(),
    );
  }
}
