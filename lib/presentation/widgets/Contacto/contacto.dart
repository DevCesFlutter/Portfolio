import 'package:flutter/material.dart';
import 'package:portafolio_web/presentation/widgets/Contacto/HoverableContactItem.dart';

class Contacto extends StatelessWidget {
  const Contacto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Contáctame aquí',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              HoverableContactItem(
                icon: Icons.email,
                label: 'Email',
                url: 'mailto:cesarnegretes100@gmail.com',
              ),
              HoverableContactItem(
                icon: Icons.phone,
                label: 'Teléfono',
                url: 'https://wa.me/+56953373116',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
