import 'package:flutter/material.dart';
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        // Title
        title: Text("Simple Material App"),
      ),
      // Body
      body: Container(
        // Center the content
        child: Center(
          // Add Text
          child: Text("Hello World!"),
        ),
      ),
    );
  }
}
