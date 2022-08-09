import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multi_role_base_app/admin_screen.dart';
import 'package:multi_role_base_app/home_screen.dart';
import 'package:multi_role_base_app/student_screen.dart';
import 'package:multi_role_base_app/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLoggedin = sp.getBool('isLoggedIn') ?? false;
    String uType= sp.getString('userType')?? '';

    if (isLoggedin) {
      Timer(Duration(seconds: 3), () {
         if(uType=='Student'){
          Navigator.push(context,
            MaterialPageRoute(builder: ((context) => StudentScreen())));
         }
         else if(uType=='Teacher'){
          Navigator.push(context,
            MaterialPageRoute(builder: ((context) => TeacherScreen())));
         }
         else{
           Navigator.push(context,
            MaterialPageRoute(builder: ((context) => AdminScreen())));
         }
      });
    } 
    else {
      Timer(Duration(seconds: 3), () {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => HomeScreen())));
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Welcome To TODO APP',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.green),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Image(
            image: AssetImage('assets/img1.jpg'),
          ),
        ],
      ),
    );
  }
}
