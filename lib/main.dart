import 'package:datemarker/login.dart';
import 'package:flutter/material.dart';
import 'notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initializeNotification();
  NotificationService()
      .showNotification(1, 'Date Calendar', 'Your Dates are all set!');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _textController = TextEditingController();
  String url = '';
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
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bgimg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Youtube URL and click   this     '
                        '  -> ',
                    hintStyle: const TextStyle(
                      fontFamily: 'Lobster',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          url = _textController.text;
                        });
                      },
                      icon: const Icon(Icons.upload),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/upload.png',
                    height: 38,
                    width: 28,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Upload the YT video url you want to extract dates',
                    style: TextStyle(
                      fontFamily: 'Caveat',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 19,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Builder(
                  builder: (context) => ElevatedButton(
                    child: const Text('Next'),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Login(
                                link: _textController.text,
                              )));
                    },
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
