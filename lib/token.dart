class AppToken {
  AppToken._();

  static const Spacing _spacing = Spacing();
  static const Radius _radius = Radius();

  static Spacing get spacing => _spacing;
  static Radius get radius => _radius;
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
    this.full = double.infinity,
  });
  final double none;
  final double extraSmall;
  final double small;
  final double medium;
  final double large;
  final double extraLarge;
  final double full;
}
