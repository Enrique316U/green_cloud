import 'package:flutter/material.dart';
import "../widgets/animated_combined_painter.dart";

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo personalizado
          AnimatedBackground(targetColor: Colors.blue),
          // Contenido de la pantalla
          Center(
            child: Text(
              "En construcción",
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfileScreen(),
  ));
}
