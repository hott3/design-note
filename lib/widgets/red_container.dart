import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'with red color', // Widgetの名称を入力する。コンポーネントエントリーに使用される
  type: Container, // Widgetの分類
)
Widget redContainerUseCase(BuildContext context) {
  return Column(
    children: [
      Container(
        color: Colors.red,
        child: const SizedBox.square(
          dimension: 100,
        ),
      ),
    ],
  );
}
