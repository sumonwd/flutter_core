import 'package:flutter/material.dart';
import '../../core/utils.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key, required this.text, this.color, this.styleFormat = 'bodyMedium', this.size});
  final String text;
  final Color? color;
  final String styleFormat;
  final double? size;

  TextStyle? textStyleConvert(String text) {
    switch (text) {
      case 'displayLarge':
        return Utils.textTheme.displayLarge;
      case 'displayMedium':
        return Utils.textTheme.displayMedium;
      case 'displaySmall':
        return Utils.textTheme.displaySmall;
      case 'headlineLarge':
        return Utils.textTheme.headlineLarge;
      case 'headlineMedium':
        return Utils.textTheme.headlineMedium;
      case 'headlineSmall':
        return Utils.textTheme.headlineSmall;
      case 'bodyLarge':
        return Utils.textTheme.bodyLarge;
      case 'bodyMedium':
        return Utils.textTheme.bodyMedium;
      case 'bodySmall':
        return Utils.textTheme.bodySmall;
      case 'titleMedium':
        return Utils.textTheme.titleMedium;
      case 'titleSmall':
        return Utils.textTheme.titleSmall;
      case 'labelLarge':
        return Utils.textTheme.labelLarge;
      case 'labelMedium':
        return Utils.textTheme.labelMedium;
      case 'labelSmall':
        return Utils.textTheme.labelSmall;
      default:
        return Utils.textTheme.bodyMedium;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(text, style: textStyleConvert(styleFormat)?.copyWith(color: color, fontSize: size));
  }
}
