import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:sos_app/src/feature/home/cubit/sos_cubit.dart';
import 'package:sos_app/src/feature/home/widgets/home/alarm_button.dart';
import 'package:sos_app/src/feature/home/widgets/home/torch_button.dart';
import 'package:sos_app/src/feature/home/widgets/user_config/user_module.dart';
import 'package:sos_app/src/feature/home/widgets/home/map_button.dart';
import 'package:sos_app/src/feature/home/widgets/sos_button.dart';
//import 'package:torch_controller/torch_controller.dart';
//import 'package:audioplayers/audioplayers.dart';
class HomePage extends StatefulWidget {
  final SosCubit controller;

  const HomePage({super.key, required this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? timer;
  bool? backgroundColor;
  //TorchController controller = TorchController();

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SosCubit, SosState>(
      bloc: context.get(),
      listener: (context, state) {
        if (state is SosOffDistress) {
          //Desliga som de sirene ao disparar sos
          //context.get<AudioPlayer>().stop();
          setState((){
            backgroundColor = null;
          });
          timer?.cancel();
        } else if (state is SosOnDistress) {
          //Liga lanterna ao disparar sos
          //controller.toggle();
          //Dispara som de sirene ao disparar sos
          //context.get<AudioPlayer>().resume();
          timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
            setState((){
                backgroundColor = switch (backgroundColor) {
                true => false,
                false => true,
                _ => true
              };
            });
          });
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        color: switch (backgroundColor) {
          true => Colors.blue.shade900,
          false => Colors.red.shade900,
          _ => Colors.white
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton.filled(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        showDragHandle: true,
                        isScrollControlled: true,
                        constraints: BoxConstraints.expand(
                            height: MediaQuery.of(context).size.height * 0.7),
                        builder: (_) => const UserModule());
                  },
                  icon: const Icon(Icons.person, color: Colors.white)),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(child: SosButton(controller: widget.controller)),
                const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AlarmButton(),
                      TorchButton(),
                      MapButton(),
                    ])
              ],
            )),
      ),
    );
  }
}
