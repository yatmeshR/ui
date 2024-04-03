import 'package:flutter/material.dart';

class SaveTab extends StatefulWidget {
  const SaveTab({super.key});

  @override
  State<SaveTab> createState() => _SaveTabState();
}

class _SaveTabState extends State<SaveTab> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Save page"),
      ),
    );
  }
}
