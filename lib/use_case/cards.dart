import 'package:design_note/gen/assets.gen.dart';
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
  path: '[MD3 Kit]/Cards',
  name: 'Cards',
  type: Card,
)
Widget bottomAppBarUseCase(BuildContext context) {
  final style = context.knobs.list(
    label: 'Style',
    initialOption: _Style.outlined,
    labelBuilder: (option) => option.label,
    options: _Style.values.map((value) => value).toList(),
  );
  final isClickable = context.knobs.boolean(
    label: 'Clickable',
    initialValue: true,
  );
  final header = context.knobs.string(
    label: 'Header',
    initialValue: 'Header',
  );
  final subheader = context.knobs.string(
    label: 'Subheader',
    initialValue: 'Subheader',
  );
  final title = context.knobs.string(
    label: 'Title',
    initialValue: 'Title',
  );
  final subhead = context.knobs.string(
    label: 'Subhead',
    initialValue: 'Subhead',
  );
  final supportingText = context.knobs.string(
    label: 'Supporting Text',
    initialValue:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
  );

  final stackedCardContents = _StackedCardContentLayer(
    header: header,
    subheader: subheader,
    title: title,
    subhead: subhead,
    supportingText: supportingText,
  );
  final horizontalCardContents = _HorizontalCardContentLayer(
    header: header,
    subheader: subheader,
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
                const Text('Stacked card'),
                _buildCardBasedOnStyle(
                  style,
                  isClickable,
                  stackedCardContents,
                ),
                const Text('Horizontal card'),
                _buildCardBasedOnStyle(
                  style,
                  isClickable,
                  horizontalCardContents,
                ),
              ].intersperse(Gap(Spacing.medium.value)).toList(),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _buildCardBasedOnStyle(
  _Style style,
  bool isClickable,
  Widget cardContents,
) =>
    switch (style) {
      _Style.outlined => Card.outlined(
          clipBehavior: Clip.hardEdge,
          child: isClickable
              ? InkWell(onTap: () {}, child: cardContents)
              : cardContents,
        ),
      _Style.elevated => Card(
          clipBehavior: Clip.hardEdge,
          child: isClickable
              ? InkWell(onTap: () {}, child: cardContents)
              : cardContents,
        ),
      _Style.filled => Card.filled(
          clipBehavior: Clip.hardEdge,
          child: isClickable
              ? InkWell(onTap: () {}, child: cardContents)
              : cardContents,
        )
    };

enum _Style {
  outlined(label: 'Outlined'),
  elevated(label: 'Elevated'),
  filled(label: 'Filled');

  const _Style({
    required this.label,
  });

  final String label;
}

class _StackedCardContentLayer extends StatelessWidget {
  const _StackedCardContentLayer({
    super.key,
    required this.header,
    required this.subheader,
    required this.title,
    required this.subhead,
    required this.supportingText,
  });

  final String header;
  final String subheader;
  final String title;
  final String subhead;
  final String supportingText;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        /// Header Layer
        Padding(
          padding: EdgeInsets.only(
            left: Spacing.medium.value,
            right: Spacing.extraSmall.value,
            top: Spacing.underMedium.value,
            bottom: Spacing.underMedium.value,
          ),
          child: Row(
            children: [
              const _Monogram(),
              Expanded(
                child: _Text(
                  header: header,
                  subheader: subheader,
                ),
              ),
              const _IconButton(),
            ].intersperse(Gap(Spacing.medium.value)).toList(),
          ),
        ),

        /// Media Layer
        Image.asset(
          Assets.images.media.path,
        ),

        /// Text Content Layer
        Padding(
          padding: EdgeInsets.all(Spacing.medium.value),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Headline Layer
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.bodyLarge!
                        .copyWith(color: colorScheme.onSurface),
                  ),
                  Text(
                    subhead,
                    style: textTheme.bodyMedium!
                        .copyWith(color: colorScheme.onSurfaceVariant),
                  ),
                ],
              ),

              /// Supporting Text Layer
              Text(
                supportingText,
                style: textTheme.bodyMedium!
                    .copyWith(color: colorScheme.onSurfaceVariant),
              ),

              /// Actions Layer
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('Enabled'),
                  ),
                  Gap(Spacing.small.value),
                  FilledButton(
                    onPressed: () {},
                    child: const Text('Enabled'),
                  ),
                ],
              ),
            ].intersperse(Gap(Spacing.extraLarge.value)).toList(),
          ),
        ),
      ],
    );
  }
}

class _HorizontalCardContentLayer extends StatelessWidget {
  const _HorizontalCardContentLayer({
    super.key,
    required this.header,
    required this.subheader,
  });

  final String header;
  final String subheader;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...[
          const _Monogram(),
          Expanded(
            child: _Text(
              header: header,
              subheader: subheader,
            ),
          ),
        ].intersperseOuter(Gap(Spacing.medium.value)),
        Image.asset(
          Assets.images.mediaSmall.path,
        ),
      ],
    );
  }
}

class _Monogram extends StatelessWidget {
  const _Monogram({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: colorScheme.primary,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          'A',
          style: textTheme.titleMedium!.copyWith(
            color: colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text({super.key, required this.header, required this.subheader});

  final String header;
  final String subheader;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          maxLines: 2,
          overflow: TextOverflow.fade,
          style: textTheme.titleMedium!.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
        Text(
          subheader,
          overflow: TextOverflow.fade,
          style: textTheme.bodyMedium!.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}

class _IconButton extends StatelessWidget {
  const _IconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.more_vert),
      onPressed: () {},
    );
  }
}
