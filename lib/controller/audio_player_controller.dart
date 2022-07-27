import 'package:audio_streaming/model/radio_model.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

class AudioPlayerController with ChangeNotifier {
  final _audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);

  bool isPlaying = false;
  bool buffering = false;
  int playerId = 0;

  // audioPlayerMode(String url) {
  //   if (_audioPlayer.state == PlayerState.STOPPED) {
  //     isPlaying = true;
  //     buffering = true;
  //     _audioPlayer.play(url);
  //     notifyListeners();

  //     Future.delayed(const Duration(seconds: 10)).then((value) {
  //       buffering = false;
  //       notifyListeners();
  //     });
  //   } else {
  //     _audioPlayer.pause();
  //     isPlaying = false;
  //     buffering = false;
  //     notifyListeners();
  //   }
  // }

  playRadio(String url, int id) {
    if (id != playerId || !isPlaying) {
      isPlaying = true;
      buffering = true;
      _audioPlayer.play(url);
      playerId = id;

      notifyListeners();
    } else {
      _audioPlayer.stop();
      isPlaying = false;
      buffering = false;
      notifyListeners();
    }
  }

  // pauseRadio(String url, int id) {
  //   _audioPlayer.stop();
  //   isPlaying = false;
  //   buffering = false;
  //   notifyListeners();
  // }
}
