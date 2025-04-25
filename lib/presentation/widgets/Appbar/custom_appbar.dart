import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(int) onNavItemTapped;

  const CustomAppBar({super.key, required this.onNavItemTapped});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Portafolio',
        style: TextStyle(
          fontSize: 2.w,
          fontWeight: FontWeight.bold,
          color: Colors.cyanAccent.shade200,
          shadows: [Shadow(color: Colors.blueAccent, blurRadius: 10)],
        ),
      ),
      backgroundColor: Colors.grey.shade900,
      elevation: 20,
      shadowColor: Colors.blueAccent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      actions: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildNavItem(Icons.person, "Sobre mí", 1),
            _buildNavItem(Icons.workspace_premium, "Experiencia", 2),
            _buildNavItem(Icons.build, "Tecnologías", 3),
            _buildNavItem(Icons.contact_mail, "Contacto", 4),
          ],
        ),
      ],
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: GestureDetector(
        onTap: () => onNavItemTapped(index),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Row(
            children: [
              Icon(icon, color: Colors.white, size: 2.5.w),
              SizedBox(width: 1.w),
              Text(
                label,
                style: TextStyle(
                  color: Colors.cyanAccent.shade200,
                  fontSize: 2.w,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(color: Colors.blueAccent, blurRadius: 10)],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
