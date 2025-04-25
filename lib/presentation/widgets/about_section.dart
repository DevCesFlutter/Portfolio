import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'dart:math';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

const String shortDescription =
    '​Soy desarrollador de software con experiencia en Flutter, Kotlin y Java, especializado en aplicaciones móviles eficientes y con excelente experiencia de usuario. Me enfoco en soluciones escalables y de alto rendimiento, aplicando principios sólidos de desarrollo.';
const String longDescription = '''
Como desarrollador de software, me especializo en Flutter, Kotlin y Java para la creación de aplicaciones móviles innovadoras y de alto rendimiento. Mi enfoque se centra en diseñar
soluciones escalables que brinden una experiencia de usuario excepcional, aplicando principios sólidos de desarrollo y mejores prácticas. Además, poseo habilidades en Cloud Computing y manejo de bases 
de datos, lo que me permite ofrecer soluciones integrales y adaptadas a las necesidades del mercado actual ''';

class _AboutSectionState extends State<AboutSection>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 📸 Imagen de perfil con animación de neón
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Container(
                padding: EdgeInsets.all(0.1.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color: Colors.transparent,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.lightBlue.withOpacity(
                          0.5 + 0.5 * sin(_controller.value * 2 * pi)),
                      blurRadius: 5,
                      blurStyle: BlurStyle.inner,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: CircleAvatar(
                  radius: 6.w,
                  backgroundImage:
                      const AssetImage('assets/images/perfil.jpeg'),
                ),
              );
            },
          ),
          SizedBox(height: 2.h),
          // 📝 Nombre y título
          const Text(
            'Cesar Negrete\nIngeniero en informatica',
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
                _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
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