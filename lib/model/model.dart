import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

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

final List<Map<String, dynamic>> sheetItem = [
  {
    "icon": Icon(Icons.home, size: 32),
    "name": "Home page",
    "route": "/emptyPage",
  },
  {
    "icon": Icon(Icons.add, size: 32),
    "name": "Add Info",
    "route": "/emptyPage",
  },
  {
    "icon": Icon(Iconsax.add, size: 32),
    "name": "Bulk add",
    "route": "/emptyPage",
  },
  {
    "icon": Icon(Icons.qr_code, size: 32),
    "name": "scan",
    "route": "/emptyPage",
  },
  {
    "icon": Icon(Icons.person, size: 32),
    "name": "bulk scan",
    "route": "/emptyPage",
  },
  {
    "icon": Icon(Icons.wallet, size: 32),
    "name": "credits",
    "route": "/emptyPage",
  },
];
