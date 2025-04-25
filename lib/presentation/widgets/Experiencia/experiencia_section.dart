import 'package:flutter/material.dart';
import 'package:portafolio_web/models/experience_item.dart';
import 'package:portafolio_web/presentation/widgets/Experiencia/experience_card.dart';
import 'package:portafolio_web/presentation/widgets/Experiencia/experience_title.dart';
import 'package:portafolio_web/presentation/widgets/comonn/gradient_divider.dart';
import 'package:portafolio_web/repositories/experience_repository.dart';
//modelo de datos

/// Sección de experiencia y proyectos

class ExperienciaSection extends StatelessWidget {
  const ExperienciaSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Get experiences from repository
    final repository = ExperienceRepository();
    final List<ExperienceItem> experiences =
        repository.getExperiences().cast<ExperienceItem>();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 24.0),
      child: Column(
        children: [
          const ExperienceTitle(),
          const SizedBox(height: 24),
          ...experiences.asMap().entries.map((entry) {
            final index = entry.key;
            final experience = entry.value;
            return Column(
              children: [
                ExperienceCard(
                  experience: experience,
                ),
                if (index != experiences.length - 1) const GradientDivider(),
              ],
            );
          }),
        ],
      ),
    );
  }
}
