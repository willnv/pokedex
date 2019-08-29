import 'package:flutter/material.dart';
import 'package:pokedex/style/color_palette.dart';

class CircularType extends StatelessWidget {

  final String type;

  CircularType({
    @required 
    this.type
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28.0,
      width: 28.0,
      padding: EdgeInsets.all(7.0),
      //alignment: Alignment.center,
      decoration: BoxDecoration( 
        borderRadius: BorderRadius.circular(100.0),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(ColorPalette.typeGradients[type][0]),
            Color(ColorPalette.typeGradients[type][1])
          ]
        ),
        boxShadow: [
          BoxShadow(
            color: ColorPalette.typeColors[type],
            offset: Offset(0.0, 0.0),
            blurRadius: 4.0,
            spreadRadius: 0.0,
          )
        ]
      ),
      child: Image.asset("assets/type_icons/_$type.png")
    );
  }
}