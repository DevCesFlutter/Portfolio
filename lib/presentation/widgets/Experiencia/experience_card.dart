import 'package:flutter/material.dart';
import 'package:portafolio_web/models/experience_item.dart';
import 'package:portafolio_web/presentation/widgets/Experiencia/full_screen_text.dart';
import 'package:portafolio_web/presentation/widgets/Experiencia/video.dart';
import 'experience_image_carousel.dart';

class ExperienceCard extends StatelessWidget {
  final ExperienceItem experience;
  final bool showVideo;

  const ExperienceCard({
    required this.experience,
    this.showVideo = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      color: Colors.grey.shade900,
      elevation: 10,
      shadowColor: Colors.blueAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.cyanAccent.shade400, width: 5.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildTitle(textTheme, Colors.cyanAccent.shade400),
            const SizedBox(height: 16),
            _buildShortDescription(textTheme),
            const SizedBox(height: 16),
            _buildDetailsButton(context),
            if (showVideo) ...[
              const SizedBox(height: 24),
              Center(
                child: const YoutubeVideoEmbed(
                  videoId: 'CMa0XWFgvNE?si=V8bb-n8Jn2jul6nW',
                ),
              ), // cambia por el ID real del video
            ],
            const SizedBox(height: 24),
            ExperienceImageCarousel(imagePaths: experience.imagePaths),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(TextTheme textTheme, Color primaryColor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.work, color: primaryColor, size: 24),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            experience.title,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              height: 1.3,
              color: Colors.cyanAccent.shade200,
              shadows: [Shadow(color: Colors.blueAccent, blurRadius: 10)],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildShortDescription(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.cyanAccent.shade400),
      ),
      child: Text(
        experience.shortDescription,
        style: textTheme.bodyMedium?.copyWith(
          height: 1.5,
          color: Colors.cyanAccent.shade100,
        ),
      ),
    );
  }

  Widget _buildDetailsButton(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder:
                (context) =>
                    FullScreenText(fullText: experience.fullDescription),
          );
        },
        icon: const Icon(Icons.visibility, color: Colors.black),
        label: const Text('Ver mas detalles sobre esta experiencia'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.cyanAccent.shade400,
          foregroundColor: Colors.black,
          elevation: 5,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: Colors.blueAccent.shade400, width: 1),
          ),
        ),
      ),
    );
  }
}
