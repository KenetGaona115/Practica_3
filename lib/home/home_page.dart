import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:practica_tres/home/home.dart';
import 'package:practica_tres/home/newData.dart';
import 'package:practica_tres/home/new_picture.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Tab> _tabs = [
    Tab(
      icon: Icon(Icons.view_column),
      text: "Barcodes",
    ),
    Tab(
      icon: Icon(Icons.nature_people),
      text: "Images",
    ),
  ];

  final List<Widget> _tabsBody = [
    BarcodeScanner(),
    ImagesLabeling(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(child: Text("Objetos en imagenes")),
        bottom: TabBar(tabs: _tabs),
      ),
      body: TabBarView(children: _tabsBody),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        visible: true,
        curve: Curves.bounceIn,
        children: [
          SpeedDialChild(
            child: Icon(
              Icons.code,
              color: Colors.white,
            ),
            backgroundColor: Colors.deepOrange,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return NewPicture();
                  },
                ),
              );
            },
            label: "Barcode",
            labelBackgroundColor: Colors.deepOrangeAccent,
          ),
          SpeedDialChild(
            child: Icon(
              Icons.image_aspect_ratio,
              color: Colors.white,
            ),
            backgroundColor: Colors.green,
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return NewData();
                  },
                ),
              ) ,
            label: "Labeling",
            labelBackgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
