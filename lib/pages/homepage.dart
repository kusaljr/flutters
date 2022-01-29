import 'package:flutter/material.dart';
import 'package:new_app/components/caraousel.dart';
import 'package:new_app/components/club_selector.dart';
import 'package:new_app/components/tiled_news.dart';
import 'package:new_app/components/topbar.dart';
import 'package:new_app/components/welcome_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  TopBar(),
                  SizedBox(
                    height: 5,
                  ),
                  Text("One Place for all sports related news!"),
                  SizedBox(
                    height: 20,
                  ),
                  WelcomeWidget(),
                  SizedBox(
                    height: 20,
                  ),
                  NewsCaraousel(),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Text(
                      "Europen Royals",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CategorySelector(),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "Top News",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  TiledNews()
                ],
              ),
            )
          ],
        ),
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: NetworkImage(
                  "https://freepngimg.com/download/premier_league/32207-5-premier-league-file.png"),
              width: 30,
              height: 30,
            ),
            label: 'Premier League',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Others',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Image(
                width: 30,
                height: 30,
                image: NetworkImage(
                    "https://www.pinclipart.com/picdir/big/102-1027507_champions-league-logo-logok-football-clip-art-with.png")),
            label: 'UCL',
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.grey[700],
        onTap: _onItemTapped,
      ),
    );
  }
}
