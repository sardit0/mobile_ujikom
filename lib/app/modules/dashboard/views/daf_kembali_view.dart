import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DafKembaliView extends GetView {
  const DafKembaliView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DafKembaliView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DafKembaliView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
