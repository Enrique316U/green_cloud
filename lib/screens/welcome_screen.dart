import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "login_screen.dart";
import "register_screen.dart";

class WelcomeScreen extends StatelessWidget {
  static const String routeName = "/welcome";
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo de pantalla
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green.shade100, Colors.green.shade200],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Imagen de personajes
                  Image.asset(
                    "lib/assets/images/pets.png",
                    width: 400,
                    height: 400,
                  ),
                  const SizedBox(height: 20),
                  // Título
                  Text(
                    "Bienvenido",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium, // Usa headlineMedium
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Green ",
                        style:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  color: Colors.white, // Sobrescribe el color
                                ),
                      ),
                      Text(
                        "Cloud",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge, // Usa headlineLarge
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Esta aplicación fue creada para estar siempre conectados a nuestras plantas.",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium, // Usa bodyMedium
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  // Botones en una fila
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Botón de Ingresar

                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => LoginScreen()),
                            );
                          },
                          style: ButtonStyle(
                            minimumSize: WidgetStateProperty.all(
                                const Size(170, 50)), // Tamaño fijo
                            backgroundColor:
                                WidgetStateProperty.resolveWith<Color>(
                                    (Set<WidgetState> states) {
                              if (states.contains(WidgetState.pressed)) {
                                return Colors.white;
                              }
                              return const Color.fromARGB(255, 193, 39, 44);
                            }),
                            shadowColor: WidgetStateProperty.all(Colors.white),
                            elevation: WidgetStateProperty.all(10),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            foregroundColor:
                                WidgetStateProperty.resolveWith<Color>(
                              (Set<WidgetState> states) {
                                if (states.contains(WidgetState.pressed)) {
                                  return const Color.fromARGB(255, 193, 39, 44);
                                }
                                return Colors.white;
                              },
                            ),
                          ),
                          child: Text(
                            "Ingresar",
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                      const SizedBox(width: 24), // Espacio entre botones
                      // Botón de Registrarse

                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const RegisterScreen()),
                          );
                        },
                        style: ButtonStyle(
                          minimumSize: WidgetStateProperty.all(
                              const Size(170, 50)), // Tamaño fijo
                          backgroundColor:
                              WidgetStateProperty.resolveWith<Color>(
                            (Set<WidgetState> states) {
                              if (states.contains(WidgetState.pressed)) {
                                return const Color.fromARGB(255, 193, 39,
                                    44); // Color cuando está presionado
                              }
                              return Colors.white; // Color normal
                            },
                          ),
                          shadowColor: WidgetStateProperty.all(Colors.white),
                          elevation: WidgetStateProperty.all(10),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          foregroundColor:
                              WidgetStateProperty.resolveWith<Color>(
                            (Set<WidgetState> states) {
                              if (states.contains(WidgetState.pressed)) {
                                return Colors
                                    .white; // Color del texto cuando está presionado
                              }
                              return const Color.fromARGB(
                                  255, 193, 39, 44); // Color del texto normal
                            },
                          ),
                        ),
                        child: Text(
                          "Registrarse",
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
