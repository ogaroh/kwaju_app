import 'package:assessment/shared/constants.dart';
import 'package:assessment/shared/theme/colors.dart';
import 'package:flutter/material.dart';

class GradientOutlinedButton extends StatelessWidget {
  const GradientOutlinedButton({
    required this.text,
    required this.icon,
    required this.onPressed,
    super.key,
  });
  final String text;
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GradientBorderPainter(
        gradient: kDefaultGradient,
        borderRadius: 8,
        strokeWidth: 2,
      ),
      child: OutlinedButton.icon(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: Colors.transparent,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        label: Text(
          text,
          style: const TextStyle(
            color: kPrimaryColor,
          ),
        ),
        icon: Icon(
          icon,
          color: kPrimaryColor,
          size: 15,
        ),
        iconAlignment: IconAlignment.end,
      ),
    );
  }
}

class GradientBorderPainter extends CustomPainter {
  GradientBorderPainter({
    required this.gradient,
    required this.borderRadius,
    required this.strokeWidth,
  });
  final Gradient gradient;
  final double borderRadius;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final borderPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final borderPath = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          rect.deflate(strokeWidth / 2), // Adjust for stroke width
          Radius.circular(borderRadius),
        ),
      );

    canvas.drawPath(borderPath, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
