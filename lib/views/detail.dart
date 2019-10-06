import 'package:flutter/material.dart';
import 'package:meals_catalogue_submission3/models/meals.dart';
import 'package:meals_catalogue_submission3/views/detailspacetop.dart';
import 'package:meals_catalogue_submission3/views/detailspaceicon.dart';
import 'package:meals_catalogue_submission3/views/detailinstructions.dart';
import 'package:meals_catalogue_submission3/views/detailingredient.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; //json
import 'package:flutter/foundation.dart';

Future<Meals> fetchPost(id) async {
  final response = await http
      .get('https://www.themealdb.com/api/json/v1/1/lookup.php?i=' + id);

  if (response.statusCode == 200) {
    return Meals.fromJson(json.decode(response.body)['meals'][0]);
  } else {
    throw Exception('Failed to load post');
  }
}

class MealsDetailPage extends StatelessWidget {
  final Meals meals;

  MealsDetailPage({Key key, this.meals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(meals.strMeal),
        ),
        body: getBody());
  }

  getBody() {
    var name = meals.strMeal;
    var id = meals.idMeal;
    var img = meals.strMealThumb;

    return ListView(
      children: <Widget>[
        Container(
            height: 240.0,
            child: Hero(
              tag: name,
              child: Material(
                child: InkWell(
                  child: Image.network(
                    img,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )),
        Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: FutureBuilder<Meals>(
                        future: fetchPost(id),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return MainDetail(
                                id: id,
                                name: snapshot.data.strMeal ?? "",
                                instruction: snapshot.data.strInstructions ??
                                    "No Instructions",
                                category:
                                    snapshot.data.strCategory ?? "No Category",
                                area: snapshot.data.strArea ?? "No Area",
                                tags: snapshot.data.strTags ?? "No Tags",
                                strIngredient1:
                                    snapshot.data.strIngredient1 ?? "-",
                                strIngredient2:
                                    snapshot.data.strIngredient2 ?? "-",
                                strIngredient3:
                                    snapshot.data.strIngredient3 ?? "-",
                                strIngredient4:
                                    snapshot.data.strIngredient4 ?? "-",
                                strIngredient5:
                                    snapshot.data.strIngredient5 ?? "-",
                                strMeasure1: snapshot.data.strMeasure1 ?? "-",
                                strMeasure2: snapshot.data.strMeasure2 ?? "-",
                                strMeasure3: snapshot.data.strMeasure3 ?? "-",
                                strMeasure4: snapshot.data.strMeasure4 ?? "-",
                                strMeasure5: snapshot.data.strMeasure5 ?? "-");
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }

                          return CircularProgressIndicator();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MainDetail extends StatelessWidget {
  MainDetail(
      {this.id,
      this.name,
      this.instruction,
      this.category,
      this.area,
      this.tags,
      this.strIngredient1,
      this.strIngredient2,
      this.strIngredient3,
      this.strIngredient4,
      this.strIngredient5,
      this.strMeasure1,
      this.strMeasure2,
      this.strMeasure3,
      this.strMeasure4,
      this.strMeasure5});

  final String id,
      name,
      instruction,
      category,
      area,
      tags,
      strIngredient1,
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
              children: [
                DetailSpaceTop(name: name, tags: tags),
                DetailSpaceIcon(area: area, category: category),
                DetailInstructions(instruction: instruction),
                DetailIngredient(
                  strIngredient1: strIngredient1,
                  strIngredient2: strIngredient2,
                  strIngredient3: strIngredient3,
                  strIngredient4: strIngredient4,
                  strIngredient5: strIngredient5,
                  strMeasure1: strMeasure1,
                  strMeasure2: strMeasure2,
                  strMeasure3: strMeasure3,
                  strMeasure4: strMeasure4,
                  strMeasure5: strMeasure5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
