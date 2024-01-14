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
  late final _runtime = createRuntime(widget._mainLibrary);

  @override
  Widget build(BuildContext context) {
    return RemoteWidget(
      runtime: _runtime,
      data: DynamicContent(),
      widget: const FullyQualifiedWidgetName(mainLibraryName, 'Main'),
    );
  }
}
