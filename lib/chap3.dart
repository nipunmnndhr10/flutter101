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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // gives a dark teal bg of the Material App
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Scaffold AppBar"),
            centerTitle: true,
            // leading: Icon(Icons.home),
            // actions: [Text("Exit Action"), Icon(Icons.exit_to_app)],
            // backgroundColor: Colors.teal,
          ),
          drawer: Drawer(
            child: Column(
              children: [
                // DrawerHeader(child: Text("Drawer Header in col")),
                ListTile(title: Text("Logout")),
              ],
            ),
          ),
          bottomNavigationBar: NavigationBar(
            //! needs at least two destination to work
            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: "Home"),
              NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
            ],
            // below func will return the value that we've clicked
            onDestinationSelected: (int value) {
              print(value);
            },
            selectedIndex: 1,
          ),
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                onPressed: () {
                  print("Floating action button2 pressed");
                },
                child: Icon(Icons.add),
              ),
              SizedBox(height: 10),
              FloatingActionButton(
                onPressed: () {
                  print("Floating action button1 pressed");
                },
                child: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
