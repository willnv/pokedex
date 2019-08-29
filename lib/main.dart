import 'package:flutter/material.dart';
import 'package:pokedex/main_list.dart';
import 'package:pokedex/components/search_bar.dart';

void main() => runApp(MaterialApp(
  title: "Flutterdex",
  home: HomePage()
));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(appBar: AppBar()),
      body: MainList()
    );
  }
}