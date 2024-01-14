import 'package:flutter/material.dart';
import 'package:rfw_gallery/infra/rfw_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _mainLibrary = '''
    import core.widgets; 
    import material;
    import rfw_gallery.rfw;
    import rfw_gallery.local;

    widget Main = RfwGalleryScreen(
      child: Column(
        children: [
          SectionTitle(text: 'Categories'),
          MaterialCategoryCard(),
        ],
      ),
    );

    widget SectionTitle = ThemedText(
      text: args.text,
      style: 'headlineMedium',
    );

    widget MaterialCategoryCard = ExpansionTile(
      title: Padding(
        child: Text(text: 'MATERIAL'),
      ),
      children: [ 
        DemoTile(
          title: 'App bar',
          description: 
            'Displays information and actions relating to the current screen',
          screen: 'AppBarScreen',
        ),
      ],
    );

    widget DemoTile = ListTile(
      title: Text(text: args.title),
      subtitle: Text(text: args.description),
      leading: Icon(icon: 0xE047, fontFamily: "MaterialIcons"),
      onTap: event "goTo" {screen: args.screen},
    );
  ''';

  @override
  Widget build(BuildContext context) {
    return const RfwScreen(mainLibrary: _mainLibrary);
  }
}
