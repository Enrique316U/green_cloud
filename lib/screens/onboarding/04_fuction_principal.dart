import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "../login/login_screen.dart";
import "../login/register_screen.dart";
import "../onboarding/04_fuction_principal.dart"; // Importado para navegación
import "../onboarding/05_permisos_configuracion.dart"; // Importado para navegación,
import "../onboarding/06_resumen.dart"; // Importado para navegación
import "../../widgets/animated_combined_painter.dart";

class fuction_principal extends StatefulWidget {
  static const String routeName = "/welcome";
  const fuction_principal({super.key});

  @override
  State<fuction_principal> createState() => _fuction_principalState();
}

class _fuction_principalState extends State<fuction_principal> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          AnimatedBackground(targetColor: Color.fromARGB(255, 151, 226, 193)),
          // Background gradient
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
          // Decorative circular shapes - sized relative to screen
          Positioned(
            top: -screenWidth * 0.2,
            right: -screenWidth * 0.2,
            child: Container(
              width: screenWidth * 0.5,
              height: screenWidth * 0.5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green.shade300.withOpacity(0.3),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.05,
            left: -screenWidth * 0.1,
            child: Container(
              width: screenWidth * 0.3,
              height: screenWidth * 0.3,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green.shade300.withOpacity(0.3),
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.02),
                  // Main content area
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      children: [
                        _buildWelcomePage(context),
                        _buildFeaturesPage(context),
                      ],
                    ),
                  ),

                  // Page indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              _currentPage == 0 ? Colors.green : Colors.white,
                        ),
                      ),
                      Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              _currentPage == 1 ? Colors.green : Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // Bottom buttons
                  Row(
                    children: [
                      // Skip button
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ResumenScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 176, 196, 164),
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.02,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Saltar",
                            style: GoogleFonts.nunito(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.04),
                      // Next button
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_currentPage == 0) {
                              _pageController.animateToPage(
                                1,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      PermisosConfiguration(), // Navega a la pantalla principal
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 76, 175, 79),
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.02,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Siguiente",
                            style: GoogleFonts.nunito(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomePage(BuildContext context) {
    // Get screen dimensions for responsive sizing
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate image size based on screen dimensions, but constrained
    final imageSize = screenWidth * 0.35;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Character image
        Container(
          width: imageSize,
          height: imageSize,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: ClipOval(
              child: Image.asset(
                "lib/assets/images/pets.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.04),

        // Welcome text
        Text(
          "Bienvenido",
          style: GoogleFonts.nunito(
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.w500,
            color: Colors.green.shade800,
          ),
        ),
        SizedBox(height: screenHeight * 0.02),

        // App name
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Green ",
                style: GoogleFonts.nunito(
                  fontSize: screenWidth * 0.07,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              TextSpan(
                text: "Cloud",
                style: GoogleFonts.nunito(
                  fontSize: screenWidth * 0.07,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade800,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: screenHeight * 0.03),

        // Description text
        Container(
          width: screenWidth * 0.8,
          child: Text(
            "Esta aplicación fue creada para estar siempre conectados con nuestras plantas.",
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              fontSize: screenWidth * 0.04,
              color: Colors.grey.shade800,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturesPage(BuildContext context) {
    // Get screen dimensions for responsive sizing
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate image size based on screen dimensions
    final imageSize = screenWidth * 0.35;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Character image with background
        Container(
          width: imageSize,
          height: imageSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.amber.shade200,
          ),
          child: Stack(
            children: [
              // Background mountains
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: imageSize * 0.4,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(imageSize),
                      bottomRight: Radius.circular(imageSize),
                    ),
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              // Character image
              ClipOval(
                child: Image.asset(
                  "lib/assets/images/farmer_character.png", // Asegúrate de tener esta imagen
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback if image not found
                    return Icon(
                      Icons.person,
                      size: imageSize * 0.6,
                      color: Colors.green.shade800,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: screenHeight * 0.04),

        // Title text
        Container(
          width: screenWidth * 0.8,
          child: Text(
            "Conoce lo que puedes hacer con Green Cloud",
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.w600,
              color: Colors.green.shade800,
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.04),

        // Features container
        Container(
          width: screenWidth * 0.85,
          padding: EdgeInsets.all(screenWidth * 0.05),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFeatureItem(context, "Monitorea tu planta"),
              SizedBox(height: screenHeight * 0.02),
              _buildFeatureItem(context, "Desbloquea recompensas"),
              SizedBox(height: screenHeight * 0.02),
              _buildFeatureItem(context, "Aprende jugando"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureItem(BuildContext context, String text) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 8,
          height: 8,
          margin: EdgeInsets.only(top: 8, right: 8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green.shade800,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.nunito(
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade800,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

// Aquí asumimos cómo se ve la clase FunctionPrincipalScreen
// Reemplaza esto con la definición real de tu FunctionPrincipalScreen
class FunctionPrincipalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Funciones Principales"),
      ),
      body: Center(
        child: Text("Pantalla de Funciones Principales"),
      ),
    );
  }
}
