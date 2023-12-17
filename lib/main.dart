import 'package:flutter/material.dart';
import 'package:todo_app/ui/screens/home/home_screen.dart';
import 'package:todo_app/ui/widgets/my_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
          return MaterialApp(
            routes: {
              HomeScreen.routeName: (context) => HomeScreen(),
            },
            initialRoute: HomeScreen.routeName,
            theme: MyTheme.lightTheme,
          );
        }
  }

