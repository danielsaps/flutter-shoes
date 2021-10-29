import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String texto;

  const CustomAppBar({required this.texto});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        height: 50,
        child: Row(
          children: [
            Text(
              this.texto,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            Spacer(),
            Icon(
              Icons.search,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
