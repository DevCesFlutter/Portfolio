import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class YoutubeVideoEmbed extends StatelessWidget {
  final String videoId;

  const YoutubeVideoEmbed({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    final videoUrl =
        'https://www.youtube.com/embed/$videoId?autoplay=1&mute=1&modestbranding=1&rel=0&playsinline=1';

    return HtmlWidget(
      '''
      <iframe width="100%" height="500"
        src="$videoUrl"
        frameborder="0"
        allow="autoplay; encrypted-media; picture-in-picture"
        allowfullscreen>
      </iframe>
      ''',
    );
  }
}
