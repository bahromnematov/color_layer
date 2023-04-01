class ColorMania {
  final String color100;
  final String color200;
  final String color400;
  final String color600;
  final String color800;
  final String color900;

  ColorMania(
      {required this.color100,
      required this.color200,
      required this.color400,
      required this.color600,
      required this.color800,
      required this.color900});

  factory ColorMania.fromJson(Map data) {
    return ColorMania(
        color100: data["100"],
        color200: data["200"],
        color400: data["400"],
        color600: data["600"],
        color800: data["800"],
        color900: data["900"]);
  }
}
