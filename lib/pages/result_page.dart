import 'package:bim_calculator/model/interpretation.dart';
import 'package:bim_calculator/model/resultat.dart';
import 'package:bim_calculator/widgets/calcul_button.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final Resulat resultats;
  ResultPage({required this.resultats, Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  double bim = 0.0;
  bool mal = false;
  bool femal = false;
  @override
  void initState() {
    super.initState();
    bim = widget.resultats.bim;
    mal = widget.resultats.male;
    femal = widget.resultats.female;
    //var test= _interpretation().;
  }

//me revois les prefix des sexes
  String _sexPrefix() {
    if (mal) {
      return "homme"; 
    } else {
      return "femme";
    }
  }

  Interpretation _interpretation() {
    if (bim < 18.5) {
      return Interpretation(0, "Maigre", Colors.red,
          "assets/images/" + _sexPrefix() + "_maigre.jpg");
    } else if (bim >= 18.5 && bim <= 25) {
      return Interpretation(0, "Normal", Colors.green,
          "assets/images/" + _sexPrefix() + "_normal.jpg");
    } else if (bim > 25 && bim <= 30) {
      return Interpretation(0, "Surpoids", Colors.pink,
          "assets/images/" + _sexPrefix() + "_surpoids.jpg");
    } else {
      return Interpretation(0, "Obèse", Colors.redAccent,
          "assets/images/" + _sexPrefix() + "_obese.jpg");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vos resultats"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              //height: MediaQuery.of(context).size.height * .60,
              child: Stack(
                //clipBehavior: Clip.hardEdge,
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 100,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            _interpretation().corpulence,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: _interpretation().couleur),
                          ),
                          Text(bim.toStringAsFixed(2),
                              style: const TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .60,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey[700],
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          //border: Border.all(),
                          image: DecorationImage(
                              image: AssetImage(_interpretation().image),
                              fit: BoxFit.contain),
                          color: Colors.white,
                          shape: BoxShape.circle),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CalculButton(title: "NOUVEAU CALCUL"),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
