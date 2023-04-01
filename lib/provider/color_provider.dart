import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../models/color.dart';

class ColorProvider extends ChangeNotifier {
  List<ColorMania> colorsList = [];
  bool isDataLoad = true;
  ColorMania colorMania = ColorMania(
    color100: "0xffffcdd2",
    color200: "0xffef9a9a",
    color400: "0xffef5350",
    color600: "0xffe53935",
    color800: "0xffc62828",
    color900: "0xffb71c1c",
  );

  loadData() async {
    if (isDataLoad) {
      String json = await rootBundle.loadString("assets/json/colors.json");
      List data = jsonDecode(json);
      colorsList = data.map((e) => ColorMania.fromJson(e)).toList();
      isDataLoad = false;
    }
  }

  changeColorManie() {
    colorsList.shuffle();
    colorMania = colorsList.first;
    notifyListeners();
  }
}
