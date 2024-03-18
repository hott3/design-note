import 'package:design_note/knob_option.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intersperse/intersperse.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../token.dart';

/// This is based on a Material Design use case
/// https://www.figma.com/community/file/1035203688168086460
/// https://m3.material.io/components

@widgetbook.UseCase(
  path: '[MD3 Kit]/Floating action buttons',
  name: 'Floating action buttons',
  type: FloatingActionButton,
)
Widget buttonsUseCase(BuildContext context) {
  final colorScheme = Theme.of(context).colorScheme;
  final styleOption = [
    // Planning to confirm the issues to get SurfaceContainerHighest
    // - https://github.com/flutter/flutter/issues/115912
    // - https://github.com/flutter/flutter/pull/138521
    // ColorOption(name: 'Surface', value: colorScheme.surfaceContainerHighest),
    ColorOption(label: 'Primary', value: colorScheme.primaryContainer),
    ColorOption(label: 'Secondary', value: colorScheme.secondaryContainer),
    ColorOption(label: 'Tertiary', value: colorScheme.tertiaryContainer),
  ];
  final style = context.knobs.list(
    label: 'Style',
    initialOption: styleOption[0],
    labelBuilder: (option) => option.label,
    options: styleOption,
  );
  final radius = context.knobs.list(
    label: 'Radius',
    initialOption: Radius.medium,
    labelBuilder: (option) => option.name,
    options: Radius.values.map((value) => value).toList(),
  );
  final elevation = context.knobs.list(
    label: 'Elevation',
    initialOption: Elevation.level3,
    labelBuilder: (option) => option.name,
    options: Elevation.values.map((value) => value).toList(),
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
                const Text('Small FABs'),
                FloatingActionButton.small(
                  onPressed: () {},
                  backgroundColor: style.value,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius.value),
                  ),
                  elevation: elevation.value,
                  child: const Icon(Symbols.edit),
                ),
                const Text('FABs'),
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: style.value,
                  elevation: elevation.value,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius.value),
                  ),
                  child: const Icon(Symbols.edit),
                ),
                const Text('Large FABs'),
                FloatingActionButton.large(
                  onPressed: () {},
                  backgroundColor: style.value,
                  elevation: elevation.value,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius.value),
                  ),
                  child: const Icon(Symbols.edit),
                ),
                const Text('Extended FABs'),
                FloatingActionButton.extended(
                  onPressed: () {},
                  backgroundColor: style.value,
                  elevation: elevation.value,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius.value),
                  ),
                  label: Row(
                    children: [
                      const Icon(Symbols.edit),
                      Gap(Spacing.medium.value),
                      const Text('Extended FAB'),
                    ],
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
