import "package:flutter/material.dart";

class ForgotPasswordScreen extends StatelessWidget {
  static const String routeName = "/forgot-password";
  const ForgotPasswordScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Recuperar Contraseña")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                "Ingrese su correo electrónico para recuperar su contraseña"),
            const SizedBox(height: 16),
            TextField(
              decoration:
                  const InputDecoration(labelText: "Correo Electrónico"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Enviar"),
            )
          ],
        ),
      ),
    );
  }
}
