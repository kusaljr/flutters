import 'package:flutter/material.dart';
import 'package:new_app/pages/homepage.dart';
import 'package:new_app/pages/lyrics_home.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    title: "News Application",
    home: const LyricsHome(),
    theme: ThemeData(fontFamily: "Poppins"),
  ));
}
