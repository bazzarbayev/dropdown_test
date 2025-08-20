import 'package:flutter/material.dart';

class SelectedResultScreen extends StatelessWidget {
  final String countryName;
  final String stateName;

  const SelectedResultScreen({
    super.key,
    required this.countryName,
    required this.stateName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Selected Result")),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Country: $countryName",
                  style: const TextStyle(fontSize: 20)),
              Text("State: $stateName", style: const TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
