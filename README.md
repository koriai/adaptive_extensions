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

# Add adaptive() after Material widget

Inspired by the build-in adaptive widget like CircularProgressIndicator.adaptive().
All you need to get Cupertino widgets, add adaptive() after Material Widget.

```dart
TextButton(
    onPressed: showAdaptiveSnackbar,
    child: const Text('Adaptive TextButton'),
    ).adaptive(),
),
```

## Screencast

![screenshot1](https://github.com/koriai/adaptive_extensions/blob/main/images/screencast1.gif)

Visit [https://dartpad.dev/?id=2f197147d498b0dca1bc9d6fe28ee7de](https://dartpad.dev/?id=2f197147d498b0dca1bc9d6fe28ee7de)

## Usage

Find material widgets and add adaptive() after them.

The extensions are automatically convert to Cupertino widgets only if the platform is IOS or MacOS.

```dart
final TextButton textbutton = TextButton(your code).adaptive();
final FilledButton filledButton = FilledButton(your code).adaptive();

// if you want to use TextButton.icon add icon inside the adaptive
final textbutton = TextButton(your code).adaptive(icon:Icon(Icons.abc));
```

## Design Concept

This package is composed with extentions of MaterialWidget.
So these extensions are return material widget 'this'.

```dart
extension Adaptive on Material {
    dynamic adaptive({}){
        if (forceCupertino || Platform.isIOS || Platform.isMacOS) {
            return Cupertino;
        } else {
            return this; // Material;
        }
    }
}
```

## Available Widgets

|Widget|Material|Cupertino|adaptive_extensions|
|---|---|---|---|
|TextButton|TextButton|CupertinoButton|TextButton.adaptive|
|TextButton with icon|TextButton.icon|CupertinoButton|TextButton.adaptive(icon:Icon)|
|FilledButton|FilledButton|CupertinoButton.filled|FilledButton.adaptive|
|FilledButton with icon|FilledButton.icon|CupertinoButton.filled|FilledButton.adaptive(icon:Icon)|
|ListTile|ListTile|CupertinoListTile|ListTile.adaptive|
|SnackBar or Toast|SnackBar|Toast-like SnackBar|SnackBar.adaptive|

on progress: segmentbutton

<!-- |Segment Button|SegmentedButton|CupertinoSegmentedControl|SegmentedButton.adaptive| -->

## Available ThemeData

|Theme|Material|Cupertino|adaptive_extensions|
|---|---|---|---|
|SnackBar or Toast|SnackBarThemeData|Toast-like SnackBarThemeData|SnackBarThemeData.adaptive
|AppBarTheme|AppBarTheme|Cupertino-like AppBarTheme|AppBarTheme.adaptive

## See also

If you are looking for Switch,Slider,CircularProgressIndicator,CheckBox, or Radio, visit the Official document [Automatic platform adaptations](https://docs.flutter.dev/platform-integration/platform-adaptations).

If you are looking for some adaptive dialogs, I suggest you to use [adaptive_dialog](https://pub.dev/packages/adaptive_dialog) package written by [mono0926.com](https://pub.dev/publishers/mono0926.com/packages).

If you need more platform adaptive widgets, also see [flutter_platform_widgets](https://pub.dev/packages/flutter_platform_widgets) of [stryder.dev](https://pub.dev/publishers/stryder.dev/packages).
