import 'package:college_app/main.dart';
import 'package:flutter/material.dart';

class BottomappBar extends StatelessWidget {
  const BottomappBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFFEB1455),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
              tooltip: 'Notification',
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
                size: 30,
                color: Colors.white,
              )),
          IconButton(
              tooltip: 'TimeTable',
              onPressed: () {},
              icon: const Icon(
                Icons.schedule_outlined,
                size: 30,
                color: Colors.white,
              )),
          IconButton(
              tooltip: 'Home',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              icon: const Icon(
                Icons.home,
                size: 30,
                color: Colors.white,
              )),
          IconButton(
              tooltip: 'Events',
              onPressed: () {},
              icon: const Icon(
                Icons.event,
                size: 30,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
