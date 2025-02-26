import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentAssetNum = 0;
  String _currentAsset = 'assets/nike_air_zoom_pegasus_36.glb';
  Map<int, String> dictAssets = {
    0: 'assets/nike_air_zoom_pegasus_36.glb',
    1: 'assets/revolver.glb',
    2: 'assets/2005_bmw_m3_e46_gtr_-_nfs_most_wanted.glb',
    3: 'assets/Astronaut.glb',
    4: 'assets/excavator_3d_model.glb',
    5: 'assets/nickelodeon_all-star_brawl_spongebob.glb',
  };

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

                  if (_currentAssetNum > dictAssets.length) {
                    _currentAssetNum = 0;
                  }

                  _currentAsset = dictAssets[_currentAssetNum]!;

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
              ".hotspot { display: block; width: 20px; height: 20px; border-radius: 10px; border: none; background-color: blue;box-sizing: b0order-box; pointer-events: none;} .hotspot[slot='hotspot-hand'] { --min-hotspot-opacity: 0; background-color: red;} .annotation { background-color: #888888; position: absolute; transform: translate(10px, 10px); border-radius: 10px; padding: 10px; } :not(:defined)>* { display: none; }",
        ),
      ),
    );
  }
}