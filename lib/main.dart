import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _currentAssetNum = 0;
  var _currentAsset = 'assets/nike_air_zoom_pegasus_36.glb';
  Key _refreshKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Model Viewer'),
          actions: [
            IconButton(
              icon: const Icon(Icons.update),
              tooltip: 'Botão',
              onPressed: () {
                setState(() {
                  _currentAssetNum += 1;

                  if (_currentAssetNum > 5) {
                    _currentAssetNum = 0;
                  }

                  if (_currentAssetNum == 0) {
                    _currentAsset = 'assets/nike_air_zoom_pegasus_36.glb';
                  }
                  if (_currentAssetNum == 1) {
                    _currentAsset = 'assets/revolver.glb';
                  }
                  if (_currentAssetNum == 2) {
                    _currentAsset =
                        'assets/2005_bmw_m3_e46_gtr_-_nfs_most_wanted.glb';
                  }
                  if (_currentAssetNum == 3) {
                    _currentAsset = 'assets/Astronaut.glb';
                  }
                  if (_currentAssetNum == 4) {
                    _currentAsset = 'assets/excavator_3d_model.glb';
                  }
                  if (_currentAssetNum == 5) {
                    _currentAsset =
                        'assets/nickelodeon_all-star_brawl_spongebob.glb';
                  }

                  _refreshKey = UniqueKey();
                });
              },
            ),
          ],
        ),
        body: ModelViewer(
          src: _currentAsset,
          key: _refreshKey,
          ar: true,
          innerModelViewerHtml:
              '<button class="hotspot" slot="hotspot-hand" data-position="-0.54 0.93 0.1" data-normal="-0.73 0.05 0.69"><div class="annotation"></div>',
          relatedJs: '',
          relatedCss:
              ".hotspot { display: block; width: 20px; height: 20px; border-radius: 10px; border: none; background-color: blue;box-sizing: b0order-box; pointer-events: none;} .hotspot[slot='hotspot-hand'] { --min-hotspot-opacity: 0; background-color: red;} .annotation { background-color: #888888; position: absolute; transform: translate(10px, 10px); border-radius: 10px; padding: 10px; } :not(:defined)>* { display: none; }",        ),
      ),
    );
  }
}
