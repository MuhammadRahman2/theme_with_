import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:theme_prac/theme/theme.dart';
import 'package:theme_prac/theme/theme_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(ThemeController());
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: Provider.of<ThemeController>(context).themeData,
      // darkTheme: Themes.darkTheme,
      // themeMode: themeController.theme,
      theme: Get.find<ThemeController>().themeData,
      // darkTheme: Themes.darkTheme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ThemeController themeController = Get.find();
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(() => Text(
              '${themeController.themeData == Themes.lightTheme ? "Light" : "Dark"} Theme',
            )),
            Container(
              color: Theme.of(context).colorScheme.primary,
              height: 50,
              width: 100,
            ),
            const SizedBox(height: 20),
            MaterialButton(
              onPressed: () {
                Get.find<ThemeController>().toggleTheme();
                Get.forceAppUpdate();
                // Provider.of<ThemeController>(context,listen: false).toggleTheme();
            },
              child: const  Text('Change Theme'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.secondary,),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
