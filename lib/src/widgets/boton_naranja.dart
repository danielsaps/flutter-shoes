import 'package:flutter/material.dart';

class BotonNaranja extends StatelessWidget {
  final String texto;
  final bool small;
  final Color color;
  const BotonNaranja({
    Key? key,
    required this.texto,
    this.small = false,
    this.color = Colors.orange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: (this.small) ? 20 : 30),
      alignment: Alignment.center,
      height: (this.small) ? 30 : 50,
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        this.texto,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
