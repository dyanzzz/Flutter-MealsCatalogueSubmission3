import 'package:flutter/material.dart';

class DetailSpaceTop extends StatelessWidget {
  DetailSpaceTop({this.name, this.tags});
  final String name, tags;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                    child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              name,
                              style:
                                  TextStyle(fontSize: 20.0, color: Colors.blue),
                            ),
                            Text(
                              tags,
                              style:
                                  TextStyle(fontSize: 17.0, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
