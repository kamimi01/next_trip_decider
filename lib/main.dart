import 'package:flutter/material.dart';
import 'Record/RecordScreen.dart';
import 'Roulette/RouletteScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: '次日本のどこへ行く？'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    Tab(text: "次どこいく？", icon: Icon(Icons.flight)),
    Tab(text: "どこいった？", icon: Icon(Icons.history)),
  ];

  late TabController _tabController = TabController(length: tabs.length, vsync: this);

  // @override
  // void initState() {
  //   super.initState();
  //   _tabController = TabController(length: tabs.length, vsync: this);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(""),
      ),
      bottomNavigationBar: TabBar(
        tabs: tabs,
        controller: _tabController,
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.orange,
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          RouletteScreen(),
          RecordScreen(),
        ],
      )
    );
  }
}
