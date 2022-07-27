import 'package:audio_streaming/controller/audio_player_controller.dart';
import 'package:audio_streaming/controller/repository.dart';
import 'package:audio_streaming/src/components/CustomTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repository = Repository();
    final color = Theme.of(context);
    final _audioController = Provider.of<AudioPlayerController>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('teste'),
            Expanded(
              flex: 1,
              child: GridView(
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: repository.radioRepository.map((radio) {
                    return CustomTile(
                      id: radio.id,
                      url: radio.url,
                      category: radio.category,
                      title: radio.name,
                      color: color.accentColor,
                    );
                  }).toList()),
            ),
            Text('teste')
          ],
        ),
      ),
    );
  }
}
