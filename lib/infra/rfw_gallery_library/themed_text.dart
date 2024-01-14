import 'package:flutter/material.dart';
import 'package:rfw/rfw.dart';

Widget themedText(BuildContext context, DataSource source) {
  String? text = source.v<String>(['text']);
  if (text == null) {
    final StringBuffer builder = StringBuffer();
    final int count = source.length(['text']);
    for (int index = 0; index < count; index += 1) {
      builder.write(source.v<String>(['text', index]) ?? '');
    }
    text = builder.toString();
  }

  final String? style = source.v<String>(['style']);
  final TextTheme textTheme = Theme.of(context).textTheme;
  final TextStyle? textStyle = switch (style) {
    'displayLarge' => textTheme.displayLarge,
    'displayMedium' => textTheme.displayMedium,
    'displaySmall' => textTheme.displaySmall,
    'headlineLarge' => textTheme.headlineLarge,
    'headlineMedium' => textTheme.headlineMedium,
    'headlineSmall' => textTheme.headlineSmall,
    'titleLarge' => textTheme.titleLarge,
    'titleMedium' => textTheme.titleMedium,
    'titleSmall' => textTheme.titleSmall,
    'bodyLarge' => textTheme.bodyLarge,
    'bodyMedium' => textTheme.bodyMedium,
    'bodySmall' => textTheme.bodySmall,
    'labelLarge' => textTheme.labelLarge,
    'labelMedium' => textTheme.labelMedium,
    'labelSmall' => textTheme.labelSmall,
    _ => ArgumentDecoders.textStyle(source, ['style']),
  };

  return Text(
    text,
    style: textStyle,
    strutStyle: ArgumentDecoders.strutStyle(source, ['strutStyle']),
    textAlign: ArgumentDecoders.enumValue<TextAlign>(
        TextAlign.values, source, ['textAlign']),
    textDirection: ArgumentDecoders.enumValue<TextDirection>(
        TextDirection.values, source, ['textDirection']),
    locale: ArgumentDecoders.locale(source, ['locale']),
    softWrap: source.v<bool>(['softWrap']),
    overflow: ArgumentDecoders.enumValue<TextOverflow>(
        TextOverflow.values, source, ['overflow']),
    textScaleFactor:
        source.v<double>(['textScaleFactor']), // ignore: deprecated_member_use
    maxLines: source.v<int>(['maxLines']),
    semanticsLabel: source.v<String>(['semanticsLabel']),
    textWidthBasis: ArgumentDecoders.enumValue<TextWidthBasis>(
        TextWidthBasis.values, source, ['textWidthBasis']),
    textHeightBehavior:
        ArgumentDecoders.textHeightBehavior(source, ['textHeightBehavior']),
  );
}
