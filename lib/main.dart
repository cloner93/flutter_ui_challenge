import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ui challenge',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 33, 33),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          elevation: 10.0,
          backgroundColor: Color.fromARGB(255, 33, 33, 33),
          selectedItemColor: Colors.amber.shade200,
          unselectedItemColor: Colors.grey,
          onTap: (value) {},
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.apartment), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.cake), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.food_bank), label: "Home")
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: buildPadding(),
      ),
    );
  }

  buildPadding() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Milad Targholi",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 45.0,
                      width: 45.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        image: DecorationImage(
                          image: AssetImage("assets/profile.jpg"),
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  "We hope you are in\ngood mood for cocking.",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
            height: 2.0,
            color: Colors.white24,
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "New Dishes",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "  42",
                      style: TextStyle(
                        color: Colors.amber.shade200,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.menu_rounded,
                  color: Colors.amber.shade200,
                )
              ],
            ),
          ),
          ConstrainedBox(
            child: ListView(
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                buildInputChip("Main Dishes"),
                buildInputChip("Deserts"),
                buildInputChip("Meats"),
              ],
            ),
            constraints: BoxConstraints(maxHeight: 50.0),
          ),
          ConstrainedBox(
            child: ListView(
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                buildContainer(),
                buildContainer(),
                buildContainer(),
                buildContainer(),
                buildContainer(),
                buildContainer(),
              ],
            ),
            constraints: BoxConstraints(),
          ),
        ],
      ),
    );
  }

  buildContainer() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, right: 10, left: 10),
      child: Container(
        padding: EdgeInsets.all(18.0),
        decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Mexican\nPotatoes",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "4.25",
                      style: TextStyle(color: Colors.amber.shade200),
                    ),
                    Text(
                      "(258)",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Container(
                    padding: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        color: Colors.amber.shade200,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        "45 MIN",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 160.0,
              width: 160.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                image: DecorationImage(
                  image: AssetImage("assets/mexica_potatoes.jpg"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  buildInputChip(String lable) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0),
      child: InputChip(
        padding: EdgeInsets.all(5.0),
        onDeleted: () {},
        deleteButtonTooltipMessage: "Clear",
        deleteIconColor: Colors.white,
        backgroundColor: Colors.grey.shade800,
        label: Text(
          lable,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }
}
