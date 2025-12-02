import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StreaksPage extends StatelessWidget {
  const StreaksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Lottie.asset('assets/images/coming_soon.json')),
    );
  }
}
