class AppToken {
  AppToken._();
  static Spacing get spacing => const Spacing();
  static Elevation get elevation => const Elevation();
  static Radius get radius => const Radius();
}

class Spacing {
  const Spacing({
    this.none = 0,
    this.extraSmall = 4,
    this.small = 8,
    this.medium = 16,
    this.large = 24,
  });
  final double none;
  final double extraSmall;
  final double small;
  final double medium;
  final double large;
}

/// https://m3.material.io/styles/shape/shape-scale-tokens
class Radius {
  const Radius({
    this.none = 0,
    this.extraSmall = 4,
    this.small = 8,
    this.medium = 12,
    this.large = 16,
    this.extraLarge = 28,
    this.full = 9999,
  });
  final double none;
  final double extraSmall;
  final double small;
  final double medium;
  final double large;
  final double extraLarge;
  final double full;
}

/// https://m3.material.io/styles/elevation/tokens
class Elevation {
  const Elevation({
    this.level0 = 0,
    this.level1 = 1,
    this.level2 = 3,
    this.level3 = 6,
    this.level4 = 8,
    this.level5 = 12,
  });
  final double level0;
  final double level1;
  final double level2;
  final double level3;
  final double level4;
  final double level5;
}
