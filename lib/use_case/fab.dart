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
    ColorOption(name: 'Primary', value: colorScheme.primaryContainer),
    ColorOption(name: 'Secondary', value: colorScheme.secondaryContainer),
    ColorOption(name: 'Tertiary', value: colorScheme.tertiaryContainer),
  ];
  final style = context.knobs.list(
    label: 'Style',
    initialOption: styleOption[0],
    labelBuilder: (option) => option.name,
    options: styleOption,
  );
  final radiusOption = [
    RadiusOption(name: 'Full', value: AppToken.radius.full),
    RadiusOption(name: 'Large', value: AppToken.radius.large),
    RadiusOption(name: 'Medium', value: AppToken.radius.medium),
    RadiusOption(name: 'None', value: AppToken.radius.none),
  ];
  final radius = context.knobs.list(
    label: 'Radius',
    initialOption: radiusOption[2],
    labelBuilder: (option) => option.name,
    options: radiusOption,
  );
  final elevationOption = [
    ElevationOption(name: '0', value: AppToken.elevation.level0),
    ElevationOption(name: '1', value: AppToken.elevation.level1),
    ElevationOption(name: '2', value: AppToken.elevation.level2),
    ElevationOption(name: '3', value: AppToken.elevation.level3),
    ElevationOption(name: '4', value: AppToken.elevation.level4),
    ElevationOption(name: '5', value: AppToken.elevation.level5),
  ];
  final elevation = context.knobs.list(
    label: 'Elevation',
    initialOption: elevationOption[3],
    labelBuilder: (option) => option.name,
    options: elevationOption,
  );

  return Scaffold(
    body: SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(AppToken.spacing.medium),
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
                      Gap(AppToken.spacing.medium),
                      const Text('Extended FAB'),
                    ],
                  ),
                ),
              ].intersperse(Gap(AppToken.spacing.medium)).toList(),
            ),
          ),
        ),
      ),
    ),
  );
}
