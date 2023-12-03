<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

Provides simple extensions for material widgets.

|Widget|Material|Cupertino|adaptive_extensions|
|---|---|---|---|
|TextButton|TextButton()|CupertinoButton()|TextButton().adaptive()|
|TextButton with icon|TextButton.icon()|CupertinoButton()|TextButton().adaptive(icon:Icon)|
|FilledButton|FilledButton()|CupertinoButton.filled()|FilledButton().adaptive()|
|FilledButton with icon|FilledButton.icon()|CupertinoButton.filled()|FilledButton().adaptive(icon:Icon)|
|ListTile|ListTile()|CupertinoListTile()|ListTile().adaptive()|

## Installation

Provides simple extensions for material widgets.

## Usage

Find material widgets and add adaptive() after them.

The extensions are automatically convert to Cupertino widgets only if the platform is IOS or MacOS.

```dart
final TextButton textbutton = TextButton(your code).adaptive();
final FilledButton filledButton = FilledButton(your code).adaptive();

// if you want to use TextButton.icon add icon inside the adaptive
final textbutton = TextButton(your code).adaptive(icon:Icon(Icons.abc));
```

## Additional

If you are looking for Switch,Slider,CircularProgressIndicator,CheckBox, or Radio, visit the Official document [Automatic platform adaptations](https://docs.flutter.dev/platform-integration/platform-adaptations).

If you are looking for some adaptive dialogs, I suggest you to use [adaptive_dialog](https://pub.dev/packages/adaptive_dialog) package written by [mono0926.com](https://pub.dev/publishers/mono0926.com/packages).
