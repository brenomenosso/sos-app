import 'package:flutter/material.dart';
import 'package:sos_app/src/feature/home/cubit/sos_cubit.dart';
import 'package:sos_app/src/feature/home/widgets/home/alarm_button.dart';
import 'package:sos_app/src/feature/home/widgets/home/torch_button.dart';
import 'package:sos_app/src/feature/home/widgets/user_config/user_module.dart';
import 'package:sos_app/src/feature/home/widgets/home/map_button.dart';
import 'package:sos_app/src/feature/home/widgets/sos_button.dart';

class HomePage extends StatefulWidget {

  final SosCubit controller;

  const HomePage({super.key, required this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton.filled(
          onPressed: () {
            showModalBottomSheet(
              context: context, 
              showDragHandle: true,
              isScrollControlled: true,
              constraints: BoxConstraints.expand(height: MediaQuery.of(context).size.height * 0.7),
              builder: (_) => const UserModule()
            );
          }, 
          icon: const Icon(Icons.person, color: Colors.white)
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(child:SosButton(controller: widget.controller)),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            AlarmButton(),
            TorchButton(),
            MapButton(),
          ])
        ],
      )
    );
  }
}