import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main(){
  runApp(MyTabApp());
}

class MyTabApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TabApp',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();

}



class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;


  static const List<Widget> _pages = <Widget>[
    Icon(
      Icons.looks_one_sharp,
      size: 100,
    ),


    Icon(
      Icons.looks_two_sharp,
      size: 100,
    ),

  ];

  void _onItemTapped(int  index){
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {

    return DefaultTabController(length: 3,
      child: Scaffold(
      appBar: AppBar(
        title: Text('TabApp'),
        bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.account_box_rounded),
                text: "Acc",),

              Tab(icon: Icon(Icons.home),
                text: "home",),

              Tab(icon: Icon(Icons.exit_to_app),
                text: "Ext",),
            ]
        ),
      ),


      body: Stack(
        children: [const TabBarView(
            children: [
              Center(
                child: Icon(Icons.account_box_rounded),
              ),
              Center(
                child: Icon(Icons.home),),

              Center(
                child: Icon(Icons.exit_to_app),
              ),
            ]),

          Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [_pages.elementAt(_selectedIndex)
    ],),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.purple,
        items:
        const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_one_sharp),
            backgroundColor: Colors.deepOrangeAccent,
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_two_sharp),
            label: 'Camera',
          ),
        ],

        currentIndex: _selectedIndex,
        backgroundColor: Colors.lightBlueAccent,
        onTap: _onItemTapped,


      ),

        ),
    );
  }

}