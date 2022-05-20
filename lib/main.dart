import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

AudioPlayer audioPlayer = AudioPlayer(
  mode: PlayerMode.MEDIA_PLAYER,
);

const _url = 'http://stream.zeno.fm/bk7mykpmzrhvv';
bool _isPlaying = false;
bool _buffer = false;
var backgroundColor = Colors.green;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: const AssetImage('assets/background.png'),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  child: Center(
                    child: Container(
                      child: Image.asset(
                        'assets/logo/logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              _buffer
                  ? CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Container(),
              SizedBox(
                height: 10,
              ),
              _isPlaying
                  ? Column(
                      children: [
                        const Text(
                          'Rádio Formosa',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                        const Text(
                          'reproduzindo agora',
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        const Text(
                          'Rádio Formosa',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        const Text(
                          'Pausado, aperte no play para iniciar!',
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ],
                    ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: (() {}),
                      child: Column(
                        children: [
                          Container(
                            child: const Center(
                              child: Icon(
                                Icons.message,
                                color: Colors.black,
                              ),
                            ),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(90)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Mensagem',
                              style: TextStyle(
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isPlaying
                              ? audioPlayer.stop().then(
                                  (value) => backgroundColor = Colors.green)
                              : audioPlayer.play(_url).then((value) {
                                  _buffer = true;
                                  backgroundColor = Colors.red;
                                  Future.delayed(const Duration(seconds: 5),
                                      () {
                                    _buffer = false;
                                    setState(() {}); // Prints after 1 second.
                                  });
                                });
                          _isPlaying = !_isPlaying;
                          print(_isPlaying);
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            child: Center(
                              child: Icon(
                                !_isPlaying ? Icons.play_arrow : Icons.pause,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius: BorderRadius.circular(90)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            _isPlaying ? 'Pausar' : 'Reproduzir',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
