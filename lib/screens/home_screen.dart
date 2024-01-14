import 'package:flutter/material.dart';
import 'package:rfw/rfw.dart';
import 'package:rfw_gallery/infra/runtime.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const _mainLibrary = '''
    import core.widgets; 
    import material;
    import rfw_gallery.rfw;
    import rfw_gallery.local;

    widget Root = RfwGalleryScreen(
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

  final _data = DynamicContent();
  final _runtime = createRuntime(_mainLibrary);

  @override
  Widget build(BuildContext context) {
    return RemoteWidget(
      runtime: _runtime,
      data: _data,
      widget: const FullyQualifiedWidgetName(mainLibraryName, 'Root'),
    );
  }
}
