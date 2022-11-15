import 'package:flutter/material.dart';

class KSubmitButton extends StatelessWidget {
  const KSubmitButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Center(child: Text(title)),
      ),
    );
  }
}
