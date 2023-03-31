import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:joker/core/core.dart';
import 'package:joker/theme/app_style.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.19,
      width: size.width,
      child: Column(
        children: [
          Divider(
            thickness: 1,
            color: ColorConstant.silver,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 17, right: 17, top: 5, bottom: 15),
            child: Text(
              "This appis created as part of Hisolutions program. The materials con-tained on this website are provided for general information only and do not constitute any form of advice. HLS assumes no responsibilif for the accuracy of any particular statement and accepts no liability for any loss or damage which may arise from reliance on the infor-mation contained on this site.",
              style: AppStyle.txtInterRegular12Silver,
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            "Copyright 2021 HLS",
            style: AppStyle.txtInterRegular16Silver,
          )
        ],
      ),
    );
  }
}
