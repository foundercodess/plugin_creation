import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
  List imageData = [
    "https://images.unsplash.com/photo-1552072092-7f9b8d63efcb",
    "https://images.unsplash.com/flagged/photo-1574005280900-3ff489fa1f70",
    "https://images.unsplash.com/photo-1591117207239-788bf8de6c3b",
    "https://images.unsplash.com/photo-1555661530-68c8e98db4e6",
    "https://images.unsplash.com/photo-1618517048289-4646902edaf5"
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          imageData.length,
          (i) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Image.network(imageData[i]),
              )),
    );
  }
}

class ValidateUserPurchasing extends StatefulWidget {
  final String merchantKey;
  final String clientSecret;
  const ValidateUserPurchasing(
      {super.key, required this.merchantKey, required this.clientSecret});

  @override
  State<ValidateUserPurchasing> createState() => _ValidateUserPurchasingState();
}

class _ValidateUserPurchasingState extends State<ValidateUserPurchasing> {
  bool? isUserVerified;

  @override
  void initState() {
    verifyUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "Founder Code Technology",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.white),
            ),
            child: const Text(
              "100% Secured",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            children: [
              const Text(
                "Customer Authentication",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 15,
              ),
              isUserVerified == null
                  ? const CircularProgressIndicator(
                      color: Colors.purple,
                    )
                  : Column(
                      children: [
                        fieldUI("Merchant key", widget.merchantKey),
                        fieldUI("Client Secret", widget.clientSecret),
                        const SizedBox(
                          height: 10,
                        ),
                        isUserVerified == false
                            ? Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.grey)),
                                child: const Text(
                                  "Verification failed! provided credentials are incorrect..",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ))
                            : Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.grey)),
                                child: const Text(
                                  "Credentials Verification Successfully!",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                )),
                      ],
                    ),
              if(isUserVerified == true)
                ImageSlider(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> verifyUser() async {
    final res = await http.get(Uri.parse(
        "https://abhitestapi.indianfashstore.com/index.php?client_secret=${widget.clientSecret}&merchant_id=${widget.merchantKey}"));
    if (res.statusCode == 200) {
      final resData = jsonDecode(res.body);
      setState(() {
        isUserVerified = resData["success"];
      });
      if (resData["success"] == true) {
        if (kDebugMode) {
          print(resData);
        }
      }
    } else {
      if (kDebugMode) {
        print("server error");
      }
    }
  }

  Widget fieldUI(String label, String val) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(offset: const Offset(0, 1), color: Colors.grey.shade200)
      ]),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            enabled: false,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                labelText: val),
          )
        ],
      ),
    );
  }
}
