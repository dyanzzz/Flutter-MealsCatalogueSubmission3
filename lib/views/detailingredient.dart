import 'package:flutter/material.dart';

class DetailIngredient extends StatelessWidget {
  DetailIngredient({
    this.strIngredient1,
    this.strIngredient2,
    this.strIngredient3,
    this.strIngredient4,
    this.strIngredient5,
    this.strMeasure1,
    this.strMeasure2,
    this.strMeasure3,
    this.strMeasure4,
    this.strMeasure5,
  });

  final String strIngredient1,
      strIngredient2,
      strIngredient3,
      strIngredient4,
      strIngredient5,
      strMeasure1,
      strMeasure2,
      strMeasure3,
      strMeasure4,
      strMeasure5;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Ingredient & Measure : ",
                    style: TextStyle(fontSize: 18.0, color: Colors.blue),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Card(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              strIngredient1 + " : " + strMeasure1,
                              style: TextStyle(fontSize: 18.0),
                              textAlign: TextAlign.justify,
                            ),
                            Text(
                              strIngredient2 + " : " + strMeasure2,
                              style: TextStyle(fontSize: 18.0),
                              textAlign: TextAlign.justify,
                            ),
                            Text(
                              strIngredient3 + " : " + strMeasure3,
                              style: TextStyle(fontSize: 18.0),
                              textAlign: TextAlign.justify,
                            ),
                            Text(
                              strIngredient4 + " : " + strMeasure4,
                              style: TextStyle(fontSize: 18.0),
                              textAlign: TextAlign.justify,
                            ),
                            Text(
                              strIngredient5 + " : " + strMeasure5,
                              style: TextStyle(fontSize: 18.0),
                              textAlign: TextAlign.justify,
                            ),
                          ])),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
