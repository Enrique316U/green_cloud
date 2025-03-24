import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../login/login_screen.dart';
import '../login/register_screen.dart';
import "../../widgets/animated_combined_painter.dart";
// Si planeas usar AnimatedCombinedPainter, impórtalo aquí
// import '../../widgets/animated_combined_painter.dart';

class ResumenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          /// 1. FONDO CON GRADIENTE
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 209, 242, 230),
                  Colors.green.shade100,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          //Capa 1.5 Figuras animadas
          AnimatedBackground(targetColor: Color.fromARGB(255, 189, 223, 208)),

          /// 2. CONTENIDO PRINCIPAL
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.04),

                  // Character and welcome section
                  Container(
                    width: screenWidth * 0.6,
                    height: screenWidth * 0.6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 233, 241, 217),
                    ),
                    child: ClipOval(
                      child: SizedBox(
                        width: screenWidth * 0.6,
                        height: screenWidth * 0.6,
                        child: Image.asset(
                          'lib/assets/images/onboarding/pet.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  Text(
                    "Resumen",
                    style: GoogleFonts.nunito(
                      fontSize: screenWidth * 0.07,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 2, 88, 16),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.01),

                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Green ",
                          style: GoogleFonts.nunito(
                            fontSize: screenWidth * 0.14,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: "Cloud",
                          style: GoogleFonts.nunito(
                            fontSize: screenWidth * 0.14,
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 76, 175, 79),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.01),

                  Text(
                    "Tu configuración está lista para comenzar a cuidar tus plantas por favor apoyanos con una donación.",
                    style: GoogleFonts.nunito(
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 51, 51, 51),
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: screenHeight * 0.05),

                  // Continue button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => LoginScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 76, 175, 79),
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, screenHeight * 0.06),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Ingresar",
                      style: GoogleFonts.nunito(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  // Back button (styled as secondary button)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RegisterScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 176, 196, 164),
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, screenHeight * 0.06),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Registrarse",
                      style: GoogleFonts.nunito(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.089),

                  // Terms and Privacy
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Privacy Policy",
                        style: GoogleFonts.nunito(
                          fontSize: screenWidth * 0.035,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        " - ",
                        style: GoogleFonts.nunito(
                          fontSize: screenWidth * 0.035,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        "Terms of Service",
                        style: GoogleFonts.nunito(
                          fontSize: screenWidth * 0.035,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.02),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryItem({
    required BuildContext context,
    required String title,
    required IconData icon,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Icon(
          icon,
          size: screenWidth * 0.06,
          color: Color.fromARGB(255, 76, 175, 79),
        ),
        SizedBox(width: screenWidth * 0.04),
        Expanded(
          child: Text(
            title,
            style: GoogleFonts.nunito(
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 76, 175, 79),
            ),
          ),
        ),
        Icon(
          Icons.check_circle,
          size: screenWidth * 0.06,
          color: Colors.green,
        ),
      ],
    );
  }
}

// Placeholder for the Dashboard screen
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Green Cloud",
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 76, 175, 79),
      ),
      body: Center(
        child: Text(
          "Tablero Principal",
          style: GoogleFonts.nunito(
            fontSize: 18,
            color: Color.fromARGB(255, 76, 175, 79),
          ),
        ),
      ),
    );
  }
}
