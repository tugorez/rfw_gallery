import 'package:flutter/material.dart';
import 'package:rfw/rfw.dart';
import 'package:rfw_gallery/infra/runtime.dart';
export 'package:rfw/rfw.dart' show DynamicContent;

class RfwScreen extends StatefulWidget {
  final String mainLibrary;
  final DynamicContent data;

  const RfwScreen({
    super.key,
    required this.mainLibrary,
    required this.data,
  });

  @override
  State<RfwScreen> createState() => _RfwScreenState();
}

class _RfwScreenState extends State<RfwScreen> {
  late final _runtime = createRuntime(widget.mainLibrary);

  @override
  Widget build(BuildContext context) {
    widget.data.update(
      'screenSize',
      MediaQuery.of(context).size.width < 1024 ? 'small' : 'big',
    );

    return RemoteWidget(
      runtime: _runtime,
      data: widget.data,
      widget: const FullyQualifiedWidgetName(mainLibraryName, 'Main'),
      onEvent: (String name, DynamicMap arguments) {
        if (name != 'goToScreen') return;

        final String screen = arguments['screen'] as String;
        Navigator.pushNamed(context, screen);
      },
    );
  }
}
