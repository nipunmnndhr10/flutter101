import 'package:first_flutter_app/data/notifiers.dart';
import 'package:first_flutter_app/views/widget_tree.dart';
import 'package:first_flutter_app/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// stateless:
// screen will not change. and stateful means screen will change as user interacts
//! Material app
//! Scaffold

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // gives a dark teal bg of the Material App
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal,

              brightness: isDarkMode ? Brightness.dark : Brightness.light,
            ),
          ),
          home: MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // can place args here - before the build
  @override
  // or can place args here - after build
  //! till now each time we refresh the, we rebuild this widget
  Widget build(BuildContext context) {
    return WidgetTree();
  }
}
