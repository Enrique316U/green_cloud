import "package:flutter/material.dart";
import "package:green_cloud/widgets/BottomNavBar.dart";
import "forgot_password_screen.dart";
import "../services/auth_service.dart";

class LoginScreen extends StatelessWidget {
  static const String routeName = "/login";

  // Controladores para los campos de texto
  final TextEditingController emailController;
  final TextEditingController passwordController;

  // Instancia de AuthService
  final AuthService _authService;

  // Constructor
  LoginScreen({Key? key})
      : emailController = TextEditingController(),
        passwordController = TextEditingController(),
        _authService = AuthService(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Iniciar Sesión")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration:
                  const InputDecoration(labelText: "Correo Electrónico"),
              keyboardType: TextInputType.emailAddress, // Teclado para correo
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Contraseña"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navegar directamente a la siguiente pantalla sin validación
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const BottomNavBar()));
              },
              child: const Text("Iniciar Sesión"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const ForgotPasswordScreen()),
                );
              },
              child: const Text("¿Olvidaste tu contraseña?"),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                final userCredential = await _authService.signInWithGoogle();
                if (userCredential != null) {
                  // Navegar a la pantalla principal después del inicio de sesión
                  Navigator.pushReplacementNamed(context, "/home");
                }
              },
              icon: const Icon(Icons.g_mobiledata),
              label: const Text("Iniciar con Google"),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                final userCredential = await _authService.signInWithFacebook();
                if (userCredential != null) {
                  // Navegar a la pantalla principal después del inicio de sesión
                  Navigator.pushReplacementNamed(context, "/home");
                }
              },
              icon: const Icon(Icons.facebook),
              label: const Text("Iniciar con Facebook"),
            ),
          ],
        ),
      ),
    );
  }
}
