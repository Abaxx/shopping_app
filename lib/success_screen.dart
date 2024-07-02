

import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Success'),
      ),
      body: const Center(
        child:  Text('Your Order is Successful!'),
      ),
    );
  }

}