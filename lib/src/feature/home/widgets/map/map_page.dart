import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:sos_app/src/feature/home/widgets/map/cubit/map_cubit.dart';
import 'package:sos_app/src/feature/home/widgets/map/widgets/list_users.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      context.get<MapCubit>().getLocation();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MapCubit, MapState>(
        bloc: context.get<MapCubit>(),
        builder: (context, state) {
          if (state is MapError) {
          }
          else if (state is MapInitial) {
          }
          else if (state is MapLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (state is MapLoaded) {
            return ListUsers(users: state.users);
          }
          else if (state is MapEmpty) {
            return const Center(child: Text('Ufa ninguém para ser resgatado!'));
          }
          return Container();       
        },
      ),
    );
  }
}
