import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:joker/core/core.dart';
import 'package:joker/core/ultis/size_utils.dart';
import 'package:joker/theme/app_style.dart';

class Header extends StatelessWidget {
  const Header({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        MainHeader(),
        MaximHeader(),
      ],
    );
  }
}

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
      child: Container(
        color: Colors.white,
        height: size.height * 0.08,
        child: Row(
          children: [
            //logo in the left
            Container(
              width: size.width * 0.2,
              child: Image.asset(
                "assets/images/logo.PNG",
                fit: BoxFit.contain,
              ),
            ),
            Spacer(),
            //text and avatar
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Handicrafted by",
                  style: AppStyle.txtInterRegular14Silver,
                ),
                Text(
                  "Jim HLS",
                  style: AppStyle.txtInterRegular14Black,
                )
              ],
            ),
            Container(
                width: size.width * 0.16,
                height: size.height * 0.065,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avt.jpeg"),
                )),
          ],
        ),
      ),
    );
  }
}

class MaximHeader extends StatelessWidget {
  const MaximHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstant.green,
      height: size.height * 0.23,
      width: size.width,
      //Maxim of the admin
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "A joke a day keeps the doctor away",
            style: AppStyle.txtInterRegular21White,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "If you joke wrong way, your teeth have to pay. (Serious)",
            style: AppStyle.txtInterRegular14White,
          )
        ],
      ),
    );
  }
}
