import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Necesitas agregar esta dependencia en tu pubspec.yaml

class Contacto extends StatefulWidget {
  const Contacto({super.key});

  @override
  _ContactoState createState() => _ContactoState();
}

class _ContactoState extends State<Contacto> {
  double _scale = 1.0; // Para animar el tamaño al presionar el botón

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Contactame aquí',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2, // Número de columnas
            childAspectRatio: 1.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              _buildContactItem(
                Icons.email,
                'Email',
                'mailto:cesarnegretes100@gmail.com', // Aquí tu correo
              ),
              _buildContactItem(
                Icons.phone,
                'Teléfono',
                'https://wa.me/+56953373116', // Aquí tu número de WhatsApp
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String label, String url) {
    return GestureDetector(
      onTap: () => _launchURL(url),
      onLongPress: () {
        setState(() {
          _scale = 1.2; // Escala al presionar el botón
        });
      },
      onLongPressUp: () {
        setState(() {
          _scale = 1.0; // Restablece la escala cuando se suelta
        });
      },
      child: AnimatedScale(
        scale: _scale, // Aplicamos la animación de escala
        duration: Duration(milliseconds: 100), // Duración de la animación
        curve: Curves.easeInOut, // Tipo de animación
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw Exception('No se pudo abrir la URL: $url');
    }
  }
}
