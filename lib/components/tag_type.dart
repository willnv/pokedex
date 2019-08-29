import 'package:flutter/material.dart';
import 'package:pokedex/style/color_palette.dart';

/// Builds the type tag shown in the Pokémon main screen.
class TagType extends StatelessWidget {

  final String type;

  TagType({
    @required 
    this.type
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      width: 110.0,
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: ColorPalette.typeColors[type],
        boxShadow: [
          BoxShadow(
            color: ColorPalette.typeColors[type],
            offset: Offset(0.0, 0.0),
            blurRadius: 4.0,
            spreadRadius: 0.0,
          )
        ]
      ),
      child: Row(
        children: <Widget>[
          Image.asset("assets/type_icons/_$type.png"),
          Expanded(
            child: Text(
              type.toUpperCase(),
              style: TextStyle(color: Colors.white, fontSize: 14.0),
              textAlign: TextAlign.center,
            )
          )
        ],
      )
    );
  }
}