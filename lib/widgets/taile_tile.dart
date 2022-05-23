import 'package:flutter/material.dart';

class TailleTile extends StatefulWidget {
  final void Function(int value) parentCallBack;
  TailleTile({ required this.parentCallBack,Key? key}) : super(key: key);

  @override
  State<TailleTile> createState() => _TailleTileState();
}

class _TailleTileState extends State<TailleTile> {
  late RangeValues _currentRangeValues;
  
  @override
  void initState() {
    _currentRangeValues = const RangeValues(0, 100);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      elevation: 8,
      child: Container(
        width: MediaQuery.of(context).size.width * 70,
        height: 200,
        child: SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width * .5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Taille"),
              Text(
                _currentRangeValues.end.toInt().toString() + " cm",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              RangeSlider(
                activeColor: Colors.red,
                max: 300,
                min: 0,
                values: _currentRangeValues,
                onChanged: (value) {
                  setState(() {
                    _currentRangeValues = value;
                  });
                },
                onChangeEnd: (value) => widget.parentCallBack(value.end.toInt()),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.blueGrey[700],
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
