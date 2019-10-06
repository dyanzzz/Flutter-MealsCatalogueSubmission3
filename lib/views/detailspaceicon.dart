import 'package:flutter/material.dart';

class DetailSpaceIcon extends StatelessWidget {
  DetailSpaceIcon({this.area, this.category});
  final String area, category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Icontext(
            icon: Icons.person_pin_circle,
            text: area,
          ),
          Icontext(
            icon: Icons.bookmark_border,
            text: category,
          ),
        ],
      ),
    );
  }
}

class Icontext extends StatelessWidget {
  Icontext({this.icon, this.text});
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            size: 50.0,
            color: Colors.blue,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 13.0, color: Colors.blue),
          )
        ],
      ),
    );
  }
}
