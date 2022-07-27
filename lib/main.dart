import 'package:audio_streaming/controller/audio_player_controller.dart';
import 'package:audio_streaming/model/radio_model.dart';
import 'package:audio_streaming/views/home_page.dart';
import 'package:audio_streaming/views/player_page.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => AudioPlayerController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: const Color.fromARGB(255, 239, 47, 76),
        primaryColor: const Color.fromARGB(255, 75, 94, 115),
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/player': (context) => const PlayerPage()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
