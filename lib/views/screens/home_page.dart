import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/color.dart';
import '../../provider/color_provider.dart';
import '../../provider/theme_provider.dart';

class HomePage extends StatefulWidget {
  static const route = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ColorMania colorMania;

  @override
  Widget build(BuildContext context) {
    Provider.of<ColorProvider>(context, listen: false).loadData();
    colorMania = Provider.of<ColorProvider>(context).colorMania;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Color Mania"),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .changeTheme();
              },
              icon: Icon(
                (Provider.of<ThemeProvider>(context).isDark)
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            customContainer(color: colorMania.color100, isFirst: true),
            customContainer(
              color: colorMania.color200,
            ),
            customContainer(
              color: colorMania.color400,
            ),
            customContainer(
              color: colorMania.color600,
            ),
            customContainer(
              color: colorMania.color800,
            ),
            customContainer(color: colorMania.color900, isLast: true),
            const Spacer(),
            OutlinedButton.icon(
              icon: Icon(Icons.color_lens),
              label: Text("Change Color"),
              onPressed: () {
                Provider.of<ColorProvider>(context, listen: false)
                    .changeColorManie();
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  customContainer({bool? isFirst, bool? isLast, required String color}) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.11,
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular((isFirst != null) ? 20 : 0),
          topRight: Radius.circular((isFirst != null) ? 20 : 0),
          bottomRight: Radius.circular((isLast != null) ? 20 : 0),
          bottomLeft: Radius.circular((isLast != null) ? 20 : 0),
        ),
        color: Color(int.parse(color)),
      ),
    );
  }
}
