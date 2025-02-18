import "package:flutter/material.dart";
import "package:green_cloud/screens/splash_screen.dart";
import "package:green_cloud/screens/logo_screen.dart";
import "package:green_cloud/screens/welcome_screen.dart";
import "package:green_cloud/screens/login_screen.dart";
import "package:green_cloud/screens/register_screen.dart";
import "package:green_cloud/screens/forgot_password_screen.dart";
import "package:green_cloud/screens/otp_verfication_screen.dart";
import "package:green_cloud/screens/reset_password_screen.dart";
import "package:green_cloud/screens/password_changed_screen.dart";
import "package:green_cloud/widgets/BottomNavBar.dart";

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case LogoScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LogoScreen());
      case WelcomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RegisterScreen.routeName:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case ForgotPasswordScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case OtpVerificationScreen.routeName:
        return MaterialPageRoute(builder: (_) => const OtpVerificationScreen());
      case ResetPasswordScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case PasswordChangedScreen.routeName:
        return MaterialPageRoute(builder: (_) => const PasswordChangedScreen());
      case BottomNavBar.routeName:
        return MaterialPageRoute(builder: (_) => const BottomNavBar());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text("Página no encontrada")),
      );
    });
  }
}
