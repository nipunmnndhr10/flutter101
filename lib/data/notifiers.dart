//! ValueNotifier: hold the data
// ValueListenableBuilder: listen to the data (if the data change, it will change), it doesn't need setState

import 'package:flutter/material.dart';

ValueNotifier<int> selectedPageNotifier = ValueNotifier(0);
ValueNotifier<bool> isDarkModeNotifier = ValueNotifier(true);
