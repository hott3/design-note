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
    // > Do not place a FAB outside of a bottom app bar, as it makes it harder to reach
    // > https://m3.material.io/components/bottom-app-bar/guidelines#54eba260-788e-462f-96f0-39679f6b35e5
    const _FloatingActionButtonLocationOption(
      label: 'endContained',
      value: FloatingActionButtonLocation.endContained,
    ),
    _FloatingActionButtonLocationOption(
      label: 'End Docked',
      value: isSmall
          ? FloatingActionButtonLocation.miniEndDocked
          : FloatingActionButtonLocation.endDocked,
    ),
    _FloatingActionButtonLocationOption(
      label: 'Center Docked',
      value: isSmall
          ? FloatingActionButtonLocation.miniCenterDocked
          : FloatingActionButtonLocation.centerDocked,
    ),
    _FloatingActionButtonLocationOption(
      label: 'Start Docked',
      value: isSmall
          ? FloatingActionButtonLocation.miniStartDocked
          : FloatingActionButtonLocation.startDocked,
    ),
  ];
  final fabLocation = context.knobs.list(
    label: 'FAB Location',
    initialOption: fabLocationOption.first,
    labelBuilder: (option) => option.label,
    options: fabLocationOption,
  );
  final isElevation = context.knobs.boolean(
    label: 'FAB Elevation',
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

class _FloatingActionButtonLocationOption {
  const _FloatingActionButtonLocationOption({
    required this.label,
    required this.value,
  });

  final String label;
  final FloatingActionButtonLocation value;
}
