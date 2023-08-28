import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'graph.dart';
import 'history.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  Widget _currentScreen = GraphScreen();
  List<IconData> iconList = [Icons.show_chart, Icons.history];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Weight tracker")),
      //body: GraphScreen(),
      body: _currentScreen,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: null,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        height: Get.height / 10,
        // Get cihazın aktif yüksekliğini verir.
        backgroundColor: Colors.black,
        activeColor: Colors.white,
        inactiveColor: Colors.grey,
        icons: iconList,
        activeIndex: _currentIndex,
        gapLocation: GapLocation.center,
        //notchSmoothness: NotchSmoothness.verySmoothEdge,
        //leftCornerRadius: 32,
        //rightCornerRadius: 32,
        iconSize: 30,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _currentScreen = (index == 0) ? GraphScreen() : HistoryScreen();
          });
        },
      ),
    );
  }
}
