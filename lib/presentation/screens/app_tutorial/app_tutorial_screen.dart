import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      'Busca la comida',
      'Amet nostrud dolore nostrud velit sit sunt adipisicing elit duis ullamco.',
      'assets/images/1.png'),
  SlideInfo(
      'Entrega rapida',
      'Irure laboris nulla deserunt eiusmod tempor laboris aute do esse do.',
      'assets/images/2.png'),
  SlideInfo(
      'Disfruta la comida',
      'Pariatur dolore officia consequat adipisicing voluptate magna quis.',
      'assets/images/3.png'),
];

class AppTutorialScreen extends StatelessWidget {
  static const String name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tittleStyle = Theme.of(context).textTheme.titleLarge;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            physics: const BouncingScrollPhysics(),
            children: [
              ...slides.map(
                (slidedata) => _Slide(
                  title: slidedata.title,
                  caption: slidedata.caption,
                  imageUrl: slidedata.imageUrl,
                ),
              )
            ],
          ),
          Positioned(
            right: 20,
            top: 20,
            child: TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text(
                'Salir',
                style: tittleStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final tittleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodyLarge;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 10),
            Text(
              title,
              style: tittleStyle,
            ),
            const SizedBox(height: 10),
            Text(
              caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
