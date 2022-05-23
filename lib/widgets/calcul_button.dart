import 'package:flutter/material.dart';

class CalculButton extends StatefulWidget {
  final String title;
  CalculButton({required this.title, Key? key}) : super(key: key);

  @override
  State<CalculButton> createState() => _CalculButtonState();
}

class _CalculButtonState extends State<CalculButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      elevation: 8,
      child: Container(
        width: MediaQuery.of(context).size.width * .90,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.title),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
