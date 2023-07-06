import 'package:flutter/material.dart';
import 'package:college_app/constants/constants.dart';

class HomePageItemsCard extends StatelessWidget {
  final String? name;
  final VoidCallback? ontap;
  final IconData? iconData;
  const HomePageItemsCard(
      {super.key, required this.name, this.ontap, this.iconData});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: ontap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            width: 20,
          ),
          Icon(
            iconData,
            size: 50,
          ),
          const SizedBox(
            width: 7,
          ),
          Expanded(
            flex: 6,
            child: Text(
              '$name',
              style: kheadingprogress.copyWith(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
          ),
          const Expanded(
            flex: 2,
            child: Icon(
              Icons.arrow_right,
              size: 70,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
