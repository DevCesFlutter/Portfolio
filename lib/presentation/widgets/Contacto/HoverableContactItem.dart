import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HoverableContactItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final String url;

  const HoverableContactItem({
    super.key,
    required this.icon,
    required this.label,
    required this.url,
  });

  @override
  // ignore: library_private_types_in_public_api
  _HoverableContactItemState createState() => _HoverableContactItemState();
}

class _HoverableContactItemState extends State<HoverableContactItem> {
  bool _isHovered = false;

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw Exception('No se pudo abrir la URL: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchURL(widget.url),
        child: AnimatedScale(
          scale: _isHovered ? 1.2 : 1.0,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, size: 40, color: Colors.white),
              SizedBox(height: 10),
              Text(
                widget.label,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
