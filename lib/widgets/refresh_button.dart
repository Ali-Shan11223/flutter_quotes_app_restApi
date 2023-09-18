
import 'package:flutter/material.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.width * 0.16,
      width: size.width * 0.16,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
      child: const Icon(
        Icons.refresh_outlined,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}