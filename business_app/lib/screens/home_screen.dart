import '/screens/karnataka_screen.dart';
import '/screens/kerala_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, Object>> _pages = [
    {'page': KeralaScreen(), 'title': 'Sales in Kerala '},
    {'page': KarnatakaScreen(), 'title': 'Sales in Karnataka '}
  ];
  int _selectedPageIndex = 0;
  void _selectScreen(int index) {
    setState(() {
      _selectedPageIndex = index;
      print(_selectedPageIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            drawer: MainDrawer(),
            appBar: AppBar(
              title: Text(_pages[_selectedPageIndex]['title']),
              //    bottom: TabBar(Home: <Widget>[
              //      Tab(text: 'Categories',icon:Icon(Icons.category) ,),
              //      Tab(icon:Icon(Icons.star), text:'Favorites' ,)
              //    ]),
            ),
            body: _pages[_selectedPageIndex]['page'],
            bottomNavigationBar: BottomNavigationBar(
              selectedFontSize: 16,
              unselectedFontSize: 16,
              unselectedItemColor: Colors.white,
              selectedItemColor: Colors.amber,
              backgroundColor: Theme.of(context).primaryColor,
              currentIndex: _selectedPageIndex,
              onTap: _selectScreen,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.location_pin),
                  label: 'Kerala',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.location_pin),
                  label: 'Karnataka',
                ),
              ],
            ),
            // body:TabBarView(children: <Widget>[CategoryScreen(),FavoriteScreen()])
    );
  }
}
