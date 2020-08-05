import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

main() {
  runApp(Task());
}

class Task extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);
  @override
  _HomepageState createState() => new _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool played = false;
  bool vol = true;
  AudioPlayer audioPlayer = AudioPlayer();
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    _controller = VideoPlayerController.network(
        //'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        'https://github.com/navsin189/vid/blob/master/funny.mp4?raw=true');
    _initializeVideoPlayerFuture = _controller.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names

    //AudioPlayer.logEnabled = true;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Music Player',
          style: TextStyle(color: Colors.teal),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.settings), onPressed: null),
          IconButton(
            icon: Icon(Icons.account_box),
            onPressed: null,
          ),
        ],
        leading: Image.asset('pic/images/14.jpg'),
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  color: Colors.white,
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '  Follow ',
                        style: TextStyle(
                            color: Colors.teal, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '  us',
                        style: TextStyle(
                            color: Colors.teal, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(left: 5),
                alignment: Alignment.center,
                width: 120,
                height: 50,
                child: Image.asset('pic/images/linkedin.png'),
              ),
              Container(
                alignment: Alignment.center,
                width: 90,
                height: 50,
                child: Image.asset('pic/images/fb.png'),
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 100,
                child: Image.asset('pic/images/instagram.jpg'),
              ),
            ],
          ),
        ),
      ),
      body: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 180,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 24, left: 10, bottom: 25),
                      width: 120,
                      height: 180,
                      //alignment: Alignment.center,
                      child: RaisedButton(
                        color: Colors.white,
                        onPressed: () {
                          AudioCache().play('audio/nokia.mp3');
                        },
                        child: Image.asset(
                          'pic/images/dhun.jpg',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      margin: EdgeInsets.only(top: 14, left: 5, bottom: 15),
                      width: 120,
                      height: 180,
                      //color: Colors.red,
                      child: RaisedButton(
                        color: Colors.white,
                        onPressed: () => AudioCache().play('audio/krishna.mp3'),
                        child: Image.asset(
                          'pic/images/12.jpg',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 24, left: 5, bottom: 25),
                      width: 120,
                      height: 180,
                      //color: Colors.yellowAccent,
                      child: RaisedButton(
                          color: Colors.white,
                          onPressed: () async {
                            String path =
                                'https://github.com/navsin189/vid/blob/master/baby.mp3?raw=true';

                            await audioPlayer.play(path, isLocal: true);
                          },
                          child: Image.asset('pic/images/13.jpg')),
                    ),
                  ],
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.blue),
                  margin: EdgeInsets.all(20),
                  width: double.infinity,
                  height: 100,
                  //color: Colors.blue.shade600,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 77,
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(20),
                        child: IconButton(
                            icon: Icon(
                              played ? Icons.pause : Icons.play_arrow,
                              size: 40,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              if (played) {
                                audioPlayer.pause();
                                setState(() {
                                  played = false;
                                });
                              } else {
                                audioPlayer.resume();
                                setState(() {
                                  played = true;
                                });
                              }
                            }),
                      ),
                      Container(
                        width: 77,
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(20),
                        child: IconButton(
                            icon:
                                Icon(Icons.stop, size: 40, color: Colors.white),
                            onPressed: () {
                              audioPlayer.stop();
                              setState(() {
                                played = false;
                              });
                            }),
                      ),
                      Container(
                          width: 77,
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(20),
                          child: IconButton(
                              icon: Icon(
                                vol ? Icons.volume_up : Icons.volume_off,
                                size: 40,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                if (vol) {
                                  audioPlayer..setVolume(0.0);
                                  setState(() {
                                    vol = false;
                                  });
                                } else {
                                  audioPlayer..setVolume(1.0);
                                  setState(() {
                                    vol = true;
                                  });
                                }
                              }))
                    ],
                  )),
              Container(
                  margin:
                      EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
                  width: double.infinity,
                  height: 200,
                  color: Colors.white,
                  child: FutureBuilder(
                      future: _initializeVideoPlayerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: GestureDetector(
                                onTap: () {
                                  if (!_controller.value.isPlaying) {
                                    setState(() {});
                                    _controller.initialize();
                                  }
                                },
                                child: VideoPlayer(_controller)),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      }))
            ],
          )),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        Container(
            margin: EdgeInsets.all(10),
            child: FloatingActionButton(
                child: Icon(Icons.audiotrack),
                onPressed: () async {
                  String path = await FilePicker.getFilePath();

                  int status = await audioPlayer.play(path, isLocal: true);
                  if (status == 1) {
                    setState(() {
                      played = true;
                    });
                  }
                })),
        FloatingActionButton(
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
          onPressed: () {
            setState(() {
              // If the video is playing, pause it.
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                // If the video is paused, play it.
                _controller.play();
              }
            });
          },
        ),
      ]),
    );
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }
}
