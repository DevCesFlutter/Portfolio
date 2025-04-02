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
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ExperienceTitle(),
          const SizedBox(height: 24),
          ...experiences.map((experience) {
            return Column(
              children: [
                ExperienceCard(experience: experience),
                if (experiences.last != experience) const GradientDivider(),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}

/// Diálogo de pantalla completa para mostrar imágenes

class FullScreenImage extends StatefulWidget {
  final List<String> imagePaths;
  final int initialIndex;

  const FullScreenImage({
    super.key,
    required this.imagePaths,
    required this.initialIndex,
  });

  @override
  _FullScreenImageState createState() => _FullScreenImageState();
}

//
class _FullScreenImageState extends State<FullScreenImage>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late int currentIndex;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _showControls = true;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: currentIndex);

    // Configuración de la animación para los controles
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _animationController.forward();

    // Temporizador para ocultar los controles después de un tiempo
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _showControls = false;
          _animationController.reverse();
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
      if (_showControls) {
        _animationController.forward();

        // Ocultar controles después de un tiempo
        Future.delayed(const Duration(seconds: 3), () {
          if (mounted && _showControls) {
            setState(() {
              _showControls = false;
              _animationController.reverse();
            });
          }
        });
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleControls,
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black.withOpacity(0.9),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Visor de imágenes
              PageView.builder(
                controller: _pageController,
                itemCount: widget.imagePaths.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                    // Mostrar controles momentáneamente al cambiar de página
                    _showControls = true;
                    _animationController.forward();

                    // Ocultar después de un tiempo
                    Future.delayed(const Duration(seconds: 3), () {
                      if (mounted && _showControls) {
                        setState(() {
                          _showControls = false;
                          _animationController.reverse();
                        });
                      }
                    });
                  });
                },
                itemBuilder: (context, index) {
                  return Semantics(
                    label: 'Imagen ${index + 1} de ${widget.imagePaths.length}',
                    child: Center(
                      child: InteractiveViewer(
                        boundaryMargin: const EdgeInsets.all(20),
                        minScale: 0.5,
                        maxScale: 4,
                        child: Hero(
                          tag: widget.imagePaths[index],
                          child: Image.asset(
                            widget.imagePaths[index],
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),

              // Controles de navegación (animados)
              FadeTransition(
                opacity: _scaleAnimation,
                child: Visibility(
                  visible: _showControls,
                  child: SafeArea(
                    child: Column(
                      children: [
                        // Barra superior
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          color: Colors.black45,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Imagen ${currentIndex + 1} de ${widget.imagePaths.length}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            ],
                          ),
                        ),

                        // Espacio flexible
                        const Spacer(),

                        // Controles inferiores
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          color: Colors.black45,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Botón anterior
                              IconButton(
                                icon: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color:
                                        currentIndex > 0
                                            ? Colors.white24
                                            : Colors.white10,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed:
                                    currentIndex > 0
                                        ? () {
                                          _pageController.previousPage(
                                            duration: const Duration(
                                              milliseconds: 300,
                                            ),
                                            curve: Curves.easeInOut,
                                          );
                                        }
                                        : null,
                              ),

                              // Botón de zoom
                              IconButton(
                                icon: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                    color: Colors.white24,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.zoom_in,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  // Aquí podrías implementar funcionalidad de zoom adicional
                                },
                              ),

                              // Botón siguiente
                              IconButton(
                                icon: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color:
                                        currentIndex <
                                                widget.imagePaths.length - 1
                                            ? Colors.white24
                                            : Colors.white10,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed:
                                    currentIndex < widget.imagePaths.length - 1
                                        ? () {
                                          _pageController.nextPage(
                                            duration: const Duration(
                                              milliseconds: 300,
                                            ),
                                            curve: Curves.easeInOut,
                                          );
                                        }
                                        : null,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FullScreenText extends StatelessWidget {
  final String fullText;

  const FullScreenText({super.key, required this.fullText});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
          maxWidth: MediaQuery.of(context).size.width * 0.9,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Cabecera con título y botón de cierre
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.description,
                        color: theme.colorScheme.primary,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Detalles del Proyecto',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: theme.colorScheme.primary),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),

            // Contenido con scroll
            Flexible(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Text(
                        fullText,
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.6,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Pie del diálogo con botón de cierre
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 10,
                      ),
                    ),
                    child: const Text('Cerrar'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
