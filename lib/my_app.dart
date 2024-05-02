import 'package:flutter/material.dart';
import 'package:luvit/constant/app_colors.dart';
import 'package:luvit/main_home/main_home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override

  /// The root of the application.
  ///
  /// This widget is responsible for setting up the basic application design
  /// and theme.
  ///
  /// It uses [MaterialApp] widget to set up the basic application design and
  /// theme. The [MaterialApp] widget configures the basic material design
  /// visual layout, animations, and navigational structure. It uses the
  /// [ThemeData] to define the basic visual styles for the application.
  Widget build(BuildContext context) {
    // Build the application.
    return MaterialApp(
      // Set the title of the application.
      title: 'Luvit',
      // Hide the debug banner.
      debugShowCheckedModeBanner: false,
      // Define the theme of the application.
      theme: ThemeData(
        // Define the theme of the app bar.
        appBarTheme: const AppBarTheme(
          // Set the background color of the app bar.
          backgroundColor: appPrimaryColor,
        ),
        // Enable the Material 3 design.
        useMaterial3: true,
        // Define the color scheme of the application.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
            // Copy the color scheme and set the background color.
            .copyWith(background: appPrimaryColor),
      ),
      // Set the home page of the application.
      home: const MainHome(),
    );
  }
}
