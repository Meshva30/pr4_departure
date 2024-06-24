import 'package:flutter/material.dart';

import 'package:pr4_departure/screen/detilsscreen.dart';
import 'package:pr4_departure/screen/dohescreen.dart';
import 'package:pr4_departure/screen/homescreen.dart';
import 'package:pr4_departure/screen/splashscreen.dart';
import 'package:provider/provider.dart';


import 'controller/shlok_controller.dart';
import 'controller/theme.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ShlokProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),

    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(

      themeMode: themeProvider.themeMode,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      onGenerateRoute: (settings) {
        if (settings.name == 'detils') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) {
              return Detilsscreen(index: args['index']);
            },
          );
        }

        return null;
      },
      routes: {
        '/': (context) => splashscreen(),
        'home': (context) => Homepage(),
        'dohe': (context) => Dohescreen(),
      },
    );
  }
}
