import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
              child: Text(
            'Welcome',
            style: TextStyle(
                fontSize: 80, fontWeight: FontWeight.bold, color: Colors.white),
          ))
        ],
      ),
    );
  }
}
