import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meals_catalogue_submission3/models/meals.dart';
import 'package:meals_catalogue_submission3/views/detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; //json

List<Meals> parsePhotos(String responseBody) {
  final parsed =
      json.decode(responseBody)['meals'].cast<Map<String, dynamic>>();
  return parsed.map<Meals>((json) => Meals.fromJson(json)).toList();
}

Future<List<Meals>> fetchPhotos(http.Client client, url) async {
  final response = await client
      .get('https://www.themealdb.com/api/json/v1/1/filter.php?c=' + url);
  return compute(parsePhotos, response.body);
}

class MealsList extends StatelessWidget {
  final List<Meals> meal;

  MealsList({Key key, this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    final double widthScreen = mediaQueryData.size.width;
    //final double appBarHeight = kToolbarHeight;
    //final double paddingTop = mediaQueryData.padding.top;
    //final double paddingBottom = mediaQueryData.padding.bottom;
    final double heightScreen = mediaQueryData.size.height/1.40;

    return GridView.builder(
        padding: EdgeInsets.all(2.0),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: widthScreen/heightScreen,
        ),
        itemCount: meal.length,
        itemBuilder: (context, index) {
          var name = meal[index].strMeal;
          var img = meal[index].strMealThumb;

          return Container(
              padding: EdgeInsets.all(2.0),
              child: Card(
                  child: Column(
                children: [
                  Hero(
                    tag: name,
                    child: Material(
                      child: InkWell(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          //NAVIGATOR PUSH

                          builder: (BuildContext contex) => MealsDetailPage(
                            meals: meal[index],
                          ),
                        )),
                        child: Image.network(
                          img,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      name,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              )));
        });
  }
}

void main() => runApp(MealsPage());

class MealsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Padding(padding: EdgeInsets.all(2.00));
    return MaterialApp(
        home: DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.free_breakfast),
                text: "Dessert",
              ),
              Tab(
                icon: Icon(Icons.restaurant),
                text: "Seafood",
              ),
            ],
          ),
          title: Text("The Meals"),
        ),
        body: TabBarView(
          children: [
            FutureBuilder<List<Meals>>(
                future: fetchPhotos(http.Client(), 'Dessert'),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? MealsList(meal: snapshot.data)
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                }),
            FutureBuilder<List<Meals>>(
                future: fetchPhotos(http.Client(), 'Seafood'),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? MealsList(meal: snapshot.data)
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                }),
          ],
        ),
      ),
    ));
  }
}
