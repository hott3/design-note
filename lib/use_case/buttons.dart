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
  path: '[MD3 Kit]/Buttons',
  name: 'Buttons',
  type: ButtonStyleButton,
)
Widget buttonsUseCase(BuildContext context) {
  final labelText = context.knobs.string(
    label: 'Label Text',
    initialValue: 'Button',
  );
  final isDisabled = context.knobs.boolean(
    label: 'Disabled',
  );
  final isShowIcon = context.knobs.boolean(
    label: 'Show Icon',
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
                const Text('Filled buttons'),
                !isShowIcon
                    ? FilledButton(
                        onPressed: isDisabled ? null : () {},
                        child: Text(labelText),
                      )
                    : FilledButton.icon(
                        onPressed: isDisabled ? null : () {},
                        icon: const Icon(Symbols.add),
                        label: Text(labelText),
                      ),
                const Text('Outlined buttons'),
                !isShowIcon
                    ? OutlinedButton(
                        onPressed: isDisabled ? null : () {},
                        child: Text(labelText),
                      )
                    : OutlinedButton.icon(
                        onPressed: isDisabled ? null : () {},
                        icon: const Icon(Symbols.add),
                        label: Text(labelText),
                      ),
                const Text('Text buttons'),
                !isShowIcon
                    ? TextButton(
                        onPressed: isDisabled ? null : () {},
                        child: Text(labelText),
                      )
                    : TextButton.icon(
                        onPressed: isDisabled ? null : () {},
                        icon: const Icon(Symbols.add),
                        label: Text(labelText),
                      ),
                const Text('Elevated buttons'),
                !isShowIcon
                    ? ElevatedButton(
                        onPressed: isDisabled ? null : () {},
                        child: Text(labelText),
                      )
                    : ElevatedButton.icon(
                        onPressed: isDisabled ? null : () {},
                        icon: const Icon(Symbols.add),
                        label: Text(labelText),
                      ),
                const Text('Tonal buttons'),
                !isShowIcon
                    ? FilledButton.tonal(
                        onPressed: isDisabled ? null : () {},
                        child: Text(labelText),
                      )
                    : FilledButton.tonalIcon(
                        onPressed: isDisabled ? null : () {},
                        icon: const Icon(Symbols.add),
                        label: Text(labelText),
                      ),
              ].intersperse(Gap(Spacing.medium.value)).toList(),
            ),
          ),
        ),
      ),
    ),
  );
}
