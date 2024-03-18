import 'package:design_note/knob_option.dart';
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
  path: '[MD3 Kit]/Bottom app bars',
  name: 'Bottom app bars',
  type: BottomAppBar,
)
Widget bottomAppBarUseCase(BuildContext context) {
  final isShowFab = context.knobs.boolean(
    label: 'Show FAB',
    initialValue: true,
  );
  final isSmall = context.knobs.boolean(
    label: 'Small FAB',
  );
  final fabLocationOption = [
    const FloatingActionButtonLocationOption(
      label: 'endContained',
      value: FloatingActionButtonLocation.endContained,
    ),
    FloatingActionButtonLocationOption(
      label: 'End Docked',
      value: isSmall
          ? FloatingActionButtonLocation.miniEndDocked
          : FloatingActionButtonLocation.endDocked,
    ),
    FloatingActionButtonLocationOption(
      label: 'Center Docked',
      value: isSmall
          ? FloatingActionButtonLocation.miniCenterDocked
          : FloatingActionButtonLocation.centerDocked,
    ),
    FloatingActionButtonLocationOption(
      label: 'Start Docked',
      value: isSmall
          ? FloatingActionButtonLocation.miniStartDocked
          : FloatingActionButtonLocation.startDocked,
    ),
    FloatingActionButtonLocationOption(
      label: 'End Float',
      value: isSmall
          ? FloatingActionButtonLocation.miniEndFloat
          : FloatingActionButtonLocation.endFloat,
    ),
    FloatingActionButtonLocationOption(
      label: 'Center Float',
      value: isSmall
          ? FloatingActionButtonLocation.miniCenterFloat
          : FloatingActionButtonLocation.centerFloat,
    ),
    FloatingActionButtonLocationOption(
      label: 'Start Float',
      value: isSmall
          ? FloatingActionButtonLocation.miniStartFloat
          : FloatingActionButtonLocation.startFloat,
    ),
  ];
  final fabLocation = context.knobs.list(
    label: 'FAB Location',
    initialOption: fabLocationOption.first,
    labelBuilder: (option) => option.label,
    options: fabLocationOption,
  );
  final isElevation = context.knobs.boolean(
    label: 'Bottom App Bar Elevation',
    initialValue: true,
  );

  return Scaffold(
    body: SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(Spacing.medium.value),
            child: const Text('Bottom app bars'),
          ),
        ),
      ),
    ),
    bottomNavigationBar: BottomAppBar(
      elevation: isElevation ? null : Elevation.level0.value,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(Symbols.menu),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Symbols.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Symbols.person),
            onPressed: () {},
          ),
        ].intersperse(Gap(Spacing.medium.value)).toList(),
      ),
    ),
    floatingActionButton: isShowFab
        ? FloatingActionButton(
            mini: isSmall,
            elevation: isElevation ? null : Elevation.level0.value,
            onPressed: () {},
            child: const Icon(Symbols.edit),
          )
        : null,
    floatingActionButtonLocation: fabLocation.value,
  );
}
