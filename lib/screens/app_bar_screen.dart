import 'package:flutter/material.dart';
import 'package:rfw_gallery/infra/rfw_screen.dart';

class AppBarScreen extends StatelessWidget {
  static const _mainLibrary = '''
    import core.widgets; 
    import material;
    import rfw_gallery.rfw;
    import rfw_gallery.local;

    widget Main = RfwGalleryScreen(
      title: 'App bar screen',
      child: Center(
        child: Text(text: '...Work in progress...'),
      ),
    );
  ''';

  const AppBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RfwScreen(
      data: DynamicContent(),
      mainLibrary: _mainLibrary,
    );
  }
}
