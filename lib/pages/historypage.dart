import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:oxyid/components/component.dart';
import 'package:oxyid/extensions/extension.dart';
import 'package:oxyid/model/model.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[200],
      appBar: AppBar(
        leadingWidth: 80,
        leading: IconButton.filledTonal(
          onPressed: () => Navigator.pop(context),
          padding: EdgeInsets.all(15),
          iconSize: 28,
          icon: Icon(Iconsax.arrow_left_2_copy, color: Colors.white),
          style: IconButton.styleFrom(
            backgroundColor: Theme.of(
              context,
            ).colorScheme.primary.withAlpha(120),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: context.hp(2)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: DropdownMenu(
                hintText: "Filters",
                enableFilter: true,
                width: double.infinity,
                menuStyle: MenuStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).primaryColor,
                  ),
                ),
                inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                dropdownMenuEntries: [
                  const DropdownMenuEntry(value: 'all', label: 'all'),
                  const DropdownMenuEntry(
                    value: 'daily high',
                    label: 'daily high',
                  ),
                  const DropdownMenuEntry(
                    value: 'daily low',
                    label: 'daily low',
                  ),
                ],
              ),
            ),
            SizedBox(height: context.hp(4)),
            Flexible(
              child: ListView(
                children: [
                  ListTile(
                    title: Text("hello"),
                    subtitle: Text('im adeola'),
                    tileColor: Colors.deepPurpleAccent[100],
                  ),
                  ListTile(
                    title: Text("hello"),
                    subtitle: Text('im oxygen'),
                    tileColor: Colors.deepPurpleAccent[100],
                  ),
                  ListTile(
                    title: Text("hello"),
                    subtitle: Text('im oxygen'),
                    tileColor: Colors.deepPurpleAccent[100],
                  ),
                  ListTile(
                    title: Text("hello"),
                    subtitle: Text('im oxygen'),
                    tileColor: Colors.deepPurpleAccent[100],
                  ),
                  ListTile(
                    title: Text("hello"),
                    subtitle: Text('im oxygen'),
                    tileColor: Colors.deepPurpleAccent[100],
                  ),
                  ListTile(
                    title: Text("hello"),
                    subtitle: Text('im oxygen'),
                    tileColor: Colors.deepPurpleAccent[100],
                  ),
                  ListTile(
                    title: Text("hello"),
                    subtitle: Text('im oxygen'),
                    tileColor: Colors.deepPurpleAccent[100],
                  ),
                  ListTile(
                    title: Text("hello"),
                    subtitle: Text('im oxygen'),
                    tileColor: Colors.deepPurpleAccent[100],
                  ),
                  ListTile(
                    title: Text("hello"),
                    subtitle: Text('im oxygen'),
                    tileColor: Colors.deepPurpleAccent[100],
                  ),
                  ListTile(
                    title: Text("hello"),
                    subtitle: Text('im oxygen'),
                    tileColor: Colors.deepPurpleAccent[100],
                  ),
                  ListTile(
                    title: Text("hello"),
                    subtitle: Text('im oxygen'),
                    tileColor: Colors.deepPurpleAccent[100],
                  ),
                  ListTile(
                    title: Text("hello"),
                    subtitle: Text('im oxygen'),
                    tileColor: Colors.deepPurpleAccent[100],
                  ),
                  ListTile(
                    title: Text("hello"),
                    subtitle: Text('im oxygen'),
                    tileColor: Colors.deepPurpleAccent[100],
                  ),
                  ListTile(
                    title: Text("hello"),
                    subtitle: Text('im oxygen'),
                    tileColor: Colors.deepPurpleAccent[100],
                  ),
                  ListTile(
                    title: Text("hello"),
                    subtitle: Text('im oxygen'),
                    tileColor: Colors.deepPurpleAccent[100],
                  ),
                  ListTile(
                    title: Text("hello"),
                    subtitle: Text('im oxygen'),
                    tileColor: Colors.deepPurpleAccent[100],
                  ),
                  ListTile(
                    title: Text("hello"),
                    subtitle: Text('im oxygen'),
                    tileColor: Colors.deepPurpleAccent[100],
                  ),
                  ListTile(
                    title: Text("hello"),
                    subtitle: Text('im oxygen'),
                    tileColor: Colors.deepPurpleAccent[100],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
