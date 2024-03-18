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
  path: '[MD3 Kit]/Bottom sheets',
  name: 'Bottom sheets',
  type: BottomSheet,
)
Widget bottomSheetsUseCase(BuildContext context) {
  final mediaQuery = MediaQuery.sizeOf(context);
  final isModal = context.knobs.boolean(
    label: 'Modal',
    initialValue: true,
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
                const Text('Bottom Sheet'),
                ElevatedButton(
                  child: const Text('Show Bottom Sheet'),
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      showDragHandle: true,
                      barrierColor: isModal ? null : Colors.transparent,
                      // The background changes, but the shadow does not change
                      elevation: elevation.value,
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
                      elevation: elevation.value,
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
              ].intersperse(Gap(Spacing.medium.value)).toList(),
            ),
          ),
        ),
      ),
    ),
  );
}

class _BottomSheetContents extends StatelessWidget {
  const _BottomSheetContents();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(Spacing.medium.value),
          child: ElevatedButton(
            child: const Text('Close BottomSheet'),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }
}
