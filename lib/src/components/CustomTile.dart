import 'package:audio_streaming/controller/audio_player_controller.dart';
import 'package:audio_streaming/model/radio_model.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTile extends StatelessWidget {
  late String title;
  late String category;
  late String url;
  late int id;

  CustomTile(
      {Key? key,
      required this.id,
      required this.url,
      required this.title,
      required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context);
    AudioPlayerController _audioController =
        Provider.of<AudioPlayerController>(context);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          _audioController.playRadio(url, id);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  color: _audioController.playerId == id
                      ? color.accentColor
                      : color.accentColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10)),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    category,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              child: Image.asset(
                'lib/src/assets/eq.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              height: 2,
              left: 2,
              child: Icon(
                _audioController.playerId == id
                    ? _audioController.isPlaying
                        ? Icons.pause
                        : Icons.play_circle
                    : null,
                color: color.primaryColor,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
