import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DafPinjamView extends GetView {
  const DafPinjamView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DafPinjamView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DafPinjamView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
