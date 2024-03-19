import 'package:design_note/token.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intersperse/intersperse.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// This is based on a Material Design use case
/// https://www.figma.com/community/file/1035203688168086460
/// https://m3.material.io/components

@widgetbook.UseCase(
  path: '[MD3 Kit]/Badges',
  name: 'Badges',
  type: Badge,
)
Widget bottomAppBarUseCase(BuildContext context) {
  final count = context.knobs.int.slider(
    label: 'Count',
    initialValue: 1,
    max: 100,
  );
  final colorScheme = Theme.of(context).colorScheme;
  final styleOption = [
    _StyleOption(
      label: 'Error',
      backgroundColor: colorScheme.error,
      textColor: colorScheme.onError,
    ),
    _StyleOption(
      label: 'Primary',
      backgroundColor: colorScheme.primary,
      textColor: colorScheme.onPrimary,
    ),
  ];
  final style = context.knobs.list(
    label: 'Style',
    initialOption: styleOption[0],
    labelBuilder: (option) => option.label,
    options: styleOption,
  );

  return Scaffold(
    body: SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(Spacing.medium.value),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Small Badge'),
                IconButton(
                  onPressed: () {},
                  icon: Badge(
                    backgroundColor: style.backgroundColor,
                    child: const Icon(
                      Symbols.notifications,
                    ),
                  ),
                ),
                const Text('Large Badge'),
                IconButton(
                  onPressed: () {},
                  icon: Badge.count(
                    count: count,
                    backgroundColor: style.backgroundColor,
                    textColor: style.textColor,
                    child: const Icon(
                      Symbols.mail,
                    ),
                  ),
                ),
              ].intersperse(Gap(Spacing.medium.value)).toList(),
            ),
          ),
        ),
      ),
    ),
  );
}

class _StyleOption {
  const _StyleOption({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
  });

  final String label;
  final Color backgroundColor;
  final Color textColor;
}
