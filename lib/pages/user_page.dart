import 'package:college_app/appwidgets/navigation_drawer.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  final String name;
  final String urlImage;
  const UserPage({Key? key, required this.name, required this.urlImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E61),
        title: Text(name),
        centerTitle: true,
      ),
      body: Image.network(
        urlImage,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
