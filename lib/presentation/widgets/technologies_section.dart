import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TecnologiasSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Tecnologías que uso',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 4, // Número de columnas
            childAspectRatio: 1.2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              _buildTechItem(FontAwesomeIcons.flutter, 'Flutter'),
              _buildTechItem(FontAwesomeIcons.code, 'dart'),
              _buildTechItem(FontAwesomeIcons.database, 'Sql'),
              _buildTechItem(FontAwesomeIcons.git, 'Git'),
              _buildTechItem(FontAwesomeIcons.database, 'Firebase'),
              _buildTechItem(FontAwesomeIcons.nodeJs, 'Node.js'),
              _buildTechItem(FontAwesomeIcons.html5, 'html/css/js'),
              _buildTechItem(FontAwesomeIcons.android, 'Android'),
              _buildTechItem(FontAwesomeIcons.github, 'GitHub'),
              _buildTechItem(FontAwesomeIcons.server, 'supabase'),
              

            ],
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
          color: Colors.blue,
        ), // Cambia el color según el estilo
        SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
