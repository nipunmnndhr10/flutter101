import 'package:first_flutter_app/data/notifiers.dart';
import 'package:flutter/material.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBar(
          //! needs at least two destination to work
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
          ],
          // below func will return the value that we've clicked
          onDestinationSelected: (int value) {
            selectedPageNotifier.value = value;
          },
          selectedIndex:
              selectedPage, // coming from val list builder which uses the selectedPageNotifier
        );
      },
    );
  }
}
