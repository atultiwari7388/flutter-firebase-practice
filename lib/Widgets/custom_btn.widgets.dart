import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    Key? key,
    required this.btnName,
    required this.icon,
    required this.color,
    required this.onPressed,
    required this.primaryColor,
  }) : super(key: key);

  final String? btnName;
  final IconData? icon;
  final Color? color, primaryColor;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        onPressed: onPressed,
        icon: FaIcon(icon, color: color),
        label: Text(
          btnName!,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
