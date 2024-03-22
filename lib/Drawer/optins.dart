// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Options extends StatelessWidget {
IconData icon;
String text;
   Options({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
    children: [
      Icon(icon,size: 30,),
      const SizedBox(
        width: 8,
      ),
      Text(text,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.black))
    ],
          ),
        );
  }
}
