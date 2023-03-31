import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:joker/core/core.dart';
import 'package:joker/theme/app_style.dart';

class Button extends StatelessWidget {
  final String? text;
  final Color? color;
  final VoidCallback? onTap;
  const Button({super.key, this.text, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color:  color ,
        height: 50,
        width: 170,
        child: Center(
          child: Text(
            "$text",
            style: AppStyle.txtInterRegular21White,
          ),
        ),
      ),
    );
  }
}
