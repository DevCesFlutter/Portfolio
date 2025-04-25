import 'package:flutter/material.dart';
import 'package:portafolio_web/presentation/widgets/Experiencia/full_screen_imagen.dart';
import 'package:sizer/sizer.dart';

class ExperienceImageCarousel extends StatelessWidget {
  final List<String> imagePaths;

  const ExperienceImageCarousel({required this.imagePaths, super.key});

  @override
  Widget build(BuildContext context) {


    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Título de la galería
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.photo_library,
              color: Colors.cyanAccent.shade400,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              'Galería de imágenes',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.cyanAccent.shade400,
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Carrusel
        SizedBox(
          height: 40.h,
          width: 90.h,
          child: PageView.builder(
            itemCount: imagePaths.length,
            controller: PageController(viewportFraction: 0.85),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GestureDetector(
                  onTap:
                      () => showDialog(
                        context: context,
                        builder:
                            (_) => FullScreenImage(
                              imagePaths: imagePaths,
                              initialIndex: index,
                            ),
                      ),
                  child: Hero(
                    tag: imagePaths[index],
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          // Imagen
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              imagePaths[index],
                              fit: BoxFit.cover,
                            ),
                          ),

                          // Indicadores
                          _buildImageIndicators(index),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // Indicador de deslizamiento
        _buildSwipeIndicator(),
      ],
    );
  }

  Widget _buildImageIndicators(int index) {
    return Stack(
      children: [
        // Indicador de posición
        Positioned(
          bottom: 8,
          right: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '${index + 1}/${imagePaths.length}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        // Indicador de clic para ampliar
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(Icons.zoom_in, color: Colors.white, size: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildSwipeIndicator() {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.swipe, size: 16, color: Colors.cyan),
          const SizedBox(width: 6),
          Text(
            'Haz click  deliza y\n para ver mas imagenes',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey.shade600,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
