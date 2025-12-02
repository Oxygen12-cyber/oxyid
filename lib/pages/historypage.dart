import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final List<String> items = [
    'apple',
    'ball',
    'cat',
    'gate',
    'phone',
    'love',
    'game',
    'switch',
    'back',
    'powebank',
    'night',
    'cart',
    'shopping',
    'olotu',
    'dami',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[200],
      appBar: AppBar(
        leadingWidth: 80,
        elevation: 0,
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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text('History'),
            SizedBox(height: 30),

            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      minVerticalPadding: 5,
                      // tileColor: Colors.pinkAccent[100],
                      title: Text(items[index]),
                      subtitle: Text(items[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
