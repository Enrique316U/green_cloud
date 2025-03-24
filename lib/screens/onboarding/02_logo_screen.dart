import 'package:flutter/material.dart';
import "04_fuction_principal.dart";

class LogoScreen extends StatefulWidget {
  static const String routeName = "/logo";
  const LogoScreen({super.key});
  @override
  LogoScreenState createState() => LogoScreenState();
}

class LogoScreenState extends State<LogoScreen> {
  @override
  void initState() {
    super.initState();
    // Navega a la siguiente pantalla después de 5 minutos (300000 ms)
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, fuction_principal.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Altura del área de rectángulos en la parte inferior
    final bottomAreaHeight = screenHeight * 0.25;

    // Cálculos para los logos (aumentados de tamaño)
    final logoWidth = screenWidth * 0.45; // Ajustado para mejor proporción
    final spaceBetween = screenWidth * 0.04;
    final totalWidth = (logoWidth * 2) + spaceBetween;
    final startX = (screenWidth - totalWidth) / 2;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 72, 175, 80), // Verde de fondo
      body: SafeArea(
        child: Stack(
          children: [
            // Logo principal centrado y movido hacia arriba
            Positioned(
              top: screenHeight *
                  0.199, // Mover hacia arriba (estaba en el centro)
              left: screenWidth / 2 - (screenWidth * 0.6) / 2,
              child: Image.asset(
                'lib/assets/images/onboarding/usmp_logo.png',
                width: screenWidth * 0.6,
              ),
            ),

            // Área de rectángulos en la parte inferior
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomPaint(
                size: Size(screenWidth, bottomAreaHeight),
                painter: BottomRectanglesPainter(),
              ),
            ),

            // Primer logo en el rectángulo central
            Positioned(
              bottom: bottomAreaHeight * 0.2, // Posición ajustada
              left: startX,
              child: Image.asset(
                'lib/assets/images/onboarding/concytec_logo.png',
                width: logoWidth,
                height: bottomAreaHeight * 0.6, // Altura controlada
                fit: BoxFit.contain,
              ),
            ),

            // Segundo logo en el rectángulo central
            Positioned(
              bottom: bottomAreaHeight * 0.2, // Posición ajustada
              left: startX + logoWidth + spaceBetween,
              child: Image.asset(
                'lib/assets/images/onboarding/pro_ciencia_logo.png',
                width: logoWidth,
                height: bottomAreaHeight * 0.6, // Altura controlada
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomRectanglesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Solo dibujar la franja blanca principal, sin líneas verdes divisorias
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.3, size.width, size.height * 0.4),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
