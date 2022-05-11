import 'package:ezoom/resources/auth_methods.dart';
import 'package:ezoom/screens/homez-screen.dart';
import 'package:ezoom/screens/login_screen.dart';
import 'package:ezoom/screens/video_call_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ezoom/utilis/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ezoom',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor
      ),
      routes: {
        '/login':(context)=>const  LoginScreen(),
        '/home':(context) =>const HomeScreen(),
        '/video-call':(context)=>const VideoCallScreen(),


      },
      home: StreamBuilder(
        stream: AuthMethods().authChanges,
        builder: (context, snaphot){
          if(snaphot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(snaphot.hasData){
            return const HomeScreen();
          }
          return const LoginScreen();
        },
      ),
    );
  }
}
