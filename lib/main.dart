import 'package:flutter/material.dart';
import 'package:magic_workout/core/di.dart';
import 'package:magic_workout/core/helper/object_box.dart';
import 'package:magic_workout/presentation/screens/workout_list_screen.dart';

late ObjectBox objectBox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies(); //The new one
  objectBox = await ObjectBox.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      home: const WorkoutListScreen(),
    );
  }
}
