import '../models/experience_item.dart';

class ExperienceRepository {
  List<ExperienceItem> getExperiences() {
    return [
      ExperienceItem(
        title: 'Desarrollador Flutter Freelance - Gestión de Inventario',
        shortDescription:
            'Desarrollo de aplicaciones móviles con Flutter para clientes independientes...',
        fullDescription:
            'Desarrollo de aplicaciones móviles con Flutter para clientes independientes. Creación de interfaces atractivas y optimizadas. '
            'Desarrollo de una app de gestión de inventario y envíos para un cliente particular, utilizando Flutter y Firebase como tecnologías.',
        imagePaths: [
          'assets/images/inven1.jpg',
          'assets/images/inven2.jpg',
          'assets/images/inven3.jpg',
          'assets/images/inven4.jpg',
          'assets/images/inven5.jpg',
        ],
      ),
      ExperienceItem(
        title: 'Práctica Profesional - Turistik',
        shortDescription: 'Desarrollador Flutter - Aplicación NPS Tótem',
        fullDescription:
            '''Se desarrolló una aplicación en Flutter para medir la satisfacción de los usuarios del parque Turistik, ubicado en el Cerro San Cristóbal. El proyecto consistió en crear una aplicación NPS (Net Promoter Score) Tótem, diseñada para ser implementada en tabletas ubicadas en distintas áreas del parque, como baños, teleférico, funicular, buses, cafetería, y parques de aventura para niños y adultos.

La aplicación permitió a los usuarios calificar su experiencia mediante emojis y colores, reflejando si su feedback era positivo, neutral o negativo. Las preguntas variaban según el servicio que se estaba evaluando en la tablet. Además, la aplicación estaba disponible en varios idiomas (español, inglés y portugués) y podía almacenar datos de manera offline, sincronizándolos cuando se recuperaba la conexión a internet.

Se construyó una API en Node.js que conectaba con una base de datos administrada en SQL Server, permitiendo la gestión de la información recabada. Mi rol principal fue el desarrollo de la aplicación en Flutter, la cual creé de forma independiente, aunque colaboré con el equipo en la integración con la base de datos y en la recopilación de requisitos del cliente para la entrega final de la aplicación...
        ''',
        imagePaths: [
          'assets/images/turis1.png',
          'assets/images/turis2.png',
          'assets/images/turis3.png',
          'assets/images/turis4.png',
          'assets/images/turis5.png',
          'assets/images/turis6.png',
          'assets/images/turis7.png',
        ],
      ),

      ExperienceItem(
        title: 'Práctica Laboral - Contraplano.cl Periódico Digital',
        shortDescription: 'Administración y gestión de contenido digital',
        fullDescription:
            '''Administrador de un sitio WordPress dirigido a noticias locales de la zona de Viña del Mar. Redactar y publicar noticias
        actualizar redes sociales 
        edicion de imagenes''',
        imagePaths: [
          'assets/images/con3.PNG',
          'assets/images/cont1.png',
          'assets/images/cont2.png',
        ],
      ),

      // Add other experiences here...
    ];
  }
}
