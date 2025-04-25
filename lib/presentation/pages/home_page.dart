import 'package:flutter/material.dart';
import 'package:portafolio_web/presentation/widgets/comonn/gradient_divider.dart';
import 'package:portafolio_web/presentation/widgets/Contacto/contacto.dart';
import 'package:portafolio_web/presentation/widgets/Experiencia/experiencia_section.dart';
import 'package:portafolio_web/presentation/widgets/Appbar/custom_appbar.dart';
import 'package:portafolio_web/presentation/widgets/Tecnologias/technologies_section.dart';
import 'package:sizer/sizer.dart';
import '../widgets/About/about_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Creamos un ScrollController para manejar el desplazamiento
  final ScrollController _scrollController = ScrollController();

  // GlobalKeys para acceder a las posiciones de las secciones
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _experienciaKey = GlobalKey();
  final GlobalKey _tecnologiasKey = GlobalKey();
  final GlobalKey _contactoKey = GlobalKey();

  // Método para desplazarse a una sección específica
  void _scrollToSection(int index) {
    // Dependiendo del índice, desplazarse a la sección correspondiente
    double offset = 0;
    switch (index) {
      case 1:
        offset = _getSectionOffset(_aboutKey);
        break;
      case 2:
        offset = _getSectionOffset(_experienciaKey);
        break;
      case 3:
        offset = _getSectionOffset(_tecnologiasKey);
        break;
      case 4:
        offset = _getSectionOffset(_contactoKey);
        break;
    }

    // Desplazarse a la sección correspondiente
    _scrollController.animateTo(
      offset,
      duration: const Duration(seconds: 1), // Duración del desplazamiento
      curve: Curves.easeInOut, // Curva de animación
    );
  }

  // Función que obtiene la posición de la sección
  double _getSectionOffset(GlobalKey key) {
    final RenderBox? renderBox =
        key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final position = renderBox.localToGlobal(
        Offset.zero,
        ancestor: context.findRenderObject(),
      );
      return _scrollController.offset + position.dy;
    }
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          appBar: CustomAppBar(
            onNavItemTapped:
                _scrollToSection, // Pasamos la función a CustomAppBar
          ),
          body: SingleChildScrollView(
            controller: _scrollController, // Asociamos el ScrollController
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  AboutSection(key: _aboutKey),
                  SizedBox(height: 20.h), // Espaciado entre secciones
                  GradientDivider(), // Línea divisoria
                  SizedBox(height: 30.h), // Espaciado adicional
                  ExperienciaSection(key: _experienciaKey),
                  SizedBox(height: 10.h),
                  GradientDivider(), // Línea divisoria
                  TecnologiasSection(key: _tecnologiasKey),
                  GradientDivider(),
                  SizedBox(height: 15.h),
                  Contacto(key: _contactoKey),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
