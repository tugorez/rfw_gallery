import 'package:flutter/material.dart';
import 'package:rfw_gallery/infra/rfw_screen.dart';
import 'package:rfw_gallery/infra/argument_encoder.dart';

class HomeScreen extends StatelessWidget {
  static const _mainLibrary = '''
    import core.widgets; 
    import material;
    import rfw_gallery.rfw;
    import rfw_gallery.local;

    widget Main = RfwGalleryScreen(
      title: 'RFW Gallery',
      child: Column(
        children: [
          SectionTitle(text: 'Categories'),
          ...for category in data.categories:
            Category(
              title: category.name,
              icon: category.icon,
              examples: category.examples,
            ),
        ],
      ),
    );

    widget SectionTitle = ThemedText(
      text: args.text,
      style: 'headlineMedium',
    );

    widget Category = ExpansionTile(
      title: Padding(
        child: Text(text: args.title),
      ),
      leading: CategoryIcon(icon: args.icon),
      children: [
        ...for example in args.examples:
          DemoTile(
            title: example.title,
            description: example.description,
            icon: example.icon,
            screen: example.screen,
          ),
      ],
    );

    widget DemoTile = ListTile(
      title: Text(text: args.title),
      subtitle: Text(text: args.description),
      leading: CategoryIcon(icon: args.icon),
      onTap: event "goToScreen" {screen: args.screen},
    );

    widget CategoryIcon = Icon(
      icon: args.icon.codePoint,
      fontFamily: args.icon.fontFamily,
    );
  ''';

  final DynamicContent _data = DynamicContent()
    ..update('categories', _categories.encode());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RfwScreen(
      data: _data,
      mainLibrary: _mainLibrary,
    );
  }

  static const List<_Category> _categories = <_Category>[
    _Category(
      name: 'MATERIAL',
      icon: Icons.web_asset,
      examples: [
        _Example(
          title: 'App bar',
          description:
              'Displays information and actions relating to the current screen',
          icon: Icons.web_asset,
          screen: '/AppBar',
        ),
      ],
    ),
    _Category(
      name: 'CUPERTINO',
      icon: Icons.dashboard,
      examples: [],
    ),
    _Category(
      name: 'ADVANCED',
      icon: Icons.flutter_dash,
      examples: [
        _Example(
          title: 'Animations',
          description:
              'Shows how easily it is to express animations using RFW.',
          icon: Icons.circle_sharp,
          screen: '/Animations',
        ),
      ],
    ),
  ];
}

class _Category implements _Encodable {
  final String name;
  final IconData icon;
  final List<_Example> examples;

  const _Category({
    required this.name,
    required this.icon,
    required this.examples,
  });

  @override
  Map<String, Object?> encode() => {
        'name': name,
        'icon': ArgumentEncoder.iconData(icon),
        'examples': examples.encode(),
      };
}

class _Example implements _Encodable {
  final String title;
  final String description;
  final IconData icon;
  final String screen;

  const _Example({
    required this.title,
    required this.description,
    required this.icon,
    required this.screen,
  });

  @override
  Map<String, Object?> encode() => <String, Object?>{
        'title': title,
        'description': description,
        'icon': ArgumentEncoder.iconData(icon),
        'screen': screen,
      };
}

extension on List<_Encodable> {
  List<Map<String, Object?>> encode() =>
      [for (final item in this) item.encode()];
}

abstract class _Encodable {
  Map<String, Object?> encode();
}
