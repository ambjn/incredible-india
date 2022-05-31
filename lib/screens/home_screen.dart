import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "incredible",
              style: TextStyle(
                  color: Colors.orange.shade900, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "india",
              style: TextStyle(
                  color: Colors.green.shade900, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
