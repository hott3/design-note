import 'package:design_note/token.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intersperse/intersperse.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// This is based on a Material Design use case
/// https://www.figma.com/community/file/1035203688168086460
/// https://m3.material.io/components

@widgetbook.UseCase(
  path: '[MD3 Kit]/Buttons/Common buttons',
  name: 'Common buttons',
  type: ButtonStyleButton,
)
Widget elevatedButtonUseCase(BuildContext context) {
  final labelText = context.knobs.string(
    label: 'Label Text',
    initialValue: 'Button',
  );
  final isDisabled = context.knobs.boolean(
    label: 'Disabled',
  );

  return Padding(
    padding: EdgeInsets.all(AppToken.spacing.medium),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Filled buttons'),
        FilledButton(
          onPressed: isDisabled ? null : () {},
          child: Text(labelText),
        ),
        const Text('Outlined buttons'),
        OutlinedButton(
          onPressed: isDisabled ? null : () {},
          child: Text(labelText),
        ),
        const Text('Text buttons'),
        TextButton(
          onPressed: isDisabled ? null : () {},
          child: Text(labelText),
        ),
        const Text('Elevated buttons'),
        ElevatedButton(
          onPressed: isDisabled ? null : () {},
          child: Text(labelText),
        ),
        const Text('Tonal buttons'),
        FilledButton.tonal(
          onPressed: isDisabled ? null : () {},
          child: Text(labelText),
        ),
      ].intersperse(Gap(AppToken.spacing.medium)).toList(),
    ),
  );
}
