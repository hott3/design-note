// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:design_note/widgets/green_container.dart' as _i2;
import 'package:design_note/widgets/red_container.dart' as _i3;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'widgets',
    children: [
      _i1.WidgetbookComponent(
        name: 'Container',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'with green color',
            builder: _i2.greenContainerUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'with red color',
            builder: _i3.redContainerUseCase,
          ),
        ],
      )
    ],
  )
];
