import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../onboarding/04_fuction_principal.dart';
import "../onboarding/06_resumen.dart"; // Importa la pantalla de funciones principales

class PermisosConfiguration extends StatefulWidget {
  @override
  _PermisosConfigurationState createState() => _PermisosConfigurationState();
}

class _PermisosConfigurationState extends State<PermisosConfiguration> {
  bool _notificationsEnabled = false;
  bool _locationEnabled = false;
  bool _cameraEnabled = false;

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
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
          // Decorative circular shapes
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: screenHeight * 0.02),
                  // Back button
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon:
                          Icon(Icons.arrow_back, color: Colors.green.shade800),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),
                  // Title
                  Text(
                    "Configuración de permisos",
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade800,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: screenHeight * 0.03),
                  // Subtitle
                  Text(
                    "Para ofrecerte la mejor experiencia, necesitamos algunos permisos:",
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.04,
                      color: Colors.grey.shade800,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: screenHeight * 0.05),
                  // Permissions container
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          _buildPermissionItem(
                            context: context,
                            title: "Notificaciones",
                            description:
                                "Recibe alertas sobre el estado de tus plantas",
                            icon: Icons.notifications_none,
                            value: _notificationsEnabled,
                            onChanged: (value) {
                              setState(() {
                                _notificationsEnabled = value;
                              });
                            },
                          ),
                          Divider(height: screenHeight * 0.04),
                          _buildPermissionItem(
                            context: context,
                            title: "Ubicación",
                            description:
                                "Para recomendaciones basadas en tu clima local",
                            icon: Icons.location_on_outlined,
                            value: _locationEnabled,
                            onChanged: (value) {
                              setState(() {
                                _locationEnabled = value;
                              });
                            },
                          ),
                          Divider(height: screenHeight * 0.04),
                          _buildPermissionItem(
                            context: context,
                            title: "Cámara",
                            description:
                                "Para escanear y hacer seguimiento a tus plantas",
                            icon: Icons.camera_alt_outlined,
                            value: _cameraEnabled,
                            onChanged: (value) {
                              setState(() {
                                _cameraEnabled = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.03),
                  // Continue button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ResumenScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 76, 175, 79),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Continuar",
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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

  Widget _buildPermissionItem({
    required BuildContext context,
    required String title,
    required String description,
    required IconData icon,
    required bool value,
    required Function(bool) onChanged,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Icon(
          icon,
          size: screenWidth * 0.08,
          color: Colors.green.shade700,
        ),
        SizedBox(width: screenWidth * 0.04),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w600,
                  color: Colors.green.shade800,
                ),
              ),
              Text(
                description,
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * 0.035,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.green,
        ),
      ],
    );
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
