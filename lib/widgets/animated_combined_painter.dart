import "dart:math";
import "package:flutter/material.dart";
import "package:flutter/scheduler.dart";

class AnimatedCombinedPainter extends CustomPainter {
  final Color targetColor;
  final double progress;

  AnimatedCombinedPainter(this.targetColor, this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    //Calcula el color actual basado en el progreso
    final currentColor = Color.lerp(
        const Color.fromARGB(0, 255, 255, 255), targetColor, progress)!;

    final fillPaint = Paint()
      ..color = currentColor
      ..style = PaintingStyle.fill;

    final strokePaint = Paint()
      ..color = currentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    // Dibuja el primer círculo lleno
    canvas.drawCircle(
      Offset(size.width * 0.9, -size.height * 0.0),
      size.width * 0.6,
      fillPaint,
    );

    canvas.drawCircle(
      Offset(size.width * 0.7, size.height * 0.05),
      size.width * 0.6,
      strokePaint,
    );

    // Dibuja el primer cuadrado con borde
    final rect1 = Rect.fromLTWH(
      -size.width * 0.1,
      size.height * 0.8,
      size.width * 0.5,
      size.width * 0.7,
    );
    canvas.drawRect(rect1, strokePaint);

    //dibuja el segundo cuadrado con borde
    canvas.save();
    canvas.translate(size.width * 0.0, size.height * 0.85);
    canvas.rotate(pi / 6);

    final rect2 = Rect.fromLTWH(
      -size.width * 0.15,
      -size.width * 0.15,
      size.width * 0.9,
      size.width * 0.9,
    );
    canvas.drawRect(rect2, strokePaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant AnimatedCombinedPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.targetColor != targetColor;
  }
}

// widget maneja animacion

class AnimatedBackground extends StatefulWidget {
  final Color targetColor;

  const AnimatedBackground({super.key, required this.targetColor});

  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late Ticker _ticker;
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();

    // Inicializar el Ticker
    _ticker = createTicker((elapsed) {
      setState(() {
        //tiempro trascurrido
        _progress = (elapsed.inMilliseconds / 3000).clamp(0.0, 1.0);

        if (_progress == 1.0) {
          _ticker.stop();
        }
      });
    });
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: MediaQuery.of(context).size,
      painter: AnimatedCombinedPainter(widget.targetColor, _progress),
    );
  }
}
