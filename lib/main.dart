import 'package:color_layer/provider/color_provider.dart';
import 'package:color_layer/provider/theme_provider.dart';
import 'package:color_layer/utils/theme.dart';
import 'package:color_layer/views/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ColorProvider>(
          create: (context) => ColorProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
      ],
      builder: (context, _) => MaterialApp(
        themeMode: (Provider.of<ThemeProvider>(context).isDark)
            ? ThemeMode.dark
            : ThemeMode.light,
        theme: lightTheme(),
        darkTheme: darkTheme(),
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => const HomePage(),
        },
      ),
    );
  }
}
