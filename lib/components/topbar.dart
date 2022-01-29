import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "News App",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );
  }
}
