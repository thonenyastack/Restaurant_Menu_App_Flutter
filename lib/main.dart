import 'package:coffee_masters/datamanager.dart';
import 'package:coffee_masters/offerpage.dart';
import 'package:coffee_masters/menupage.dart';
import 'package:coffee_masters/orderpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var dataManager = DataManager();
  var selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    Widget currentWidgetPage = const Text("Homepage");

    switch (selectedindex) {
      case 0:
        currentWidgetPage = MenuPage(
          dataManager: dataManager,
        );
        break;
      case 1:
        currentWidgetPage = const OffersPage();
        break;
      case 2:
        currentWidgetPage = OrderPage(
          dataManager: dataManager,
        );
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Image.asset("images/logov2.png"),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedindex,
          onTap: (newIndex) {
            setState(() {
              selectedindex = newIndex;
            });
          },
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.yellowAccent.shade700,
          unselectedItemColor: Colors.brown.shade50,
          items: const [
            BottomNavigationBarItem(label: "Menu", icon: Icon(Icons.coffee)),
            BottomNavigationBarItem(
                label: "Offers", icon: Icon(Icons.local_offer)),
            BottomNavigationBarItem(
                label: "Orders", icon: Icon(Icons.shopping_cart)),
          ]),
      body: currentWidgetPage,
    );
  }
}

class GreetApp extends StatefulWidget {
  const GreetApp({Key key}) : super(key: key);

  @override
  State<GreetApp> createState() => _GreetAppState();
}

class _GreetAppState extends State<GreetApp> {
  // State variable
  var name = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Hello $name",
          style: TextStyle(fontSize: 22),
        ),
        TextField(
            // OnChanged Method anon function which accept func(setState) as an arg
            onChanged: (value) => setState(() {
                  name = value;
                })),
      ],
    );
  }
}

class HelloApp extends StatelessWidget {
  const HelloApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: const Text("App Running."));
  }
}
