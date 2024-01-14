import 'package:flutter/material.dart';
import 'package:rfw/rfw.dart';

Widget expansionTile(BuildContext context, DataSource source) {
  return ExpansionTile(
    title: source.child(['title']),
    children: source.childList(['children']),
  );
}
