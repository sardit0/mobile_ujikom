import 'package:flutter/material.dart';

import 'package:get/get.dart';

class YourLoanView extends GetView {
  const YourLoanView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YourLoanView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'YourLoanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
