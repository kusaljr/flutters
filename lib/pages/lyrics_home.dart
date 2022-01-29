import 'package:flutter/material.dart';
import 'package:new_app/pages/view_lyrics.dart';

class LyricsHome extends StatefulWidget {
  const LyricsHome({Key? key}) : super(key: key);

  @override
  _LyricsHomeState createState() => _LyricsHomeState();
}

class _LyricsHomeState extends State<LyricsHome> {
  String artist = "";
  String title = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildArtist() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Enter Artist Name"),
      validator: (value) {
        if (value.toString().isEmpty) {
          return "Name is required";
        }
      },
      onSaved: (value) {
        artist = value.toString();
      },
    );
  }

  Widget _buildTitle() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Enter Song Name"),
      validator: (value) {
        if (value.toString().isEmpty) {
          return "Song Name is required";
        }
      },
      onSaved: (value) {
        title = value.toString();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(24),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Lyrics Finder",
                  style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
                SizedBox(
                  height: 60,
                ),
                _buildTitle(),
                const SizedBox(height: 30),
                _buildArtist(),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                  child: const Text("Search",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    _formKey.currentState!.save();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewLyrics(
                                passedArtist: artist, passedTitle: title)));
                  },
                )
              ],
            )),
      )),
    );
  }
}
