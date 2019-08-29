import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/main_pokemon.dart';
import 'package:pokedex/components/circular_type.dart';
import 'package:pokedex/style/color_palette.dart';

/// Builds the main Pokémon list screen.
/// 
/// First screen to show up in the app, retrieves
/// info from a JSON file listing all Gen1 Pokémon.

class MainList extends StatefulWidget {
  @override
  _MainListState createState() => _MainListState();
}

class _MainListState extends State<MainList> {

  var pokeDataDecoded;

  @protected
  @mustCallSuper
  void initState() {
    getPokeData();
  }

  Future<dynamic> getPokeData() async {
    var loadedData = await rootBundle.loadString('lib/data/poke_list.json'); // returns String
    
    setState(() {
      pokeDataDecoded = jsonDecode(loadedData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: pokeDataDecoded == null ? CircularProgressIndicator() : ListView.separated(
        itemCount: pokeDataDecoded['pokes'].length, 
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () { 
              Navigator.push(context, MaterialPageRoute( 
                builder: (context) => MainPokemon(currentPoke: pokeDataDecoded['pokes'][index])
              ));
            }, 
            child: Row(
              children: <PokeListItem>[
                PokeListItem(
                  name: pokeDataDecoded['pokes'][index]['name'],
                  number: pokeDataDecoded['pokes'][index]['id'],
                  type: pokeDataDecoded['pokes'][index]['typeList']
                ),
              ]
            ),
          );
        }, 
        separatorBuilder: (c, i) => Divider(endIndent: 20.0, indent: 20.0, height: 1.0,),
      )
    ); 
  }
}

// Main model Widget to build the Pokémon list.
// *Thumbnail is generated using name and number.
class PokeListItem extends StatelessWidget {

  const PokeListItem({
    this.name, 
    this.number,
    this.type
  });

  final String name;
  final String number;
  final List type;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          top: 15.0,
          bottom: 15.0,
          left: 15.0,
          right: 0.0,
        ),
        child: Row( 
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            //Thumbnail
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                height: 40.0,
                child: Image.asset(
                  'assets/poke_thumbnails/$number$name.png',
                ),
              )
            ),
            // Name and number
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(children: <Widget>[Text(
                    name,
                    style: TextStyle(color: ColorPalette.mainText, fontSize: 19.0),
                  )]),
                  Row(children: <Widget>[Text(
                    "#$number",
                    style: TextStyle(color: ColorPalette.secText, fontSize: 15.0),
                  )]),
                ],
              ), 
            ),
            // Types
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                height: 43.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: CircularType(type: type[0]),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 9.0),
                      child: type.length == 2 ? CircularType(type: type[1]) : null
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      )
    );
  }
}