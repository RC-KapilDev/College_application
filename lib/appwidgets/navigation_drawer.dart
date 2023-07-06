import 'package:flutter/material.dart';
import '../pages/fees_payment.dart';
import '../pages/user_page.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({super.key});
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  Widget BuildMenuItem(
      {required String text, required IconData icon, VoidCallback? onclicked}) {
    const color = Colors.white;
    const hoverColor = Colors.white70;
    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: const TextStyle(color: color),
      ),
      hoverColor: hoverColor,
      onTap: onclicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const PeoplePage(),
        ));
    }
  }

  Widget buildHeader(
      {required String urlImage,
      required String name,
      required String email,
      required VoidCallback onclicked}) {
    return InkWell(
      onTap: onclicked,
      child: Container(
        padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(urlImage),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  email,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
            const CircleAvatar(
              radius: 24,
              backgroundColor: Color.fromRGBO(30, 60, 168, 1),
              child: Icon(
                Icons.add_comment_outlined,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const name = 'Your_Name';
    const email = 'Email_id';
    const urlimage =
        'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80';
    return Drawer(
      child: Material(
        color: const Color(0xFF0A0E21),
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlimage,
              name: name,
              email: email,
              onclicked: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      UserPage(name: name, urlImage: urlimage))),
            ),
            Container(
                padding: padding,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 48,
                    ),
                    BuildMenuItem(
                        text: 'Fees Payment',
                        icon: Icons.payment_outlined,
                        onclicked: () => selectedItem(context, 0)),
                    const SizedBox(
                      height: 16,
                    ),
                    BuildMenuItem(
                        text: 'Department Syllabus',
                        icon: Icons.menu_book_outlined),
                    const SizedBox(
                      height: 16,
                    ),
                    BuildMenuItem(
                        text: 'Previous Year Question Paper',
                        icon: Icons.book_outlined),
                    const SizedBox(
                      height: 24,
                    ),
                    const Divider(
                      color: Colors.white70,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    BuildMenuItem(text: 'News', icon: Icons.newspaper),
                    const SizedBox(
                      height: 16,
                    ),
                    BuildMenuItem(text: 'About', icon: Icons.info),
                    const SizedBox(
                      height: 16,
                    ),
                    BuildMenuItem(text: 'Faculty', icon: Icons.school_outlined),
                    const SizedBox(
                      height: 16,
                    ),
                    BuildMenuItem(text: 'updates', icon: Icons.update),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
