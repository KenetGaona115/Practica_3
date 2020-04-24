import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practica_tres/bloc/application_bloc.dart';

import 'package:practica_tres/home/home.dart';

void main() {
  runApp(
    BlocProvider(
      // bloc accesible desde toda la app
      create: (context) => ApplicationBloc()..add(FakeFetchDataEvent()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica 3',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: DefaultTabController(
        length: 2,
        child: HomePage(),
      ),
    );
  }
}
