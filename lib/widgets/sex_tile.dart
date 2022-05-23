import 'package:flutter/material.dart';

class SexTile extends StatefulWidget {
  final String title;
  final Widget child;
  final bool selected;
  SexTile(
      {required this.child,
      required this.title,
      this.selected = false,
      Key? key})
      : super(key: key);

  @override
  State<SexTile> createState() => _SexTileState();
}

class _SexTileState extends State<SexTile> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      elevation: 8,
      child: Container(
        width: MediaQuery.of(context).size.width * .45,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [widget.child, Text(widget.title)],
        ),
        decoration: BoxDecoration(
            color: widget.selected ? Colors.red : Colors.blueGrey[700],
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
