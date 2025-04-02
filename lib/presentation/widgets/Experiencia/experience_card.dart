import 'package:flutter/material.dart';
import 'package:portafolio_web/models/experience_item.dart';
import 'package:portafolio_web/presentation/widgets/Experiencia/experiencia_section.dart';
import 'experience_image_carousel.dart';

class ExperienceCard extends StatelessWidget {
  final ExperienceItem experience;

  const ExperienceCard({required this.experience, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      color: Colors.brown.shade50,
      elevation: 4,
      shadowColor: Colors.black38,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(theme),
            const SizedBox(height: 16),
            _buildShortDescription(theme),
            const SizedBox(height: 16),
            _buildDetailsButton(context, theme),
            const SizedBox(height: 24),
            ExperienceImageCarousel(imagePaths: experience.imagePaths),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(ThemeData theme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.work, color: theme.colorScheme.primary, size: 24),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            experience.title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildShortDescription(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Text(
        experience.shortDescription,
        style: theme.textTheme.bodyMedium?.copyWith(
          height: 1.5,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildDetailsButton(BuildContext context, ThemeData theme) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {
          showDialog(
            context: context,
            builder:
                (_) => FullScreenText(fullText: experience.fullDescription),
          );
        },
        icon: const Icon(Icons.visibility),
        label: const Text('Ver detalles'),
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: Colors.white,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
