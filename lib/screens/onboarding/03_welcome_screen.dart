import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "../login/login_screen.dart";
import "../../widgets/animated_combined_painter.dart";
import "../onboarding/04_fuction_principal.dart";

class WelcomeScreen extends StatefulWidget {
  static const String routeName = "/welcome";
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
          AnimatedBackground(targetColor: Color.fromARGB(255, 189, 223, 208)),
          // Background gradient
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.green.shade100,
                  Colors.green.shade200,
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
                              MaterialPageRoute(builder: (_) => LoginScreen()),
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
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.04),
                      // Next button
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => fuction_principal()),
                            );
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
                              fontWeight: FontWeight.w900,
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
                "lib/assets/images/onboarding/viejo.png",
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
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              TextSpan(
                text: "Cloud",
                style: GoogleFonts.nunito(
                  fontSize: screenWidth * 0.07,
                  fontWeight: FontWeight.w900,
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
                fontWeight: FontWeight.w500),
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
