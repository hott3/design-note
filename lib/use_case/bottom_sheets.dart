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
  path: '[MD3 Kit]/Bottom Sheets',
  name: 'Bottom Sheets',
  type: BottomSheet,
)
Widget bottomSheetsUseCase(BuildContext context) {
  final mediaQuery = MediaQuery.sizeOf(context);
  final isModal = context.knobs.boolean(
    label: 'Modal',
    initialValue: true,
  );
  final elevationLevel = context.knobs.list(
    label: 'Elevation Level',
    initialOption: const Elevation().level3,
    options: [
      const Elevation().level0,
      const Elevation().level1,
      const Elevation().level2,
      const Elevation().level3,
      const Elevation().level4,
      const Elevation().level5,
    ],
  );

  return Padding(
    padding: EdgeInsets.all(AppToken.spacing.medium),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Bottom Sheet'),
        ElevatedButton(
          child: const Text('Show Bottom Sheet'),
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              showDragHandle: true,
              barrierColor: isModal ? null : Colors.transparent,
              // The background changes, but the shadow does not change
              elevation: elevationLevel,
              builder: (BuildContext context) {
                return SizedBox(
                  width: mediaQuery.width,
                  child: const _BottomSheetContents(),
                );
              },
            );
          },
        ),
        const Text('Full-screen Bottom Sheet'),
        ElevatedButton(
          child: const Text('Show Bottom Sheet'),
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              showDragHandle: true,
              // The background changes, but the shadow does not change
              elevation: elevationLevel,
              // By setting it, the height of the screen will be full
              isScrollControlled: true,
              builder: (BuildContext context) {
                return SizedBox(
                  height: mediaQuery.height,
                  width: mediaQuery.width,
                  child: const _BottomSheetContents(),
                );
              },
            );
          },
        ),
        Text(
          '* It does not work even if you specify the Device Addons setting.',
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ].intersperse(Gap(AppToken.spacing.medium)).toList(),
    ),
  );
}

class _BottomSheetContents extends StatelessWidget {
  const _BottomSheetContents({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(AppToken.spacing.medium),
          child: ElevatedButton(
            child: const Text('Close BottomSheet'),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }
}
