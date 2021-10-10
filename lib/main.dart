import 'package:flutter/material.dart';
import 'database/bloc/bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Provider<Bloc>(
        create: (context) => Bloc(),
        child: Container(),
      ),
    );
  }
}
