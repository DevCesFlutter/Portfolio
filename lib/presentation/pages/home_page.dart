import 'package:flutter/material.dart';
import 'package:portafolio_web/presentation/widgets/contacto.dart';
import 'package:portafolio_web/presentation/widgets/custom_appbar.dart';
import 'package:portafolio_web/presentation/widgets/Experiencia/experiencia_section.dart';
import 'package:portafolio_web/presentation/widgets/technologies_section.dart';
import 'package:sizer/sizer.dart';
import '../widgets/about_section.dart';
// Importamos el nuevo widget

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Creamos un ScrollController para manejar el desplazamiento
  final ScrollController _scrollController = ScrollController();

  // Método para desplazarse a una sección específica
  void _scrollToSection(int index) {
    // Obtener la altura de la pantalla
    double screenHeight = MediaQuery.of(context).size.height;

    // Ajustamos el desplazamiento según el índice de la sección
    double offset = 0;
    switch (index) {
      case 1:
        offset = 0; // Sobre mí
        break;
      case 2:
        offset =
            screenHeight; // Experiencia, por ejemplo, puede ser 1 pantalla de altura
        break;
      case 3:
        offset =
            screenHeight *
            3; // Tecnologías, ajustado como dos pantallas de altura
        break;
      case 4:
        offset =
            screenHeight *
            4; // Contacto, ajustado como tres pantallas de altura
        break;
    }

    // Desplazarse a la sección correspondiente
    _scrollController.animateTo(
      offset, // Aquí se utiliza un valor de desplazamiento ajustado
      duration: const Duration(seconds: 1), // Duración del desplazamiento
      curve: Curves.easeInOut, // Curva de animación
    );
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
                  AboutSection(),
                  SizedBox(height: 20.h), // Espaciado entre secciones
                  Divider(color: Colors.grey, thickness: 1), // Línea divisoria
                  SizedBox(height: 30.h), // Espaciado adicional
                  ExperienciaSection(),
                  SizedBox(height: 10.h),
                  Divider(color: Colors.grey, thickness: 1), // Línea divisoria
                  TecnologiasSection(),
                  Divider(color: Colors.grey, thickness: 1),
                  SizedBox(height: 15.h),
                  Contacto(),
                  // Puedes agregar más secciones aquí de forma similar
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
