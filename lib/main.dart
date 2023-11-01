import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neomorphic_timer_flutter/screens/home_screen.dart';
void main(){

  WidgetsFlutterBinding.ensureInitialized();
  //  Setting the app only in on Orientation
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor:const Color.fromRGBO(231, 240, 247, 1),
        scaffoldBackgroundColor: const Color.fromRGBO(231, 240, 247, 1)
      ),
      
      home: HomeScreen(),
    );
  }
}
