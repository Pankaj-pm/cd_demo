import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //0 = system
  //1 = Light
  //2 = dark
  int themeMode = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getLight(),
      darkTheme: getDark(),
      themeMode: getThemeMode(themeMode),
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                print("themeMode $themeMode");
                if (themeMode == 0) {
                  themeMode = 1;
                } else if (themeMode == 1) {
                  themeMode = 2;
                } else {
                  themeMode = 0;
                }

                print("themeMode $themeMode");
                setState(() {});
              },
              icon: Icon(Icons.settings),
            )
          ],
        ),
        body: Column(
          children: [
            Text("Title", style: Theme.of(context).textTheme.titleLarge),
            Text("${getThemeMode(themeMode)}"),
            Icon(
              (Theme.of(context).brightness == Brightness.dark) ? Icons.dark_mode : Icons.light_mode,
              size: 50,
            ),
            Text("Hello All"),
            InkWell(
              onTap: () {

              },
              overlayColor: MaterialStatePropertyAll(Colors.yellow),
              child: Text("Ok"),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("${Theme.of(context).brightness}");
          },
        ),
      ),
    );
  }

  ThemeMode getThemeMode(int type) {
    if (type == 0) {
      return ThemeMode.system;
    } else if (type == 1) {
      return ThemeMode.light;
    } else if (type == 2) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  ThemeData getLight() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.black87),
        bodyLarge: TextStyle(color: Colors.black, fontSize: 20),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.black,
      ),
    );
  }

  ThemeData getDark() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      textTheme: TextTheme(
        bodyMedium: TextStyle(color: Colors.blue.shade700),
        bodyLarge: TextStyle(color: Colors.white, fontSize: 50),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.white,
        focusColor: Colors.red,
        shape: CircleBorder()
      ),
    );
  }
}
