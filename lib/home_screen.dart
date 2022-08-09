import 'package:flutter/material.dart';
import 'package:multi_role_base_app/login_screen.dart';
import 'package:multi_role_base_app/student_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: const Text('Home Screen'),
        ),
        body: Column(
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
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,

                        ),
                      ),
                    ),





              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(child: Text('LogIn')),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(child: Text('SignUp')),
                ),
              ),
            ]),
      ),
    );
  }
}
