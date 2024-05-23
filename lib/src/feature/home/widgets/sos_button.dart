import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:pulsator/pulsator.dart';
import 'package:sos_app/src/feature/home/cubit/sos_cubit.dart';
import 'package:sos_app/src/feature/home/widgets/home/dialog_confirm_distress.dart';

class SosButton extends StatefulWidget {

  final SosCubit _controller;

  const SosButton({super.key, required SosCubit controller}): _controller = controller;

  @override
  State<SosButton> createState() => _SosButtonState();
}

class _SosButtonState extends State<SosButton> with TickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SosCubit, SosState>(
      bloc: context.get(),
      builder: (context, state) {
        
        if (state is SosOnDistress) {
          _controller?.forward();
        } else {
          _controller?.stop();
          _controller?.reset();
        }

        return Pulsator(
          onCreated: (controller) {
            _controller = controller;
          },
          style: const PulseStyle(
            color: Colors.red,
          ),
          count: (state is SosOnDistress) ? 10 : 1,
          autoStart: false,
          child: SizedBox(
            width: 150,
            height: 150,
            child: RawMaterialButton(
                fillColor: Colors.red,
                shape: const CircleBorder(),
                onPressed: () async {
                  if (state is SosOnDistress) {
                    widget._controller.desativarSos();
                  } else {
                    final result = await showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (_) => const ConfirmDialog()
                    );
                    if (result == true) {
                      widget._controller.acionarSos();
                    }
                  }
                },
                child: const Text('SOS',
                    style: TextStyle(color: Colors.white, fontSize: 30))),
          ),
        );
      },
    );
  }
}
