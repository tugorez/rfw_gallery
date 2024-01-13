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

    widget Root = Scaffold(
      appBar: AppBar(title: Text(text: 'RFW Gallery')),
      body: Body(),
    );

    widget Body = Center(
      child: Text(text: 'Hello world!'),
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
