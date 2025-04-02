import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

const String shortDescription =
    'Soy un apasionado del desarrollo de software con experiencia en Flutter y tecnologías modernas para aplicaciones móviles. Me encanta construir soluciones eficientes y atractivas.';
const String longDescription = '''
Ingeniero en Informática egresado de DUOC UC con experiencia en desarrollo de aplicaciones móviles y web.
Especializado en Flutter y Dart, con enfoque en la creación de aplicaciones escalables y optimizadas para entornos multiplataforma. 
Experiencia en trabajo remoto y colaboración en equipos distribuidos, aplicando metodologías ágiles. 
Autodidacta, con capacidad para resolver problemas complejos y mejorar procesos de desarrollo.''';

class _AboutSectionState extends State<AboutSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 📸 Imagen de perfil
          CircleAvatar(
            radius: 6.w,
            backgroundImage: const AssetImage('assets/images/perfil.jpeg'),
          ),
          SizedBox(height: 2.h),
          // 📝 Nombre y título
          const Text(
            'Cesar Negrete\nDesarrollador de Software',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          SizedBox(height: 2.h),
          // 📄 Descripción corta/larga con animación
          AnimatedCrossFade(
            firstChild: Text(
              shortDescription,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.sp, color: theme.primaryColorLight),
            ),
            secondChild: Text(
              longDescription,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.sp, color: theme.primaryColorLight),
            ),
            crossFadeState:
                _isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
          // 🔽 Botón para expandir descripción
          TextButton(
            onPressed: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Text(
              _isExpanded ? 'Ver menos Sobre mí' : 'Más detalles Sobre mí',
              style: TextStyle(color: Colors.blue, fontSize: 16.sp),
            ),
          ),
        ],
      ),
    );
  }
}
