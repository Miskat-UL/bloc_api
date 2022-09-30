import 'package:api_task/core/di/app_components.dart';
import 'package:api_task/src/presentation/ui/jobs_page.dart';
import 'package:flutter/material.dart';

void main() async {
  await AppComponents().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Api Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JobPage(),
    );
  }
}
