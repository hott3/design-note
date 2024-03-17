import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'addon.dart' as addon;
import 'widgetbook.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [
        addon.deviceFrameAddon(),
        addon.materialThemeAddon(),
        addon.textScaleAddon(),
        BuilderAddon(
          name: 'Scaffold & SafeArea',
          builder: (context, child) {
            return Scaffold(
              body: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: SafeArea(
                    child: child,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
