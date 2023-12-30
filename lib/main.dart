/*
Practice Question 1: Implementing and Testing a Global Theme

Task Description:
Create a Flutter application that implements a global theme using ThemeData. Your application should have a consistent visual style across different screens and widgets (like Text, Button, AppBar, etc.) by utilizing the defined theme.
 */

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

// This is a class that extends StatelessWidget, meaning it describes a part of the user interface which can't change over time.
class MyApp extends StatelessWidget {
  // This is a constructor for the MyApp class. It allows you to create instances of MyApp.
  // The 'super.key' part passes the key to the superclass constructor.
  const MyApp({super.key});

  // This is a method that describes the part of the user interface represented by this widget.
  // The 'BuildContext' argument is a handle to the location of the widget in the widget tree.
  @override
  Widget build(BuildContext context) {
    // This returns a MaterialApp widget, which is a convenience widget that wraps a number of widgets that are commonly required for applications implementing Material Design.
    return MaterialApp(
      // The 'theme' property sets the global theme of the app. Here it's set to the return value of the 'globalTheme()' method.
      theme: globalTheme(),
      // The 'home' property sets the default route of the app (i.e., the first screen users see). Here it's set to an instance of the HomePage widget.
      home: const HomePage(),
    );
  }

  // This is a method that returns a ThemeData object, which encapsulates the colors, type styles, and shapes that define a material design theme.
  ThemeData globalTheme() {
    // This returns a ThemeData object.
    return ThemeData(
      // The 'useMaterial3' property determines whether the Material 3 design is used. Here it's set to true.
      useMaterial3: true,
      // The 'colorScheme' property sets the color scheme of the theme. Here it's set to a dark color scheme with a primary color of amber and a brightness of dark.
      colorScheme: const ColorScheme.dark(
        primary: Colors.amber,
        brightness: Brightness.dark,
      ),
      // The 'textTheme' property sets the text themes of the theme. Here it's set to a TextTheme object with different text styles for 'displayLarge', 'titleLarge', 'bodyLarge', 'bodyMedium', and 'displaySmall'.
      textTheme: TextTheme(
        // The 'displayLarge' style is set to a TextStyle object with a font size of 72 and a bold font weight.
        displayLarge: const TextStyle(
          fontSize: 72,
          fontWeight: FontWeight.bold,
        ),
        // The 'titleLarge' style is set to a TextStyle object with the Oswald font, a font size of 30, and an italic font style.
        titleLarge: GoogleFonts.oswald(
          fontSize: 30,
          fontStyle: FontStyle.italic,
        ),
        // The 'bodyLarge' style is set to a TextStyle object with the Amarante font, a font size of 42, and an italic font style.
        bodyLarge:
            GoogleFonts.amarante(fontSize: 42, fontStyle: FontStyle.italic),
        // The 'bodyMedium' style is set to a TextStyle object with the Merriweather font.
        bodyMedium: GoogleFonts.merriweather(),
        // The 'displaySmall' style is set to a TextStyle object with the Pacifico font.
        displaySmall: GoogleFonts.pacifico(),
      ),
    );
  }
}

// This is a class that extends StatelessWidget, meaning it describes a part of the user interface which can't change over time.
// The HomePage class represents the home page of your app.
class HomePage extends StatelessWidget {
  // This is a constructor for the HomePage class. It allows you to create instances of HomePage.
  // The 'super.key' part passes the key to the superclass constructor.
  const HomePage({super.key});

  // This is a method that describes the part of the user interface represented by this widget.
  // The 'BuildContext' argument is a handle to the location of the widget in the widget tree.
  @override
  Widget build(BuildContext context) {
    // This returns a Scaffold widget, which provides a framework to implement the basic material design visual layout structure.
    return Scaffold(
      // The 'appBar' property sets the app bar of the Scaffold. Here it's set to an AppBar widget.
      appBar: AppBar(
        // The 'backgroundColor' property sets the background color of the AppBar.
        // Here it's set to the primary color of the current theme, which is accessed using 'Theme.of(context).colorScheme.primary'.
        backgroundColor: Theme.of(context).colorScheme.primary,
        //this references the global theme
      ),
      // The 'body' property sets the primary content of the Scaffold. Here it's set to a SafeArea widget, which insets its child by sufficient padding to avoid intrusions by the operating system.
      body: SafeArea(
        // The 'child' property sets the widget below this widget in the tree. Here it's set to a Row widget, which displays its children in a horizontal array.
        child: Row(
          // The 'mainAxisAlignment' property sets how the children should be placed along the main axis. Here it's set to 'MainAxisAlignment.start', which means the children are placed at the start of the main axis.
          mainAxisAlignment: MainAxisAlignment.start,
          // The 'children' property sets the widgets to display in the horizontal array. Here it's set to an array containing a TextButton widget.
          children: [
            TextButton(
                // The 'style' property sets the style of the button. Here it's set to a ButtonStyle object.
                style: ButtonStyle(
                    // The 'foregroundColor' property sets the color for descendant Text and Icon widgets if the button is enabled.
                    // Here it's set to a MaterialStateProperty that resolves to the primary color of the current theme when the button is enabled.
                    foregroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.primary)),
                //this references the global theme
                // The 'onPressed' property sets the callback that is called when the button is tapped or otherwise activated.
                // Here it's set to an empty function, which means nothing happens when the button is tapped.
                onPressed: () {},
                // The 'child' property sets the widget below this widget in the tree. Here it's set to a Text widget.
                child: Text(
                  // This is the string of text that the Text widget displays.
                  'Some text here',
                  // The 'style' property sets the style of the text. Here it's set to the 'bodyLarge' style of the current theme, which is accessed using 'Theme.of(context).textTheme.bodyLarge'.
                  style: Theme.of(context).textTheme.bodyLarge,
                )),
          ],
        ),
      ),
    );
  }
}
