import 'package:bim_calculator/model/resultat.dart';
import 'package:bim_calculator/pages/result_page.dart';
import 'package:bim_calculator/widgets/age_till.dart';
import 'package:bim_calculator/widgets/calcul_button.dart';
import 'package:bim_calculator/widgets/taile_tile.dart';
import 'package:bim_calculator/widgets/sex_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool maleTileSelected;
  late bool femaleTileSelected;

  int poids = 0;
  int age = 0;
  double taille = 0;

  _bimCalcul() {
    if (taille == 0) {
      taille = 1;
    }
    double bim = poids / (taille * taille);

    var _result = Resulat(0, bim, age, maleTileSelected, femaleTileSelected);
    return _result;
  }

  _getPoidsValue(int _val) {
    setState(() {
      poids = _val;
    });
  }

  _getAgeValue(int _val) {
    setState(() {
      age = _val;
    });
  }

  _getTailleValue(int val) {
    setState(() {
      taille = val / 100;
    });
  }

  @override
  void initState() {
    maleTileSelected = true;
    femaleTileSelected = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BIM calculator"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        maleTileSelected = true;
                        femaleTileSelected = false;
                      });
                    },
                    child: SexTile(
                      selected: maleTileSelected,
                      title: "Homme",
                      child: const Icon(
                        Icons.male,
                        color: Colors.white,
                        size: 70,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // _getValue();
                      setState(() {
                        maleTileSelected = false;
                        femaleTileSelected = true;
                      });
                    },
                    child: SexTile(
                      selected: femaleTileSelected,
                      // Colors.blueGrey!![700],
                      title: "Femme",
                      child: const Icon(
                        Icons.female,
                        color: Colors.white,
                        size: 70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: TailleTile(
                parentCallBack: _getTailleValue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AgeTile(
                    title: "Poids",
                    parentCallBack: _getPoidsValue,
                  ),
                  AgeTile(title: "Age", parentCallBack: _getAgeValue)
                ],
              ),
            ),
            GestureDetector(
                onTap: () {
                  var result = _bimCalcul();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ResultPage(
                            resultats: result,
                          )));
                },
                child: CalculButton(
                  title: "CALCULER",
                ))
          ],
        ),
      ),
    );
    ;
  }
}
