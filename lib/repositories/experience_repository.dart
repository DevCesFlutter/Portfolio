import '../models/experience_item.dart';

class ExperienceRepository {
  List<ExperienceItem> getExperiences() {
    return [
      ExperienceItem(
        title: 'Práctica Profesional - Turistik',
        shortDescription:
            'Desarrollo de una aplicación en Flutter para medir la satisfacción de los usuarios del parque Turistik, ubicado en el Cerro San Cristóbal. La app NPS (Net Promoter Score) Tótem permitía a los usuarios calificar su experiencia mediante emojis en tabletas ubicadas en diversas áreas del parque Tecnologias:Flutter,Dart,node.js,express,sql server.',
        fullDescription: '''
Se desarrolló una aplicación en Flutter para medir la satisfacción de los usuarios del parque Turistik, ubicado en el Cerro San Cristóbal. El proyecto consistió en crear una aplicación NPS (Net Promoter Score) Tótem, diseñada para ser implementada en tabletas ubicadas en distintas áreas del parque, como baños, teleférico, funicular, buses, cafetería y parques de aventura para niños y adultos.

La aplicación permitió a los usuarios calificar su experiencia mediante emojis y colores, reflejando si su feedback era positivo, neutral o negativo. Las preguntas variaban según el servicio que se estaba evaluando en la tablet. Además, la aplicación estaba disponible en varios idiomas (español, inglés y portugués) y podía almacenar datos de manera offline, sincronizándolos cuando se recuperaba la conexión a internet.

Se construyó una API en Node.js que conectaba con una base de datos administrada en SQL Server, permitiendo la gestión de la información recabada. Mi rol principal fue el desarrollo de la aplicación en Flutter, la cual creé de forma independiente, aunque colaboré con el equipo en la integración con la base de datos y en la recopilación de requisitos del cliente para la entrega final de la aplicación.
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
        title:
            'Desarrollador Multiplataforma Freelance - Gestión de Inventario',
        shortDescription:
            'Aplicación multiplataforma desarrollada para un cliente Propio, enfocada en la gestión de inventario, pedidos y envíos. Permite llevar un registro del stock, los envíos que están por realizarse y los envíos ya realizados.Tecnologias:Flutter/dart/SupaBase',
        fullDescription: '''
Inventarius App
Solución de software multiplataforma (Android/Windows) para la gestión de inventario, pedidos y envíos.

Inventarius es una aplicación desarrollada como una solución informática real para un cliente emprendedor, con el objetivo de optimizar la gestión de productos, controlar el stock disponible y llevar un seguimiento detallado de los envíos por realizar y los ya realizados.

La aplicación fue construida utilizando Flutter para garantizar una experiencia fluida y coherente en múltiples plataformas (Android, iOS y web), y Supabase como backend para el almacenamiento seguro de datos, autenticación y gestión en tiempo real de la información.

El desarrollo se realizó siguiendo principios de arquitectura limpia y SOLID, organizando el proyecto en módulos reutilizables que facilitan su escalabilidad y mantenimiento. Además, se diseñó una interfaz moderna, responsiva y centrada en la experiencia del usuario, permitiendo un acceso ágil desde distintos dispositivos con una misma cuenta.

Inventarius representa un proyecto funcional y profesional que resuelve una necesidad concreta de gestión logística, demostrando la capacidad de llevar una idea desde el diseño hasta una solución completamente operativa.
''',
        imagePaths: [
          'assets/images/inven1.1.png',
          'assets/images/inven.png',
          'assets/images/inven1.2.png',
          'assets/images/inven1.3.png',
          'assets/images/inven1.4.png',
          'assets/images/inven1.5.png',
          'assets/images/inven1.6.png',
        ],
      ),

      ExperienceItem(
        title: 'Práctica Laboral - Contraplano.cl Periódico Digital',
        shortDescription:
            'Administración y gestión de contenidos digitales en periódico digital; redacción, edición y publicación./WordPress/html',
        fullDescription: '''
Administrador de un sitio WordPress dirigido a noticias locales de la zona de Viña del Mar. Responsabilidades:

- Redacción y publicación de noticias.
- Actualización de redes sociales.
- Edición de video.
- Edición de imágenes.
- Creación de videos con IA.
''',
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
