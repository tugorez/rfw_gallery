import 'package:flutter/material.dart';
import 'package:rfw/rfw.dart';
import 'package:rfw_gallery/infra/runtime.dart';

class RfwScreen extends StatefulWidget {
  final String _mainLibrary;

  const RfwScreen({
    super.key,
    required String mainLibrary,
  }) : _mainLibrary = mainLibrary;

  @override
  State<RfwScreen> createState() => _RfwScreenState();
}

class _RfwScreenState extends State<RfwScreen> {
  late final _data = DynamicContent()..update('icon', _icons);
  late final _runtime = createRuntime(widget._mainLibrary);

  @override
  Widget build(BuildContext context) {
    return RemoteWidget(
      runtime: _runtime,
      data: _data,
      widget: const FullyQualifiedWidgetName(mainLibraryName, 'Main'),
      onEvent: (String name, DynamicMap arguments) {
        if (name != 'goToScreen') return;

        final String screen = arguments['screen'] as String;
        Navigator.pushNamed(context, screen);
      },
    );
  }

  static final DynamicMap _icons = <String, Object?>{
    'web_asset': <String, Object?>{
      'codePoint': Icons.web_asset.codePoint,
      'fontFamily': Icons.web_asset.fontFamily,
    },
  };
}
