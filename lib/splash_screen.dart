import 'package:flutter/material.dart';
import 'home_page.dart'; 

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PostListScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.article, size: 100, color: Colors.black),
            SizedBox(height: 20),
            Text("Loading Posts...", style: TextStyle(fontSize: 20, color: Colors.black)),
            SizedBox(height: 20),
            CircularProgressIndicator(color: Colors.black), 
          ],
        ),
      ),
    );
  }
}
