enum Spacing {
  /// This value is 0
  none(0),

  /// This value is 4
  extraSmall(4),

  /// This value is 8
  small(8),

  /// This value is 12
  underMedium(12),

  /// This value is 16
  medium(16),

  /// This value is 24
  large(24),

  /// This value is 32
  extraLarge(32);

  const Spacing(this.value);

  final double value;
}

/// https://m3.material.io/styles/shape/shape-scale-tokens
enum Radius {
  none(name: 'None', value: 0),
  extraSmall(name: 'Extra Small', value: 4),
  small(name: 'Small', value: 8),
  medium(name: 'Medium', value: 12),
  large(name: 'Large', value: 16),
  extraLarge(name: 'Extra Large', value: 28),
  full(name: 'Full', value: 9999);

  const Radius({required this.name, required this.value});

  final String name;
  final double value;
}

/// https://m3.material.io/styles/elevation/tokens
enum Elevation {
  level0(name: 'Level 0', value: 0),
  level1(name: 'Level 1', value: 1),
  level2(name: 'Level 2', value: 3),
  level3(name: 'Level 3', value: 6),
  level4(name: 'Level 4', value: 8),
  level5(name: 'Level 5', value: 12);

  const Elevation({required this.name, required this.value});

  final String name;
  final double value;
}
