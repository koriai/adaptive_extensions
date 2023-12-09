import 'dart:developer';
import 'dart:io';

import 'package:adaptive_extensions/adaptive_extensions.dart';
import 'package:example/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

enum Calendar { day, week, month, year }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // theme: MyTheme.light,
      title: 'Adaptive Extensions',
      home: MyHomePage(title: 'Adaptive Extensions'),
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
  bool forceCupertino = Platform.isIOS;
  Calendar calendarView = Calendar.day;
  GlobalKey bottomNaviKey = GlobalKey(debugLabel: 'bottomNavi');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void showAdaptiveSnackbar() {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Hello adaptive snackbar, toast'),
      ).adaptive(
        forceCupertino: forceCupertino,
        forceMaterial: !forceCupertino,
      ));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          Icon(forceCupertino ? Icons.apple : Icons.android),
          Switch.adaptive(
              value: forceCupertino,
              onChanged: (_) {
                setState(() {
                  forceCupertino = !forceCupertino;
                });
              }),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        key: bottomNaviKey,
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.star_fill),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.clock_solid),
            label: 'Recents',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_alt_circle_fill),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.circle_grid_3x3_fill),
            label: 'Keypad',
          ),
        ],
      ).adaptive(
        forceCupertino: forceCupertino,
        forceMaterial: !forceCupertino,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          TextButton(
                  onPressed: showAdaptiveSnackbar,
                  child: const Text("Adaptive TextButton"))
              .adaptive(
            forceCupertino: forceCupertino,
            forceMaterial: !forceCupertino,
          ),
          const SizedBox(height: 8),
          TextButton(
                  onPressed: () {
                    setState(() {
                      forceCupertino = !forceCupertino;
                    });
                  },
                  child: const Text("Adaptive TextButton"))
              .adaptive(
            alignment: Alignment.bottomLeft,
            icon: Icon(forceCupertino ? Icons.apple : Icons.android),
            forceCupertino: forceCupertino,
            forceMaterial: !forceCupertino,
          ),
          const SizedBox(height: 8),
          FilledButton(
                  onPressed: showAdaptiveSnackbar,
                  child: const Text("Adaptive FilledButton"))
              .adaptive(
            forceCupertino: forceCupertino,
            forceMaterial: !forceCupertino,
          ),
          const SizedBox(height: 8),
          FilledButton(
                  onPressed: () {
                    setState(() {
                      forceCupertino = !forceCupertino;
                    });
                  },
                  child: const Text("Adaptive FilledButton"))
              .adaptive(
            icon: Icon(forceCupertino ? Icons.apple : Icons.android),
            forceCupertino: forceCupertino,
            forceMaterial: !forceCupertino,
          ),
          const SizedBox(height: 8),
          FilledButton(
                  onPressed: () {
                    setState(() {
                      forceCupertino = !forceCupertino;
                    });
                  },
                  child: const Text("Adaptive Tonal Filled Button"))
              .adaptive(
            isTonal: true,
            color: CupertinoColors.systemBlue.darkHighContrastColor,
            icon: Icon(forceCupertino ? Icons.apple : Icons.android),
            forceCupertino: forceCupertino,
            forceMaterial: !forceCupertino,
          ),
          const SizedBox(height: 8),
          const FilledButton(
            onPressed: null,
            child: Text("Adaptive Disabled Button"),
          ).adaptive(
            isGray: true,
            icon: Icon(forceCupertino ? Icons.apple : Icons.android),
            forceCupertino: forceCupertino,
            forceMaterial: !forceCupertino,
          ),
          const SizedBox(height: 8),
          ListTile(
            onTap: showAdaptiveSnackbar,
            leading: Icon(forceCupertino ? Icons.apple : Icons.android),
            title: const Text("Adaptive ListTile"),
            subtitle: const Text("Tab here to see snackbar"),
            tileColor: Colors.yellow[200],
            trailing: const Icon(Icons.play_arrow),
          ).adaptive(
            cupertinoThemeData: const CupertinoThemeData(
              primaryColor: Colors.blue,
            ),
            forceCupertino: forceCupertino,
            forceMaterial: !forceCupertino,
          ),
          const SizedBox(height: 8),
          const Text('adaptive segments'),
          // SegmentedButton(
          //   segments: const [
          //     ButtonSegment<Calendar>(
          //         value: Calendar.day,
          //         label: Text('Day'),
          //         icon: Icon(Icons.calendar_view_day)),
          //     ButtonSegment<Calendar>(
          //         value: Calendar.week,
          //         label: Text('Week'),
          //         icon: Icon(Icons.calendar_view_week)),
          //     ButtonSegment<Calendar>(
          //         value: Calendar.month,
          //         label: Text('Month'),
          //         icon: Icon(Icons.calendar_view_month)),
          //     ButtonSegment<Calendar>(
          //         value: Calendar.year,
          //         label: Text('Year'),
          //         icon: Icon(Icons.calendar_today)),
          //   ],
          //   selected: <Calendar>{calendarView},
          //   onSelectionChanged: (Set<Calendar> newSelection) {
          //     setState(() {
          //       calendarView = newSelection.first;
          //     });
          //   },
          // ).adaptive(
          //   forceCupertino: forceCupertino,
          //   forceMaterial: !forceCupertino,
          // ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
