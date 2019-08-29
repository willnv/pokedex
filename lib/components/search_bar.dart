import 'package:flutter/material.dart';
import 'package:pokedex/style/color_palette.dart';

/// Actual search not yet implemented.
class SearchBar extends StatelessWidget implements PreferredSizeWidget {

  final AppBar appBar;
  final List<Widget> widgets;

  SearchBar({ 
    Key key,
    this.appBar,
    this.widgets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        backgroundColor: Color(0xCCFAFAFA),
        title: Text("Pokémon", style: TextStyle(color: ColorPalette.mainText)),
        centerTitle: true,
        elevation: 0.0,
        /*flexibleSpace: PreferredSize(
          preferredSize: Size.fromHeight(140.0),
          child: Container(
            height: 140.0,
            alignment: AlignmentDirectional.bottomCenter,
            padding: EdgeInsets.symmetric( 
              horizontal: 30.0,
              vertical: 15.0
            ),
            child: Container(
              height: 40.0,
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.all(5.0),
                  filled: true,
                  fillColor: Color(0x1F000000),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Color(0x00000000), width: 0.0)
                  ),
                  enabledBorder: OutlineInputBorder( 
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Color(0x00000000), width: 0.0)
                  )
                ),
              ), 
            ) 
          ),
        ),*/
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container( 
            height: 4.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(ColorPalette.listGradient[0]),
                  Color(ColorPalette.listGradient[1]),
                  Color(ColorPalette.listGradient[2]),
                  Color(ColorPalette.listGradient[3])
                ]
              )
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(ColorPalette.listGradient[0]),
            Color(ColorPalette.listGradient[1]),
            Color(ColorPalette.listGradient[2]),
            Color(ColorPalette.listGradient[3])
          ]
        )
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120.0);
}