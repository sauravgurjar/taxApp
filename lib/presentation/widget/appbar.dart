import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';

import '../../module/utils /methods/shortcuts.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color color;
  final Icon ? icon;
  final Icon ? endingIcon;
  final String ? title;
  const MyAppBar({Key? key, required this.color, required this.icon,  this.title,  this.endingIcon}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: getStatusBarHeight(context),left: 16,right: 16),
      child: SizedBox(
        height: getAppBarHeight(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon != null? IconButton(
              icon: icon!,
              color: Colors.white,
              onPressed: () {},
            ):const SizedBox.shrink(),
            title != null? Text(
              title!,
              style:const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontFamily: 'Mukta',
                fontWeight: FontWeight.bold,
              ),
            ):const SizedBox.shrink(),
            endingIcon != null ?  IconButton(
              icon: endingIcon!,
              color: Colors.white,
              onPressed: () {},
            ):const SizedBox(
              width: 50,
            ),
          ],
        ),
      ),
    );
  }
}