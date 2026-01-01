import 'package:first_flutter_app/data/notifiers.dart';
import 'package:first_flutter_app/views/pages/home_page.dart';
import 'package:first_flutter_app/views/pages/profile_page.dart';
import 'package:first_flutter_app/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';

List<Widget> pages = [HomePage(), ProfilePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold AppBar"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
            },
            icon: ValueListenableBuilder(
              valueListenable: isDarkModeNotifier,
              builder: (context, isDarkMode, child) {
                return Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode);
              },
            ),
          ),
        ],
        // leading: Icon(Icons.home),
        // actions: [Text("Exit Action"), Icon(Icons.exit_to_app)],
        // backgroundColor: Colors.teal,
      ),

      // body: currentIndex == 0
      //     ? Center(
      //         child: Text(
      //           "This is home page via Stateful widget",
      //           style: TextStyle(fontFamily: "Inter", fontSize: 20),
      //         ),
      //       )
      //     : Center(
      //         child: Text(
      //           "This is profile page via Stateful widget",
      //           style: TextStyle(fontFamily: "Inter", fontSize: 20),
      //         ),
      //       ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages.elementAt(selectedPage);
        },
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
