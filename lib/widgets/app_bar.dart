import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar(
      {Key? key,
      required this.text,
      required this.buttonText,
      required this.onActionPress})
      : super(key: key);

  // final int index;
  final void Function() onActionPress;
  final String text;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text),
      // leading: iconbutton,
      actions: [
        TextButton(
            onPressed: onActionPress,
            child: Text(
              buttonText,
              style: const TextStyle(color: Colors.black),
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
