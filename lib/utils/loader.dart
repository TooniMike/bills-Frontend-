import 'package:flutter/material.dart';

class LoadingIcon extends StatelessWidget {
  const LoadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Stack(alignment: Alignment.center, children: [
      const SizedBox(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(
            color: Colors.blueAccent,
          )),
      Center(child: Icon(Icons.payment, size: 30)),
    ]);
  }
}
