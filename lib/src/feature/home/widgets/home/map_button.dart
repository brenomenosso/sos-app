import 'package:flutter/material.dart';
import 'package:sos_app/src/feature/home/widgets/map/map_module.dart';

class MapButton extends StatefulWidget {
  const MapButton({super.key});

  @override
  State<MapButton> createState() => _MapButtonState();
}

class _MapButtonState extends State<MapButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
        heroTag: 'map_button', 
        onPressed: () {
          showModalBottomSheet(context: context, builder: (context) => const MapModule());        
        }, 
        child: const Icon(Icons.flood_outlined)
    );
  }
}
