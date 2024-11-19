
import 'package:flutter/material.dart';

import 'plugin_creation_platform_interface.dart';

class PluginCreation {
  Future<String?> getPlatformVersion() {
    return PluginCreationPlatform.instance.getPlatformVersion();
  }
}


class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  List imageData=[
    "https://images.unsplash.com/photo-1552072092-7f9b8d63efcb",
    "https://images.unsplash.com/flagged/photo-1574005280900-3ff489fa1f70",
    "https://images.unsplash.com/photo-1591117207239-788bf8de6c3b",
    "https://images.unsplash.com/photo-1555661530-68c8e98db4e6",
    "https://images.unsplash.com/photo-1618517048289-4646902edaf5"
  ];
  @override
  Widget build(BuildContext context) {
    return  ListView(
        children: List.generate(imageData.length, (i)=> Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Image.network(imageData[i]),
        )),
    );
  }
}
