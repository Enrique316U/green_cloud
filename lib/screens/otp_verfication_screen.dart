import "package:flutter/material.dart";

class OtpVerificationScreen extends StatelessWidget {
  static const String routeName = "/otp-verification";
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verificación OTP")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Ingrese el código de verificación"),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                hintText: "Código de verificación",
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Verificar"),
            ),
          ],
        ),
      ),
    );
  }
}
