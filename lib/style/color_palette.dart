import 'package:flutter/material.dart';

// Main color palette class used throughout the app
class ColorPalette {

  static Color mainText = Color(0xFF4F4F4F);
  static Color secText = Color(0xFFA4A4A4);

  static List listGradient = [0xFF6E95FD, 0xFF6FDEFA, 0xFF8DE061, 0xFF51E85E];

  // Used on tag types and some texts.
  static Map<String, Color> typeColors = {
    "bug":      Color(0xFF9DC130),
    "dark":     Color(0xFF5F606D),
    "dragon":   Color(0xFF0773C7),
    "electric": Color(0xFFEDD53F),
    "fairy":    Color(0xFFEF97E6),
    "fighting": Color(0xFFD94256),
    "fire":     Color(0xFFF8A54F),
    "flying":   Color(0xFF9BB4E8),
    "ghost":    Color(0xFF6970C5),
    "grass":    Color(0xFF5DBE62),
    "ground":   Color(0xFFD78555),
    "ice":      Color(0xFF7ED4C9),
    "normal":   Color(0xFF9A9DA1),
    "poison":   Color(0xFFB563CE),
    "psychic":  Color(0xFFF87C7A),
    "rock":     Color(0xFFCEC18C),
    "steel":    Color(0xFF5596A4),
    "water":    Color(0xFF559EDF)
  };

  // color gradients used in the main Pokémon screen background,
  // circular type icons and stat bars.
  static Map<String, List> typeGradients = {
    "bug":      [0xFF92BC2C, 0xFFAFC836],
    "dark":     [0xFF595761, 0xFF6E7587],
    "dragon":   [0xFF0C69C8, 0xFF0180C7],
    "electric": [0xFFEDD53E, 0xFFFBE273],
    "fairy":    [0xFFEC8CE5, 0xFFF3A7E7],
    "fighting": [0xFFCE4265, 0xFFE74347],
    "fire":     [0xFFFB9B51, 0xFFFBAE46],
    "flying":   [0xFF90A7DA, 0xFFA6C2F2],
    "ghost":    [0xFF516AAC, 0xFF7773D4],
    "grass":    [0xFF5FBC51, 0xFF5AC178],
    "ground":   [0xFFDC7545, 0xFFD29463],
    "ice":      [0xFF70CCBD, 0xFF8CDDD4],
    "normal":   [0xFF9298A4, 0xFFA3A49E],
    "poison":   [0xFFA864C7, 0xFFC261D4],
    "psychic":  [0xFFF66F71, 0xFFFE9F92],
    "rock":     [0xFFC5B489, 0xFFD7CD90],
    "steel":    [0xFF52869D, 0xFF58A6AA],
    "water":    [0xFF559EDF, 0xFF559EDF]
  };
}
