// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:design_note/use_case/badges.dart' as _i2;
import 'package:design_note/use_case/bottom_app_bar.dart' as _i3;
import 'package:design_note/use_case/bottom_sheets.dart' as _i4;
import 'package:design_note/use_case/buttons.dart' as _i5;
import 'package:design_note/use_case/fab.dart' as _i6;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookCategory(
    name: 'MD3 Kit',
    children: [
      _i1.WidgetbookFolder(
        name: 'Badges',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'Badge',
            useCase: _i1.WidgetbookUseCase(
              name: 'Badges',
              builder: _i2.bottomAppBarUseCase,
            ),
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'Bottom app bars',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'BottomAppBar',
            useCase: _i1.WidgetbookUseCase(
              name: 'Bottom app bars',
              builder: _i3.bottomAppBarUseCase,
            ),
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'Bottom sheets',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'BottomSheet',
            useCase: _i1.WidgetbookUseCase(
              name: 'Bottom sheets',
              builder: _i4.bottomSheetsUseCase,
            ),
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'Buttons',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'ButtonStyleButton',
            useCase: _i1.WidgetbookUseCase(
              name: 'Buttons',
              builder: _i5.buttonsUseCase,
            ),
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'Floating action buttons',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'FloatingActionButton',
            useCase: _i1.WidgetbookUseCase(
              name: 'Floating action buttons',
              builder: _i6.buttonsUseCase,
            ),
          )
        ],
      ),
    ],
  )
];
