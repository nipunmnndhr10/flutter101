import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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
  ValueNotifier<int> _counter = ValueNotifier(
    0,
  ); // define value notifier of type int with initial val of 0

  ValueNotifier<bool> _inputError = ValueNotifier(false);

  void _incrementCounter() {
    _counter.value++; // we have access to the val inside _counter now
  }

  @override
  Widget build(BuildContext context) {
    print(
      "Build method called",
    ); //! build method is called every time setState is called
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),

            ValueListenableBuilder(
              valueListenable: _inputError,
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter here",
                ),
                onChanged: (String value) {
                  if (value.isEmpty || value.length <= 6) {
                    _inputError.value = true;
                  } else {
                    _inputError.value = false;
                  }
                },
              ),

              builder: (context, bool error, child) {
                return Column(
                  children: [
                    child!,
                    _inputError.value
                        ? Text(
                            "wrong input",
                            style: TextStyle(color: Colors.red),
                          )
                        : Container(),
                  ],
                );
              },
            ),

            ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, int count, child) {
                print("ValueListenable Builder method called");
                return Text(
                  '$count',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
