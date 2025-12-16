import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.menu, 
                color: Colors.black87, 
                size: 35
              ),
              Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/logo_discover.png'))),)
            ],
          ),
        ],
      ),
    );
  }
}
