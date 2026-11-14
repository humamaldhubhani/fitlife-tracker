// Main entry point for the Virtual Bookstore app
import 'package:flutter/material.dart';
import 'package:virtual_bookstore/signup/TraineeSignupScreen.dart';
import 'package:virtual_bookstore/signup/users_trainers.dart';
import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart';
import 'signup/UserSignupScreen.dart';
import 'home_screens/user_home_screen.dart';
import 'screens/add_edit_book_screen.dart';
void main() {
  runApp(const VirtualBookstoreApp());
  
}

class VirtualBookstoreApp extends StatelessWidget {
  const VirtualBookstoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Virtual Bookstore',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      //initialRoute:'/login' ,
       routes: {
        '/userhome': (context) => const User_Home_Screen(),
        '/login': (context) =>   LoginScreen(),
        '/': (context) => const OnboardingScreen(),
        '/users_trainers': (context) => UserTrainers(),
        '/UserSignup': (context) => const UserSignupScreen(),
        '/TraineeSignupScreen': (context) => const TraineeSignupScreen(),
        '/add-edit-book': (context) => const AddEditBookScreen(),
       },
      //home: HomeScreen(),
    );
  }
}
