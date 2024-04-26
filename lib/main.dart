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
  int ci = 0;

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
        body: Theme(
          data: ThemeData(
            textTheme: TextTheme(
              bodyMedium: TextStyle(color: Colors.red, fontSize: 50),
              // displayMedium: TextStyle(color: Colors.red, fontSize: 50),
              // bodyText1: TextStyle(color: Colors.red,fontSize: 50),
              // subtitle1: TextStyle(color: Colors.red,fontSize: 50),
              // titleMedium: TextStyle(color: Colors.red, fontSize: 50),
              // headline1: TextStyle(color: Colors.red,fontSize: 50),
              bodyLarge: TextStyle(color: Colors.red, fontSize: 20),
              bodySmall: TextStyle(color: Colors.red, fontSize: 20),
              // bodyText2: TextStyle(color: Colors.red,fontSize: 50),
              // caption: TextStyle(color: Colors.red,fontSize: 50),
              displayLarge: TextStyle(color: Colors.red, fontSize: 50),
              displaySmall: TextStyle(color: Colors.red, fontSize: 50),
              // headline2: TextStyle(color: Colors.red,fontSize: 50),
              // headline3:TextStyle(color: Colors.red,fontSize: 50),
              // bodyText1: TextStyle(color: Colors.red),
              // bodyText2: TextStyle(color: Colors.red),
            ),
            // elevatedButtonTheme:
            //     ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.yellow))),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.white, focusColor: Colors.red, shape: CircleBorder()),
          ),
          child: Column(
            children: [
              Text("Title", style: Theme.of(context).textTheme.titleLarge),
              Text("${getThemeMode(themeMode)}"),
              Icon(
                (Theme.of(context).brightness == Brightness.dark) ? Icons.dark_mode : Icons.light_mode,
                size: 50,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Stepper(
                    currentStep: ci,
                    onStepTapped: (index) {
                      ci = index;
                      setState(() {});
                      print("Index $index");
                    },
                    onStepContinue: () {
                      if (ci < 3) {
                        ci++;
                        setState(() {});
                      }
                    },
                    onStepCancel: () {
                      if (ci > 0) {
                        ci--;
                        setState(() {});
                      }
                    },
                    controlsBuilder: (context, details) {
                      return Row(
                        children: [
                          ElevatedButton(
                            onPressed: details.onStepContinue,
                            child: Text(details.currentStep == 3 ? "Submit" : "Next"),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          if (details.currentStep != 0)
                            ElevatedButton(
                              onPressed: details.onStepCancel,
                              child: Text("Back"),
                            )
                        ],
                      );
                    },
                    // stepIconBuilder: (stepIndex, stepState) {
                    //   print("stepState.index ${stepState.index}");
                    //   if (ci == 0) {
                    //     return Icon(Icons.send);
                    //   }else {
                    //     return Icon(Icons.settings);
                    //   }
                    // },
                    // type: StepperType.horizontal,
                    steps: [
                      Step(
                        title: Text("Step 1"),
                        content: TextFormField(),
                        label: Icon(Icons.add),
                        state: StepState.error,
                        isActive: 0 <= ci,
                      ),
                      Step(
                        title: Text("Step 2"),
                        content: Text("xyz"),
                        isActive: 1 <= ci,
                      ),
                      Step(
                        title: Text("Step 3"),
                        content: Text("aaaa"),
                        isActive: 2 <= ci,
                      ),
                      Step(
                        title: Text("Step 4"),
                        content: Text("aaaa"),
                        isActive: 3 <= ci,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.red),
            foregroundColor: MaterialStatePropertyAll(Colors.red)),
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
          backgroundColor: Colors.white, focusColor: Colors.red, shape: CircleBorder()),
    );
  }
}
