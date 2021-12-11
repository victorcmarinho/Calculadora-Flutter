import 'package:flutter/material.dart';

typedef OnClick = void Function();

class CButton extends StatelessWidget {
  final String label;
  final Icon? icon;
  final Color? color;
  final bool largeButton;
  final VoidCallback? onPress;

  const CButton(
      {Key? key,
      this.label = '',
      this.icon,
      this.color,
      this.largeButton = false,
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 80,
        width: largeButton ? 160 : 80,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(1200),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 50),
          ),
        ),
      ),
    );
  }
}
