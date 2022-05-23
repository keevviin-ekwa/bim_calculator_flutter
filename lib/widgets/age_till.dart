import 'package:flutter/material.dart';

class AgeTile extends StatefulWidget {
  final String title;
  final void Function(int value) parentCallBack;

  ///met a jour le sate du parent

  AgeTile({this.title = '', required this.parentCallBack, Key? key})
      : super(key: key);

  @override
  State<AgeTile> createState() => _AgeTileState();
}

class _AgeTileState extends State<AgeTile> {
  late int value;

  _incrementValue(value) {
    return value + 1;
  }

  _decrementValue(value) {
    if (value == 0) {
      return value;
    } else {
      return value - 1;
    }
  }

  @override
  void initState() {
    value = 0;
    super.initState();
  }

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
          children: [
            Text(widget.title),
            Text(
              value.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              value = _decrementValue(value);
                            });
                            widget.parentCallBack(value);
                          },
                          icon: const Icon(Icons.remove))),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              value = _incrementValue(value);
                            });
                            widget.parentCallBack(value);
                          },
                          icon: const Icon(Icons.add))),
                ),
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.blueGrey[700],
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
