import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context);
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: Center(child: Text('tese')),
      ),
      backgroundColor: color.primaryColor,
    ));
  }
}
