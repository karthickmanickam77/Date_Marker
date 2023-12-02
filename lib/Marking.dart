import 'package:flutter/material.dart';
import 'main.dart';

class Marking extends StatefulWidget {
  final String link;
  const Marking({super.key, required this.link});

  @override
  State<Marking> createState() => _MarkingState();
}

class _MarkingState extends State<Marking> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Marker.png',
                  height: 60,
                  width: 40,
                ),
                const SizedBox(
                  width: 17,
                ),
                const Text(
                  'Date Marker',
                  style: TextStyle(
                      fontSize: 25, fontFamily: 'Caveat', color: Colors.black),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.grey,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: const Text(
                  'Marked Successfully',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
              Image.asset(
                'assets/images/tick.png',
                height: 70,
                width: 90,
              ),
              Container(
                color: Colors.black45,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Text('Your Dates Are:  '),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.link,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Builder(
                    builder: (context) => ElevatedButton(
                      child: const Text('Keep Marking'),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const MyApp()));
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
