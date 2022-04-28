
import 'package:assessment_countries/api.dart';
import 'package:assessment_countries/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // provider scope
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> ApiProvider() ) ,
      ],child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
