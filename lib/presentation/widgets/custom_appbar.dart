import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(int) onNavItemTapped; // Función para manejar la navegación

  const CustomAppBar({super.key, required this.onNavItemTapped});

  @override
  Size get preferredSize => Size.fromHeight(60); // Altura personalizada del AppBar

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Portafolio Web',
        style: TextStyle(
          fontSize: 2.w, // Tamaño responsivo
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.blueAccent,
      elevation: 20,
      shadowColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      actions: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildNavItem(Icons.person, "Sobre mí", 1),
            _buildNavItem(Icons.workspace_premium, "Experiencia", 2),
            _buildNavItem(Icons.build, "Tecnologias", 3),
            _buildNavItem(Icons.contact_mail, "Contacto", 4),
          ],
        ),
      ],
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w), // Espaciado responsivo
      child: GestureDetector(
        onTap:
            () => onNavItemTapped(index), // Llamamos a la función con el índice
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 2.w), // Tamaño responsivo
            SizedBox(width: 1.w), // Espacio entre icono y texto
            Text(label, style: TextStyle(color: Colors.white, fontSize: 2.w)),
          ],
        ),
      ),
    );
  }
}
