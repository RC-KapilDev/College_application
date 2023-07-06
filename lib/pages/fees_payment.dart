import 'package:flutter/material.dart';
import '../appwidgets/navigation_drawer.dart';

class PeoplePage extends StatelessWidget {
  const PeoplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      endDrawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('Fees Payment'),
        centerTitle: true,
        backgroundColor: const Color(0xFF0A0E61),
      ),
    );
  }
}
