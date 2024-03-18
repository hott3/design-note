// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:design_note/use_case/bottom_sheets.dart' as _i2;
import 'package:design_note/use_case/buttons.dart' as _i3;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookCategory(
    name: 'MD3 Kit',
    children: [
      _i1.WidgetbookFolder(
        name: 'Bottom Sheets',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'BottomSheet',
            useCase: _i1.WidgetbookUseCase(
              name: 'Bottom Sheets',
              builder: _i2.bottomSheetsUseCase,
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
              builder: _i3.buttonsUseCase,
            ),
          )
        ],
      ),
    ],
  )
];
