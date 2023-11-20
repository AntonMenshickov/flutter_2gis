import 'package:flutter/material.dart';
import 'package:flutter_2gis/gis_map_controller.dart';
import 'package:flutter_2gis/model/gis_camera_position.dart';
import 'package:flutter_2gis/model/gis_map_object.dart';

import 'package:flutter_2gis/view/dgis_map_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GisMapController controller;
  @override
  void initState() {
    controller = GisMapController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: Column(
            children: [
              Expanded(
                child: DGisMapView(
                  controller: controller,
                  startCameraPosition:
                      const GisCameraPosition(latitude: 0.0, longitude: 0.0),
                  onTapMarker: (marker) {
                    print(marker);
                  },
                  typeView: TypeView.platformView,
                ),
              ),
            ],
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                child: const Icon(Icons.zoom_in_outlined),
                onPressed: () async {
                  final status = await controller.increaseZoom(duration: 200);
                  print(status);
                },
              ),
              FloatingActionButton(
                child: const Icon(Icons.zoom_out_outlined),
                onPressed: () async {
                  final status = await controller.reduceZoom(duration: 200);
                  print(status);
                },
              ),
              FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () async {
                  final status = await controller.setRoute(RoutePosition(
                      finishLatitude: 55.752425,
                      finishLongitude: 37.613983,
                      startLatitude: 55.759909,
                      startLongitude: 37.618806));
                  print(status);
                },
              ),
              FloatingActionButton(
                child: const Icon(Icons.remove),
                onPressed: () async {
                  final status = await controller.removeRoute();
                  print(status);
                },
              ),
            ],
          )),
    );
  }
}
