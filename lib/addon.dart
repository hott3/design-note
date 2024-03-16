import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

DeviceFrameAddon deviceFrameAddon() {
  return DeviceFrameAddon(
    devices: [
      Devices.ios.iPhone13,
      Devices.ios.iPhone13ProMax,
    ],
  );
}

MaterialThemeAddon materialThemeAddon() {
  return MaterialThemeAddon(
    themes: [
      WidgetbookTheme(name: 'Light', data: ThemeData.light()),
      WidgetbookTheme(name: 'Dark', data: ThemeData.dark()),
    ],
  );
}

TextScaleAddon textScaleAddon() {
  return TextScaleAddon(
    scales: [1.0, 2.0],
  );
}
