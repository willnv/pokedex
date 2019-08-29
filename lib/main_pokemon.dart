import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pokedex/style/color_palette.dart';
import 'package:pokedex/components/tag_type.dart';
import 'package:pokedex/components/stats.dart';
import 'package:pokedex/services/poke_api.dart' as api;
import 'package:pokedex/components/voltorb_spinner.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

class MainPokemon extends StatefulWidget {

  final currentPoke;

  MainPokemon({
    Key key, 
    this.currentPoke
  }) : super(key: key);

  @override
  _MainPokemonState createState() => _MainPokemonState();
}

class _MainPokemonState extends State<MainPokemon> {

  var pokeData;
  var pokeSpecies;

  bool loading = true;
  static const WIDGET_H_MARGIN = 25.0;

  _MainPokemonState({ 
    this.pokeData,
    this.pokeSpecies
  });

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() async {
    var apiCall = api.PokeApi(pokeID: int.parse(widget.currentPoke['id']));
    var pokemonData = await apiCall.fetchPokeData();
    var pokemonSpecies = await apiCall.fetchPokeSpecies();

    pokeData = jsonDecode(pokemonData.body);
    pokeSpecies = jsonDecode(pokemonSpecies.body);

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading ? VoltorbSpinner() : Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 55.0),
            alignment: Alignment(0.0, 0.0), // Container stretches to screen size
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(ColorPalette.typeGradients[widget.currentPoke['typeList'][0]][0]),
                  Color(ColorPalette.typeGradients[widget.currentPoke['typeList'][0]][1])
                ]
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[ 
                Container(
                  height: 170.0,
                  child: Image.asset("assets/poke_thumbnails/big/${widget.currentPoke['id']}${widget.currentPoke['name']}.png"),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      color: Color(0xFFFAFAFA),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(48.0),
                        topRight: Radius.circular(48.0),
                      )
                    ),
                    child: ListView(
                      children: <Widget> [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: Container( // Name
                            alignment: Alignment.center,
                            child: Text(
                              widget.currentPoke['name'],
                              style: TextStyle(color: ColorPalette.mainText, fontSize: 40.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: Row( // TypeList
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: TagType(type: widget.currentPoke['typeList'][0]),
                              ),
                              if (widget.currentPoke['typeList'].length == 2)
                              Container(
                                margin: EdgeInsets.only(left: 15.0),
                                child: TagType(type: widget.currentPoke['typeList'][1]),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0, left: WIDGET_H_MARGIN, right: WIDGET_H_MARGIN),
                          child: Container( // Description 
                            child: Text(
                              pokeSpecies['flavor_text_entries'][1]['flavor_text'].replaceAll(RegExp(r'\n'), ' '),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          child: DefaultTabController(
                          length: 3,
                          child: Column(
                            children: <Widget>[
                              TabBar(
                                indicatorSize: TabBarIndicatorSize.label,
                                unselectedLabelColor: ColorPalette.typeColors[widget.currentPoke['typeList'][0]],
                                indicator: BubbleTabIndicator(
                                  indicatorHeight: 30.0,
                                  indicatorColor: ColorPalette.typeColors[widget.currentPoke['typeList'][0]]
                                ),
                                tabs: <Widget>[
                                  Tab(text: "Stats".toUpperCase()),
                                  Tab(text: "Evolutions".toUpperCase()),
                                  Tab(text: "Moves".toUpperCase())
                                ],
                              ),
                              SizedBox(
                                height: 200.0,
                                child: TabBarView(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: WIDGET_H_MARGIN, right: WIDGET_H_MARGIN),
                                      child: PokeStats(stats: pokeData['stats'].reversed.toList(), type: widget.currentPoke['typeList'][0]),
                                    ),
                                    Container(child: Text('Coming soon!'),height: 50.0),
                                    Container(child: Text('Coming soon!'),height: 50.0)
                                  ],
                                ),
                              )
                            ],
                            ),
                          ),
                        ),
                      ]
                    ),
                  )
                )
              ],
            ),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(  
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
          )
        ]
      ),
    );
  }
}
