import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '02_logo_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = "/splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LogoScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          /// Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              "lib/assets/images/Splash_01.png",
              fit: BoxFit.cover,
            ),
          ),

          /// Texto separado en la parte superior
          Positioned(
            top: 80,
            left: 20,
            right: 20,
            child: Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Green ",
                      style: GoogleFonts.nunito(
                        fontSize: 56,
                        fontWeight: FontWeight.w900, // Equivalente a Black
                        color: Colors.white, // Cambia si deseas otro color
                      ),
                    ),
                    TextSpan(
                      text: "Cloud",
                      style: GoogleFonts.nunito(
                        fontSize: 56,
                        fontWeight: FontWeight.w900,
                        color: Colors.green, // Cambia si deseas otro color
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
