import 'package:flutter/material.dart';

/// displays a loading spinner
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) => const Center(
        child: CircularProgressIndicator.adaptive(),
      );
}
