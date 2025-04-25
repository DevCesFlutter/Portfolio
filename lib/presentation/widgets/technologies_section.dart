import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TecnologiasSection extends StatelessWidget {
  const TecnologiasSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Tecnologías que domino',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width < 600 ? 20 : 24, // Ajustamos el tamaño del texto
              fontWeight: FontWeight.bold,
              color: Colors.cyanAccent.shade200,
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: LayoutBuilder(
              builder: (context, constraints) {
                int columns = 4; // Número de columnas predeterminado
            
                if (constraints.maxWidth < 600) {
                  columns = 2; // Menos columnas en pantallas más pequeñas
                } else if (constraints.maxWidth < 1000) {
                  columns = 3; // Tres columnas en tamaños medianos
                }
            
                return GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: columns,
                  childAspectRatio: 1,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  children: [
                    _buildTechItem(FontAwesomeIcons.flutter, 'Flutter'),
                    _buildTechItem(FontAwesomeIcons.code, 'Dart'),
                    _buildTechItem(FontAwesomeIcons.database, 'SQL'),
                    _buildTechItem(FontAwesomeIcons.git, 'Git'),
                    _buildTechItem(FontAwesomeIcons.database, 'Firebase'),
                    _buildTechItem(FontAwesomeIcons.nodeJs, 'Node.js'),
                    _buildTechItem(FontAwesomeIcons.html5, 'HTML/CSS/JS'),
                    _buildTechItem(FontAwesomeIcons.android, 'Android'),
                    _buildTechItem(FontAwesomeIcons.github, 'GitHub'),
                    _buildTechItem(FontAwesomeIcons.server, 'Supabase'),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTechItem(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 40,
          color: Colors.cyanAccent.shade200,
        ),
        SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.cyanAccent.shade100,
          ),
        ),
      ],
    );
  }
}
