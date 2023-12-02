import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'API.dart';
import 'main.dart';

class Conformdates extends StatefulWidget {
  final String link;
  const Conformdates({super.key, required this.link});

  @override
  State<Conformdates> createState() => _ConformdatesState();
}

class _ConformdatesState extends State<Conformdates> {
  YoutubePlayerController? _controller;
  @override
  void initState() {
    super.initState();
    var videoIdd = YoutubePlayer.convertUrlToId(widget.link);
    _controller = YoutubePlayerController(
      initialVideoId:
          '$videoIdd', // https://www.youtube.com/watch?v=Tb9k9_Bo-G4
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        isLive: false,
      ),
    );
  }

  String url = 'http://127.0.0.1:5000/gpi?Query=cwkmBhKrA6s';
  // ignore: prefer_typing_uninitialized_variables
  var data;
  String queryText = 'Sample';
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: YoutubePlayer(
                    controller: _controller!,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.amber,
                    progressColors: const ProgressBarColors(
                      playedColor: Colors.amber,
                      handleColor: Colors.amberAccent,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 0.0, right: 8.2),
                  child: Row(
                    children: [
                      ElevatedButton(
                        child: const Text('Get'),
                        onPressed: () {
                          setState(() {
                            url = 'http://10.0.2.2:5000/gpi?Query='+widget.link;
                          });
                        },
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          data = await getdata(url);
                          var decode = data;
                          setState(() {
                            queryText = decode['Query'];
                          });
                        },
                        child: const Icon(Icons.search),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Container(
                    color: Colors.black45,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              queryText,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 8.2),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Builder(
                    builder: (context) => ElevatedButton(
                      child: const Text('Next'),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const MyApp()));
                        //Marking(
                        //  link: queryText,
                        //)));
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
