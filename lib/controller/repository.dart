import 'dart:math';

import 'package:audio_streaming/model/radio_model.dart';

class Repository {
  final List<RadioModel> radioRepository = [
    RadioModel(
        id: 1,
        category: 'Eclética',
        name: 'Show de Sucessos',
        url: 'http://stream.zeno.fm/bk7mykpmzrhvv'),
    RadioModel(
        id: 2,
        category: 'Gospel',
        name: 'Rádio Vida',
        url: 'http://stream.zeno.fm/mh339s5kxxhvv'),
    RadioModel(
        id: 3,
        category: 'Country',
        name: 'Forro 24',
        url: 'http://stream.zeno.fm/14xwnd1hyxhvv'),
    RadioModel(
        id: 4,
        category: 'Instrumental',
        name: 'Concert',
        url: 'http://stream.zeno.fm/d2a5kg5hyxhvv'),
  ];
}
