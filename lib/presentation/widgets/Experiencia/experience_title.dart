import 'package:flutter/material.dart';

class ExperienceTitle extends StatelessWidget {
  const ExperienceTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      child: Text(
        'Experiencia / Proyectos',
        textAlign: TextAlign.center,
        style: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.cyanAccent,
          letterSpacing: 1.2,
          shadows: const [Shadow(color: Colors.blue, blurRadius: 10)],
        ),
      ),
    );
  }
}
