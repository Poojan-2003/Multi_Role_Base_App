import 'package:flutter/material.dart';
import 'package:multi_role_base_app/student_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:multi_role_base_app/teacher_screen.dart';
import 'package:multi_role_base_app/admin_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Login Screen'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                           
                           Container(
                      decoration:  const BoxDecoration(
                        gradient:LinearGradient(
                          colors: [
                            Colors.deepOrange,
                            Colors.amber,
                            Colors.blue,

                          ],
                          

                        ),
                      ),
                    ),






              const Text(
                'Select User Type:',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 60),
                    child: InkWell(
                      onTap: () async {
                        SharedPreferences sp =
                            await SharedPreferences.getInstance();
                        sp.setString('userType', 'Student');
                      },
                      focusColor:Colors.amber,
                      hoverColor:Colors.amber,
                      highlightColor:Colors.amber,
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            'Student',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () async {
                      SharedPreferences sp =
                          await SharedPreferences.getInstance();
                      sp.setString('userType', 'Teacher');
                    },
                    highlightColor:Colors.amber,
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          'Teacher',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () async {
                      SharedPreferences sp =
                          await SharedPreferences.getInstance();
                      sp.setString('userType', 'Admin');
                    },
                    highlightColor:Colors.amber,
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          'Admin',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Email',
                    prefixIcon: Icon(Icons.email),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Password',
                    prefixIcon: Icon(Icons.lock_open),
                    suffixIcon: Icon(Icons.visibility_off),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Center(
                child: Column(children: [
                  InkWell(
                    onTap: () async {
                      SharedPreferences sp =
                          await SharedPreferences.getInstance();
                      sp.setString('email', emailController.toString());
                      sp.setString('pwd', passwordController.toString());
                      sp.setBool('isLoggedIn', true);

                      String uType = sp.getString('userType') ?? '';
                      if (uType == 'Student') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => StudentScreen())));
                      } else if (uType == 'Teacher') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => TeacherScreen())));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => AdminScreen())));
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(child: Text(
                        'Login',
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                        )),
                    ),
                  ),
                ]),
              ),
            ]),
      ),
    );
  }
}
