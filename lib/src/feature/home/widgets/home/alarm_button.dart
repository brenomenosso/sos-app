import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class AlarmButton extends StatefulWidget {
  

  const AlarmButton({super.key});

  @override
  State<AlarmButton> createState() => _AlarmButtonState();
}

class _AlarmButtonState extends State<AlarmButton> {

  bool enabled = false;
  AudioPlayer? audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = context.get();
    audioPlayer!.setSource(AssetSource('audios/siren.wav'));
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      heroTag: 'alarm_button',
      shape: const CircleBorder(),
      backgroundColor: Colors.green,
      onPressed: () {
        setState(() {
          enabled = !enabled;
          if (enabled) {
            audioPlayer!.resume();
          } else {
            audioPlayer!.stop();
          }
        });
      },
      child: Icon( (enabled) ? Icons.volume_off : Icons.volume_up, color: Colors.white, size: 20)
    );
  }
}