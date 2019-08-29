import 'package:flutter/material.dart';
import 'package:pokedex/style/color_palette.dart';

/// Builds the stat bars section.
/// 
/// Used in the Main Pokémon screen.
class PokeStats extends StatefulWidget {

  final stats;
  final String type;

  PokeStats({
    Key key,
    @required this.stats,
    @required this.type
  });

  @override
  _PokeStatsState createState() => _PokeStatsState();
}

class _PokeStatsState extends State<PokeStats> {

  final List<String> attrNames = [
    'HP',
    'ATK',
    'DEF',
    'SATK',
    'SDEF',
    'SPD',
  ];

  double _applyStatProgressValue(int v) {
    final int maxValue = 255;

    final double pct = (100 * v / maxValue) / 100;
  
    return pct;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.0,
      child: Column( 
        children: <Widget>[
          for (int i = 0; i < 6; i++)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(
                    attrNames[i],
                    style: TextStyle(color: ColorPalette.typeColors[widget.type]),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    widget.stats[i]['base_stat'] < 100 ? '0' + widget.stats[i]['base_stat'].toString() : widget.stats[i]['base_stat'].toString()
                  ),
                ),
                Expanded(
                  //width: 50.0,
                  flex: 2,
                  child: Container(
                    height: 20.0,
                    child: CustomPaint(
                      foregroundPainter: AttrBar(
                        type: widget.type, 
                        percentage: _applyStatProgressValue(widget.stats[i]['base_stat'])
                      ),
                    ),
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AttrBar extends CustomPainter {

  String type; 
  double percentage;

  AttrBar({
    @required this.type,
    @required this.percentage
  });

  @override
  void paint(Canvas canvas, Size size) {

    const BAR_HEIGHT = 13.0;
    double barWidth = size.width;

    // Main line
    Paint line = Paint()
    ..color = Color(0xFFF0F0F0)
    ..style = PaintingStyle.fill;

    // Gradient for filled part
    var gradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [Color(ColorPalette.typeGradients[type][0]), Color(ColorPalette.typeGradients[type][1])],
      //stops: [0.0, 1.0],
    );

    // Paint filled line
    Paint filledLine = Paint()
    ..shader = gradient.createShader(Offset.zero & size)
    ..style = PaintingStyle.fill;

    Rect rect = Offset.zero & Size(barWidth, BAR_HEIGHT);
    Radius bRad = Radius.circular(10.0);
    RRect rrect = RRect.fromRectAndRadius(rect, bRad);

    canvas.drawRRect(rrect, line);
    canvas.drawRRect(RRect.fromRectAndRadius(Offset.zero & Size(barWidth * percentage, BAR_HEIGHT), bRad), filledLine);
  }

  @override 
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}