import 'package:flutter/material.dart';
import 'package:resume_creator/Drawer.dart';
import 'package:resume_creator/resume_creator/resume_creator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: <Color>[Colors.purple, Colors.blue]),
          ),
        ),
        actions: [
          Image.asset('assets/ResumerLogo.png'),
        ],
        title: const Text('Resume'),
      ),
      body: Container(
        alignment: Alignment.center,
        width: 400,
        height: 40,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => ResumeCreator(),
                ),
              );
            },
            child: const Text('Create My Resume'),
          ),
        ),
      ),
    );
  }
}
